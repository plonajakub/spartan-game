library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use game_master_constants.all;

entity game_master is
    port(
		game_clock_i : in  STD_LOGIC;
		start_game: in STD_LOGIC;
		new_game : in STD_LOGIC;
		reset_game : in STD_LOGIC;
		game_state : out STD_LOGIC_VECTOR (2 downto 0);
		game_clock_o : out STD_LOGIC;

		-- data
		subgame_data : in  STD_LOGIC_VECTOR (7 downto 0);
		subgame_data_ready : in  STD_LOGIC;
		subgame_address : out  STD_LOGIC_VECTOR (1 downto 0);			  
		subgame_start : out  STD_LOGIC;
		game_points : out  STD_LOGIC_VECTOR (7 downto 0)		  
		);
end game_master;


architecture Behavioral of game_master is
		
	component game_loop_sm is
	port(
		b_next_state : in STD_LOGIC_VECTOR(2 downto 0);
        s_reset : in STD_LOGIC;
        clock : in STD_LOGIC;
		b_current_state : out STD_LOGIC_VECTOR (2 downto 0)
		);
	end component;
		
	component accumulator_8b_simple is
	port(
		clock: in STD_LOGIC;
		clear: in STD_LOGIC;
		sum_component: in STD_LOGIC_VECTOR(7 downto 0);
		accumulator: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	-- Game state machine
	signal i_b_next_state_sm : STD_LOGIC_VECTOR(2 downto 0) := "000";
	signal i_s_reset_sm : STD_LOGIC := '0';
	signal i_b_current_state_sm : STD_LOGIC_VECTOR(2 downto 0);
	
	-- Choose next game
	signal last_subgame_finished : STD_LOGIC := '0';
	signal next_game_address : UNSIGNED(1 downto 0) := "00";
	signal i_subgame_start : STD_LOGIC := '0';
	
	-- Game points accumulator
	signal reset_points : STD_LOGIC := '0';
	signal points_to_add : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal current_points : STD_LOGIC_VECTOR(7 downto 0);
		
begin

	game_clock_o <= game_clock_i;

	inner_state_machine: game_loop_sm 
	port map (
		b_next_state => i_b_next_state_sm,
		s_reset => i_s_reset_sm,
		clock => game_clock_i,
		b_current_state => i_b_current_state_sm
	);
	
	i_b_next_state_sm <= new_game & last_subgame_finished & start_game;
	game_state <= i_b_current_state_sm;
	i_s_reset_sm <= reset_game;
		
	choose_next_subgame: process(game_clock_i)
	begin
		if rising_edge(game_clock_i) then
			if i_b_current_state_sm = C_ST1_GAME_RUNNING_I then -- Initialization
				next_game_address <= "00";
				last_subgame_finished <= '0';
				i_subgame_start <= '1';
			elsif subgame_data_ready = '1' then -- Next subgame
				if next_game_address = "10" then -- Game end
					next_game_address <= "00";
					last_subgame_finished <= '1';
					i_subgame_start <= '0';
				else
					next_game_address <= next_game_address + 1;
					last_subgame_finished <= '0';
					i_subgame_start <= '1';
				end if;
			else
				last_subgame_finished <= '0'; -- No action
				i_subgame_start <= '0';
			end if;
		end if;
	end process;
	
	start_next_subgame: process(i_subgame_start)
	begin
		if i_subgame_start = '1' then
			subgame_start <= '1';
		else
			subgame_start <= '0';
		end if;
	end process;
	
	subgame_address <= STD_LOGIC_VECTOR(next_game_address);
	
	points_accumulator: accumulator_8b_simple
	port map (
		clock => game_clock_i,
		clear => reset_points,
		sum_component => points_to_add,
		accumulator => current_points
	);
	
	collect_subgame_data: process(subgame_data_ready, subgame_data)
	begin
		if subgame_data_ready = '1' then
			points_to_add <= subgame_data;
		else
			points_to_add <= X"00";
		end if;
	end process;
	
	reset_current_points : process(i_b_current_state_sm)
	begin
		if i_b_current_state_sm = C_ST1_GAME_RUNNING_I then
			reset_points <= '1';
		else
			reset_points <= '0';
		end if;
	end process;
	
	game_points <= current_points; -- TODO convert to asci first (maybe in graphics module?)
	
end Behavioral;

