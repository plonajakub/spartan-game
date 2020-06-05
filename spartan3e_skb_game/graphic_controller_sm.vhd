library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.graphic_controller_constants.all;

entity graphic_controller_sm is
  port (
    clock                   : in  std_logic;
    s_reset                 : in  std_logic;
    next_screen_write_stage : in  std_logic;
    cur_screen_write_stage  : out std_logic
    );
end graphic_controller_sm;

architecture Behavioral of graphic_controller_sm is

  type screen_write_state is (
    st0_get_gr_el_id,
    st1_write_gr_el
    );
  signal state, next_state : screen_write_state;

begin

  SYNC_PROC : process (clock)
  begin
    if rising_edge(clock) then
      if s_reset = '1' then
        state <= st0_get_gr_el_id;
      else
        state <= next_state;
      end if;
    end if;
  end process;

  NEXT_STATE_DECODE : process (state, next_screen_write_stage)
  begin
    next_state <= state;
    case (state) is
      when st0_get_gr_el_id =>
        if next_screen_write_stage = WRITE_GR_EL then
          next_state <= st1_write_gr_el;
        end if;
      when st1_write_gr_el =>
        if next_screen_write_stage = GET_GR_EL_ID then
          next_state <= st0_get_gr_el_id;
        end if;
    end case;
  end process;

  cur_screen_write_stage <= GET_GR_EL_ID when state = st0_get_gr_el_id else
                            WRITE_GR_EL when state = st1_write_gr_el else
                            'X';

end Behavioral;
