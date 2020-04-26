library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task_master is
	Port ( game_clock : in STD_LOGIC;
			 start_task_signal : in STD_LOGIC;
			 coded_answer : in STD_LOGIC_VECTOR (7 downto 0); -- output of keyboard_key_resolver
			 correct_answer : in STD_LOGIC_VECTOR (7 downto 0); -- loaded from DDR
			 
			 current_task_state : out STD_LOGIC_VECTOR (2 downto 0);
			 answer_value : out STD_LOGIC;
			 task_finished : out STD_LOGIC
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
	signal next_state_signal_i : STD_LOGIC := '0';
	signal reset_state_machine : STD_LOGIC := '0';
	
	-- Game running state machine impulse
	signal change_state_flag : STD_LOGIC := '0';
	signal reset_state_machine_impulse : STD_LOGIC := '0';
	
	
begin

	next_state_impulse: impulse_generator
	port map (
		generate_impulse => change_state_flag,
		clock => game_clock,
		reset => reset_state_machine_impulse,
		impulse_out => next_state_signal_i
	);
	
	inner_state_machine: game_running_state_machine 
	port map (
		next_state_signal => next_state_signal_i,
		current_state_bus => current_task_state,
		sync_reset => reset_state_machine,
		clock => game_clock
	);
	
	change_state: process(game_clock, start_task_signal)
	begin
		if start_task_signal = '1' then
			change_state_flag <= '1';
			reset_state_machine_impulse <= '0';
		else
			change_state_flag <= '0';
			reset_state_machine_impulse <= '1';
		end if;
	end process;
	
	verify_answer: process(coded_answer, correct_answer) -- Should we put both in the sensitivity list?
	-- How do we make a use of the state machine? - maybe in the sensitivity list we should put the current_task_state
	-- and if it is equal to "input received", then we should check the answer.
	begin
		if coded_answer = correct_answer then
			answer_value <= '1';
		else
			answer_value <= '0';
		end if;
	end process;

end Behavioral;
