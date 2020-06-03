library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use IEEE.math_real.all;

use work.graphics_constants.all;
use work.graphic_controller_constants.all;

entity graphic_controller is
  port (
    clock               : in  std_logic;
    command_rdy         : in  std_logic;
    command             : in  graphic_controller_command_type;  -- **impulse**
    graphics_id         : in  integer;
    graphics_position_y : in  integer;  -- row idx
    graphics_position_x : in  integer;  -- col idx
    ascii_to_write      : in  std_logic_vector (7 downto 0);
    ascii_out           : out std_logic_vector (7 downto 0)  -- for VGAtxt module
    );
end graphic_controller;

architecture Behavioral of graphic_controller is

  -- Current graphics state
  constant GIRAM_ADDR_WIDTH : integer := integer(ceil(log2(real(N_GRAPHIC_ELEMENTS * N_SCN_ROW * N_SCN_COL))));
  constant GIRAM_DATA_WIDTH : integer := 8;
  type graphic_elements_index_ram_type is array(2 ** GIRAM_ADDR_WIDTH - 1 downto 0) of std_logic_vector(GIRAM_DATA_WIDTH - 1 downto 0);

  signal graphic_elements_index_ram : graphic_elements_index_ram_type := (others => X"00");
  signal cur_gr_visible             : bool_array                      := gr_visible;

  signal cur_el  : integer := 0;
  signal cur_row : integer := 0;
  signal cur_col : integer := 0;

  constant VRAM_ADDR_WIDTH : integer := integer(ceil(log2(real(N_SCN_ROW * N_SCN_COL))));
  constant VRAM_DATA_WIDTH : integer := 8;
  type vram_type is array (2 ** VRAM_ADDR_WIDTH - 1 downto 0) of std_logic_vector (VRAM_DATA_WIDTH - 1 downto 0);

  signal vram : vram_type := (others => X"00");

begin

  decode_command : process(clock, command, ascii_to_write)
  begin
    if rising_edge(clock) then
      if command_rdy = '1' then
        if command = CMD_MOVE then
          null;
        elsif command = CMD_PLACE then
          graphic_elements_index_ram(ridx(graphics_id, graphics_position_y, graphics_position_x)) <= ascii_to_write;
        elsif command = CMD_SHOW then
          cur_gr_visible(graphics_id) <= '1';
        elsif command = CMD_HIDE then
          cur_gr_visible(graphics_id) <= '0';
        else
          null;
        end if;
      end if;
    end if;
  end process;


  screen_refresh_counter : process(clock)
  begin
    if rising_edge(clock) then
      if cur_col >= N_SCN_COL then
        cur_col <= 0;
        cur_row <= cur_row + 1;
        if cur_row >= N_SCN_ROW then
          cur_row <= 0;
          cur_el  <= cur_el + 1;
          if cur_el >= N_GRAPHIC_ELEMENTS then
            cur_el <= 0;
          else
            cur_el <= cur_el + 1;
          end if;
        else
          cur_row <= cur_row + 1;
        end if;
      else
        cur_col <= cur_col + 1;
      end if;
    end if;
  end process;

  -- Assign each ascii denoted by screen_refresh_counter process

  update_vram : process(clock, cur_el, cur_row, cur_col)
  begin
    if rising_edge(clock) then
      if cur_gr_visible(cur_el) = '1' and graphic_elements_index_ram(ridx(cur_el, cur_row, cur_col)) /= X"00" then
        vram(N_SCN_COL * cur_row + cur_col) <= graphic_elements_index_ram(ridx(cur_el, cur_row, cur_col));
      else
        vram(N_SCN_COL * cur_row + cur_col) <= X"00";
      end if;
    end if;
  end process;


  ascii_out <= vram(N_SCN_COL * cur_row + cur_col);

end Behavioral;
