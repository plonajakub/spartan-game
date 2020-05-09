library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use task_master_constants.all;

entity task_master is
	Port ( game_clock_i : in STD_LOGIC;
			 start_task_signal : in STD_LOGIC;
			 coded_answer : in STD_LOGIC_VECTOR (7 downto 0); -- output of keyboard_key_resolver
			 correct_answer : in STD_LOGIC_VECTOR (7 downto 0); -- loaded from DDR

			 game_clock_o : out STD_LOGIC;
			 current_task_state : out STD_LOGIC_VECTOR (2 downto 0);
			 task_points : out STD_LOGIC;
			 task_finished : out STD_LOGIC;
			 graphics_handle : out UNSIGNED (2 downto 0) -- current task number that we send to graphics controller
			 );
end task_master;

architecture Behavioral of task_master is

	component game_running_state_machine is
    Port ( next_state_signal : in  STD_LOGIC;
           current_state_bus : out  STD_LOGIC_VECTOR (2 downto 0);
           sync_reset : in  STD_LOGIC;
           clock : in  STD_LOGIC);
	end component;

	component impulse_generator is
    Port ( generate_impulse : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           impulse_out : out  STD_LOGIC);
	end component;

	-- Game running state machine
	signal i_b_next_state_sm : STD_LOGIC_VECTOR(2 downto 0) := "000";
	signal i_s_reset_sm : STD_LOGIC := '0';
	signal i_b_current_state_sm : STD_LOGIC_VECTOR(2 downto 0);

	-- Game running state machine impulse
	signal current_task_number : UNSIGNED(2 downto 0) := "000";
	signal reset_state_machine_impulse : STD_LOGIC := '0';

	-- Game points accumulator
	signal reset_points : STD_LOGIC := '0';
	signal points_to_add : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal current_points : STD_LOGIC_VECTOR(7 downto 0);
	signal input_resolved : STD_LOGIC := '0';

begin

	game_clock_o <= game_clock_i;

	next_state_impulse: impulse_generator
	port map (
		generate_impulse => change_state_flag,
		clock => game_clock_i,
		reset => reset_state_machine_impulse,
		impulse_out => next_state_signal_i
	);

	inner_state_machine: game_running_state_machine
	port map (
		next_state_signal => i_b_next_state_sm,
		current_state_bus => i_b_current_state_sm,
		sync_reset => i_s_reset_sm,
		clock => game_clock_i
	);

	points_accumulator: accumulator_8b_simple
	port map (
		clock => game_clock_i,
		clear => reset_points,
		sum_component => points_to_add,
		accumulator => current_points
	);

	i_b_next_state_sm <= start_task_signal & coded_answer & input_resolved; -- not sure about this condition

	initialize_task: process(game_clock_i, start_task_signal)
	begin
		if start_task_signal = '1' then
			reset_state_machine_impulse <= '1';
			current_task_number <= "001";
		end if;
	end process;

	change_task: process(current_task_number, i_b_current_state_sm)
	begin
		 if i_b_current_state_sm = C_ST5_INPUT_RESOLVED_I and current_task_number < NUMBER_OF_TASKS then
			 current_task_number <= current_task_number + 1;
			 reset_state_machine_impulse <= '1';
			 input_resolved <= '0';
		 end if;
	end process;

	verify_answer: process(i_b_current_state_sm, correct_answer)
	begin
		if i_b_current_state_sm = C_ST3_INPUT_RECEIVED_I then
			if coded_answer = correct_answer then
				points_to_add <= '1';
			else
				points_to_add <= X"00";
			end if;
			input_resolved <= '1';
		end if;
	end process;

	reset_current_points : process(i_b_current_state_sm)
	begin
		if i_b_current_state_sm = C_ST1_TASK_LOADED_I then -- do we even need to reset points inside task module?
			reset_points <= '1';
		else
			reset_points <= '0';
		end if;
	end process;

	current_task_state <= i_b_current_state_sm;
	task_points <= current_points;
	graphics_handle <= current_task_number;

end Behavioral;