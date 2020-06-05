library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;

use work.graphics_constants.all;
use work.graphic_controller_constants.all;

entity graphic_controller is
  port (
    clock           : in  std_logic;
    command_rdy     : in  std_logic;                     -- **impulse**
    command         : in  graphic_controller_command_type;
    in_gr_id        : in  natural;
    in_gr_row_idx   : in  natural;
    in_gr_col_idx   : in  natural;
    string_to_write : in  GR_ELEMENT_REP_TYPE;
    ascii_out       : out std_logic_vector (7 downto 0)  -- for VGAtxt module
    );
end graphic_controller;

architecture Behavioral of graphic_controller is

  component graphic_controller_sm
    port (
      clock                   : in  std_logic;
      s_reset                 : in  std_logic;
      next_screen_write_stage : in  std_logic;
      cur_screen_write_stage  : out std_logic
      );
  end component graphic_controller_sm;


  signal ram_gr_visible : GR_IS_VISIBLE_TYPE := GR_IS_VISIBLE;
  signal ram_gr_pos     : GR_POS_ARR_TYPE    := GR_POS_ARR;

  constant REP_RAM_ADDR_WIDTH : natural := natural(ceil(log2(real(N_GRAPHIC_ELEMENTS * GR_ELEMENT_MAX_REP_LEN))));
  constant REP_RAM_DATA_WIDTH : natural := 8;  -- ascii size
  type REP_RAM_TYPE is array (0 to 2 ** REP_RAM_ADDR_WIDTH - 1) of std_logic_vector(REP_RAM_DATA_WIDTH - 1 downto 0);
  signal ram_gr_rep : REP_RAM_TYPE := (
    GR_REP_ARR(0)(0), GR_REP_ARR(0)(1), GR_REP_ARR(0)(2), GR_REP_ARR(0)(3), GR_REP_ARR(0)(4),
    GR_REP_ARR(1)(0), GR_REP_ARR(1)(1), GR_REP_ARR(1)(2), GR_REP_ARR(1)(3), GR_REP_ARR(1)(4),
    GR_REP_ARR(2)(0), GR_REP_ARR(2)(1), GR_REP_ARR(2)(2), GR_REP_ARR(2)(3), GR_REP_ARR(2)(4)
    );

  -- Video RAM
  constant VRAM_ADDR_WIDTH : natural   := natural(ceil(log2(real(N_SCN_ROW * N_SCN_COL))));  -- total screen fields
  constant VRAM_DATA_WIDTH : natural   := 8;  -- ascii size
  type VRAM_TYPE is array (0 to 2 ** VRAM_ADDR_WIDTH - 1) of std_logic_vector (VRAM_DATA_WIDTH - 1 downto 0);
  signal vram              : VRAM_TYPE := (others => X"00");

  -- Screen iteration for VGAtxt module
  signal cur_row : natural := 0;
  signal cur_col : natural := 0;

  -- graphic_controller_sm
  signal i_s_reset                 : std_logic := '0';
  signal i_next_screen_write_stage : std_logic := GET_GR_EL_ID;
  signal i_cur_screen_write_stage  : std_logic;

  -- graphics cache
  signal cur_gr_el_id         : natural := N_GRAPHIC_ELEMENTS - 1;
  signal cur_gr_el_pos_offset : natural := 0;

begin

  graphic_controller_sm_i : graphic_controller_sm
    port map (
      clock                   => clock,
      s_reset                 => i_s_reset,
      next_screen_write_stage => i_next_screen_write_stage,
      cur_screen_write_stage  => i_cur_screen_write_stage
      );

  decode_command : process(clock, command_rdy)
  begin
    if rising_edge(clock) then
      if command_rdy = '1' then
        if command = CMD_MOVE then
          ram_gr_pos(in_gr_id)(0) <= in_gr_row_idx;
          ram_gr_pos(in_gr_id)(1) <= in_gr_col_idx;
        elsif command = CMD_PLACE then
          ram_gr_rep(roidx(in_gr_id, 0)) <= string_to_write(0);  -- TODO write n elements (not only one as here)
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

  vram_write : process(clock)
  begin
    if rising_edge(clock) then
      if i_cur_screen_write_stage = GET_GR_EL_ID then
        if cur_gr_el_id >= N_GRAPHIC_ELEMENTS - 1 then
          cur_gr_el_id <= 0;
        else
          cur_gr_el_id <= cur_gr_el_id + 1;
        end if;
        cur_gr_el_pos_offset      <= 0;
        i_next_screen_write_stage <= WRITE_GR_EL;
      elsif i_cur_screen_write_stage = WRITE_GR_EL then
        if ram_gr_visible(cur_gr_el_id) = '1' and cur_gr_el_pos_offset < GR_LEN_ARR(cur_gr_el_id) then
          vram(soidx(ram_gr_pos(cur_gr_el_id)(0), ram_gr_pos(cur_gr_el_id)(1), cur_gr_el_pos_offset))
            <= ram_gr_rep(roidx(cur_gr_el_id, cur_gr_el_pos_offset));
          cur_gr_el_pos_offset <= cur_gr_el_pos_offset + 1;
        else
          i_next_screen_write_stage <= GET_GR_EL_ID;
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
