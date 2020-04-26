library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity game_master is
    Port ( game_clock : in  STD_LOGIC;
			  start_game_signal : in STD_LOGIC;
			  current_game_state : out STD_LOGIC_VECTOR (2 downto 0);
			  
			  -- data
			  subgame_data : in  STD_LOGIC_VECTOR (7 downto 0);
           subgame_data_ready : in  STD_LOGIC;
           subgame_start_address : out  STD_LOGIC_VECTOR (1 downto 0);			  
           subgame_start_command : out  STD_LOGIC;
           video_data : out  STD_LOGIC_VECTOR (7 downto 0)		  
			  );
end game_master;

architecture Behavioral of game_master is

	component game_loop_state_machine is
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
	
	component accumulator_8b_simple is
	port(	clock: in STD_LOGIC;
			clear: in STD_LOGIC;
			sum_component: in STD_LOGIC_VECTOR(7 downto 0);
			accumulator: out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	
	-- Game state machine
	signal next_state_signal_i : STD_LOGIC := '0';
	signal reset_state_machine : STD_LOGIC := '0';

	-- Game state machine impulse
	signal change_state_flag : STD_LOGIC := '0';
	signal reset_state_machine_impulse : STD_LOGIC := '0';
	
	-- Game points accumulator
	signal reset_points : STD_LOGIC := '0';
	signal points_to_add : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal current_points : STD_LOGIC_VECTOR(7 downto 0);
	
begin

	next_state_impulse: impulse_generator
	port map (
		generate_impulse => change_state_flag,
		clock => game_clock,
		reset => reset_state_machine_impulse,
		impulse_out => next_state_signal_i
	);

	inner_state_machine: game_loop_state_machine 
	port map (
		next_state_signal => next_state_signal_i,
		current_state_bus => current_game_state,
		sync_reset => reset_state_machine,
		clock => game_clock
	);
	
	change_state: process(game_clock, start_game_signal)
	begin
		if start_game_signal = '1' then
			change_state_flag <= '1';
			reset_state_machine_impulse <= '0';
		else
			change_state_flag <= '0';
			reset_state_machine_impulse <= '1';
		end if;
	end process;
	
	points_accumulator: accumulator_8b_simple
	port map (
		clock => game_clock,
		clear => reset_points,
		sum_component => points_to_add,
		accumulator => current_points
	);
	
	collect_subgame_data: process(game_clock, subgame_data_ready)
	begin
		if subgame_data_ready = '1' then
			points_to_add <= subgame_data;
		else
			points_to_add <= X"00";
		end if;
	end process;
	
	-- TODO convert to ascii first (maybe in graphics module?)
	video_data <= current_points;
	
	-- TODO choose next game and start it
	
end Behavioral;

