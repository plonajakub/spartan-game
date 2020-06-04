library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;

use work.graphics_constants.all;
use work.graphic_controller_constants.all;

entity graphic_controller is
  port (
    clock          : in  std_logic;
    command_rdy    : in  std_logic;                     -- **impulse**
    command        : in  graphic_controller_command_type;
    in_gr_id       : in  natural;
    in_gr_row_idx  : in  natural;
    in_gr_col_idx  : in  natural;
    ascii_to_write : in  std_logic_vector (7 downto 0);
    ascii_out      : out std_logic_vector (7 downto 0)  -- for VGAtxt module
    );
end graphic_controller;

architecture Behavioral of graphic_controller is

  signal ram_gr_visible : GR_IS_VISIBLE_TYPE := GR_IS_VISIBLE;
  signal ram_gr_pos     : GR_POS_ARR_TYPE    := GR_POS_ARR;

  -- Video RAM
  constant VRAM_ADDR_WIDTH : natural   := natural(ceil(log2(real(N_SCN_ROW * N_SCN_COL))));  -- total screen fields
  constant VRAM_DATA_WIDTH : natural   := 8;  -- ascii size
  type VRAM_TYPE is array (0 to 2 ** VRAM_ADDR_WIDTH - 1) of std_logic_vector (VRAM_DATA_WIDTH - 1 downto 0);
  signal vram              : VRAM_TYPE := (others => X"00");

  -- Screen iteration for VGAtxt module
  signal cur_row : natural := 0;
  signal cur_col : natural := 0;

begin

  decode_command : process(clock, command_rdy)
  begin
    if rising_edge(clock) then
      if command_rdy = '1' then
        if command = CMD_MOVE then
          ram_gr_pos(in_gr_id)(0) <= in_gr_row_idx;
          ram_gr_pos(in_gr_id)(1) <= in_gr_col_idx;
        elsif command = CMD_PLACE then
          vram(sidx(in_gr_row_idx, in_gr_col_idx)) <= ascii_to_write;
        elsif command = CMD_SHOW then
          ram_gr_visible(in_gr_id) <= '1';
        elsif command = CMD_HIDE then
          ram_gr_visible(in_gr_id) <= '0';
        else
          null;
        end if;
      end if;
    end if;
  end process;


  screen_refresh_counter : process(clock)
  begin
    if rising_edge(clock) then
      if cur_col >= N_SCN_COL - 1 then
        cur_col <= 0;
        if cur_row >= N_SCN_ROW - 1 then
          cur_row <= 0;
        else
          cur_row <= cur_row + 1;
        end if;
      else
        cur_col <= cur_col + 1;
      end if;
    end if;
  end process;

  ascii_out <= vram(sidx(cur_row, cur_col));

end Behavioral;
