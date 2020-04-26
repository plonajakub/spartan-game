LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY test_game_loop_sm IS
END test_game_loop_sm;
 
ARCHITECTURE behavior OF test_game_loop_sm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT game_loop_sm
    PORT(
         b_next_state : IN  std_logic_vector(2 downto 0);
         s_reset : IN  std_logic;
         clock : IN  std_logic;
         b_current_state : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal b_next_state : std_logic_vector(2 downto 0) := (others => '0');
   signal s_reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal b_current_state : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: game_loop_sm PORT MAP (
          b_next_state => b_next_state,
          s_reset => s_reset,
          clock => clock,
          b_current_state => b_current_state
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		b_next_state <= "000";
		s_reset <= '0';
		wait for clock_period*3;
		
		wait for clock_period / 4;
		
		b_next_state <= "001";
		s_reset <= '0';
		wait for clock_period;
		
		b_next_state <= "000";
		s_reset <= '0';
		wait for clock_period;
		
		b_next_state <= "100";
		s_reset <= '0';
		wait for clock_period;
		
		b_next_state <= "100";
		s_reset <= '1';
		wait for clock_period;
		
		b_next_state <= "100";
		s_reset <= '0';
		wait for clock_period;
		
		b_next_state <= "111";
		s_reset <= '0';
		wait for clock_period * 3;
		
		b_next_state <= "001";
		s_reset <= '0';
		wait for clock_period * 2;
		
		b_next_state <= "010";
		s_reset <= '0';
		wait for clock_period * 2;
		
		b_next_state <= "100";
		s_reset <= '0';
		wait for clock_period * 2;

		wait;
   end process;

END;
