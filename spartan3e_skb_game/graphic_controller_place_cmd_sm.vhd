library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.graphic_controller_constants.all;

entity graphic_controller_place_cmd_sm is
  port (
    clock            : in  std_logic;
    s_reset          : in  std_logic;
    start_place      : in  std_logic;
    gr_el_len        : in  natural;
    cur_gr_el_offset : out natural;
    write_state      : out std_logic
    );
end graphic_controller_place_cmd_sm;

architecture Behavioral of graphic_controller_place_cmd_sm is

  type element_place_state is (
    st0_wait_for_element,
    st1_write_element
    );
  signal state, next_state : element_place_state;

  signal cur_el_offset : natural := 0;

begin

  SYNC_PROC : process (clock)
  begin
    if rising_edge(clock) then
      if s_reset = '1' then
        state <= st0_wait_for_element;
      else
        state <= next_state;
      end if;
    end if;
  end process;

  NEXT_STATE_DECODE : process (state, start_place, gr_el_len, cur_el_offset)
  begin
    next_state <= state;
    case (state) is
      when st0_wait_for_element =>
        if start_place = '1' then
          next_state <= st1_write_element;
        end if;
      when st1_write_element =>
        if cur_el_offset >= gr_el_len - 1 then
          next_state <= st0_wait_for_element;
        end if;
    end case;
  end process;

  offset_counter : process(clock, state)
  begin
    if rising_edge(clock) then
      if state = st0_wait_for_element then
        cur_el_offset <= 0;
      else
        cur_el_offset <= cur_el_offset + 1;
      end if;
    end if;
  end process;

  cur_gr_el_offset <= cur_el_offset;

  write_state <= WAIT_FOR_ELEMENT when state = st0_wait_for_element else
                 WRITE_ELEMENT when state = st1_write_element else
                 'X';

end Behavioral;
