library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.task_master_constants.all;

entity game_running_state_machine is
  port (b_next_state    : in  std_logic_vector (2 downto 0);
        b_current_state : out std_logic_vector (2 downto 0);
        sync_reset      : in  std_logic;
        clock           : in  std_logic);
end game_running_state_machine;

architecture Behavioral of game_running_state_machine is

  type task_state is (st0_wait_for_start,
                      st1_task_loaded_i,
                      st2_wait_for_input,
                      st3_input_resolved_i,
                      st4_end_task_i);

  signal state, next_state : task_state;

begin

  SYNC_PROC : process (clock)
  begin
    if rising_edge(clock) then
      if sync_reset = '1' then
        state <= st0_wait_for_start;
      else
        state <= next_state;
      end if;
    end if;
  end process;

  NEXT_STATE_DECODE : process (state, b_next_state)
  begin
    next_state <= state;
    case (state) is
      when st0_wait_for_start =>
        if b_next_state = C_ST1_TASK_LOADED_I then
          next_state <= st1_task_loaded_i;
        end if;
      when st1_task_loaded_i =>
        next_state <= st2_wait_for_input;
      when st2_wait_for_input =>
        if b_next_state = C_ST3_INPUT_RESOLVED_I then
          next_state <= st3_input_resolved_i;
        end if;
      when st3_input_resolved_i =>
        next_state <= st4_end_task_i;
      when st4_end_task_i =>
        if b_next_state = C_ST0_WAIT_FOR_START then
          next_state <= st1_task_loaded_i;
        end if;
    end case;
  end process;

  b_current_state <= C_ST0_WAIT_FOR_START when state = st0_wait_for_start else
                     C_ST1_TASK_LOADED_I    when state = st1_task_loaded_i else
                     C_ST2_WAIT_FOR_INPUT   when state = st2_wait_for_input else
                     C_ST3_INPUT_RESOLVED_I when state = st3_input_resolved_i else
                     C_ST4_END_TASK_I       when state = st4_end_task_i else
                     "XXX";

end Behavioral;
