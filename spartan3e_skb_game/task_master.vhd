library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.task_master_constants.all;

-- impulse z klawiatury, ze dane przyszly
entity task_master is
  port (game_clock_i             : in std_logic;
        start_task_i             : in std_logic;
        keyboard_data_received_i : in std_logic;
        coded_answer             : in std_logic_vector (7 downto 0);  -- output of keyboard_key_resolver

        current_task_state  : out std_logic_vector (2 downto 0);
        task_points         : out std_logic_vector (7 downto 0);
        current_task_number : out unsigned (2 downto 0);
        task_finished       : out std_logic
        );
end task_master;

architecture Behavioral of task_master is

  component game_running_state_machine is
    port (b_next_state    : in  std_logic_vector (2 downto 0);
          b_current_state : out std_logic_vector (2 downto 0);
          sync_reset      : in  std_logic;
          clock           : in  std_logic);
  end component;

  component accumulator_8b_simple is
    port(
      clock         : in  std_logic;
      clear         : in  std_logic;
      sum_component : in  std_logic_vector(7 downto 0);
      accumulator   : out std_logic_vector(7 downto 0)
      );
  end component;

  -- Game running state machine
  signal i_b_next_state_sm    : std_logic_vector(2 downto 0) := "000";
  signal i_s_reset_sm         : std_logic                    := '0';
  signal i_b_current_state_sm : std_logic_vector(2 downto 0);

  -- Choose next task
  signal s_current_task_number : unsigned(2 downto 0) := "001";
  signal last_task_finished    : std_logic            := '0';

  -- Game points accumulator
  signal reset_points     : std_logic                    := '0';
  signal points_to_add    : std_logic_vector(7 downto 0) := X"00";
  signal s_correct_answer : std_logic_vector(7 downto 0);
  signal s_current_points : std_logic_vector(7 downto 0);

begin

  inner_state_machine : game_running_state_machine
    port map (
      b_next_state    => i_b_next_state_sm,
      b_current_state => i_b_current_state_sm,
      sync_reset      => i_s_reset_sm,
      clock           => game_clock_i
      );

  points_accumulator : accumulator_8b_simple
    port map (
      clock         => game_clock_i,
      clear         => reset_points,
      sum_component => points_to_add,
      accumulator   => s_current_points
      );

  choose_next_task : process(game_clock_i)
  begin
    if rising_edge(game_clock_i) then
      if i_b_current_state_sm = C_ST1_TASK_LOADED_I then
        last_task_finished <= '0';
      elsif i_b_current_state_sm = C_ST3_INPUT_RECEIVED_I then
        if s_current_task_number = C_NUMBER_OF_TASKS then
          s_current_task_number <= "001";
          last_task_finished    <= '1';
        else
          s_current_task_number <= s_current_task_number + 1;
          last_task_finished    <= '0';
        end if;
      else
        last_task_finished <= '0';
      end if;
    end if;
  end process;

  initialize_task : process(last_task_finished)
  begin
    if last_task_finished = '1' then
      i_s_reset_sm <= '1';
    else
      i_s_reset_sm <= '0';
    end if;
  end process;

  set_correct_answer : process(s_current_task_number)
  begin
    case (s_current_task_number) is
      when "001" =>
        s_correct_answer <= C_TASK1_CORRECT_ANSWER;
      when "010" =>
        s_correct_answer <= C_TASK2_CORRECT_ANSWER;
      when "011" =>
        s_correct_answer <= C_TASK3_CORRECT_ANSWER;
      when "100" =>
        s_correct_answer <= C_TASK4_CORRECT_ANSWER;
      when "101" =>
        s_correct_answer <= C_TASK5_CORRECT_ANSWER;
      when others =>
        s_correct_answer <= (others => '0');
    end case;
  end process;

  verify_answer : process(i_b_current_state_sm, coded_answer, s_correct_answer)
  begin
    if i_b_current_state_sm = C_ST3_INPUT_RECEIVED_I then
      if coded_answer = s_correct_answer then
        points_to_add <= X"01";
      else
        points_to_add <= X"00";
      end if;
    else
      points_to_add <= X"00";
    end if;
  end process;

  reset_current_points : process(i_b_current_state_sm, last_task_finished)
  begin
    if last_task_finished = '1' then
      reset_points <= '1';
    else
      reset_points <= '0';
    end if;
  end process;

  i_b_next_state_sm <= last_task_finished & keyboard_data_received_i & start_task_i;

  current_task_number <= s_current_task_number;
  current_task_state  <= i_b_current_state_sm;
  task_points         <= s_current_points;
  task_finished       <= last_task_finished;

end Behavioral;
