library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity game_running_state_machine is
  port (next_state_signal : in  std_logic;
        current_state_bus : out std_logic_vector (2 downto 0);
        sync_reset        : in  std_logic;
        clock             : in  std_logic);
end game_running_state_machine;

architecture Behavioral of game_running_state_machine is

  type task_state is (st0_load_task,
                      st1_task_loaded,      --impulse
                      st2_wait_for_input,
                      st3_input_received,   --impulse
                      st4_resolve_input,
                      st5_input_resolved);  --impulse

  signal state, next_state : task_state;

begin

  SYNC_PROC : process (clock)
  begin
    if rising_edge(clock) then
      if sync_reset = '1' then
        state <= st0_load_task;
      else
        state <= next_state;
      end if;
    end if;
  end process;

  OUTPUT_DECODE : process (state)
  begin
    if state = st0_load_task then
      current_state_bus <= "000";
    elsif state = st1_task_loaded then
      current_state_bus <= "001";
    elsif state = st2_wait_for_input then
      current_state_bus <= "010";
    elsif state = st3_input_received then
      current_state_bus <= "011";
    elsif state = st4_resolve_input then
      current_state_bus <= "100";
    elsif state = st5_input_resolved then
      current_state_bus <= "101";
    else
      current_state_bus <= "XXX";
    end if;
  end process;

  NEXT_STATE_DECODE : process (state, next_state_signal)
  begin
    next_state <= state;
    case (state) is
      when st0_load_task =>
        if next_state_signal = '1' then
          next_state <= st1_task_loaded;
        end if;
      when st1_task_loaded =>
        next_state <= st2_wait_for_input;
      when st2_wait_for_input =>
        if next_state_signal = '1' then
          next_state <= st3_input_received;
        end if;
      when st3_input_received =>
        next_state <= st4_resolve_input;
      when st4_resolve_input =>
        if next_state_signal = '1' then
          next_state <= st5_input_resolved;
        end if;
      when st5_input_resolved =>
        next_state <= st0_load_task;
    end case;
  end process;

end Behavioral;
