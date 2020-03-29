LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_game_loop_state_machine IS
END test_game_loop_state_machine;
 
ARCHITECTURE behavior OF test_game_loop_state_machine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT game_loop_state_machine
    PORT(
         next_state_signal : IN  std_logic;
         current_state_bus : OUT  std_logic_vector(2 downto 0);
         sync_reset : IN  std_logic;
         clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal next_state_signal : std_logic := '0';
   signal sync_reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal current_state_bus : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: game_loop_state_machine PORT MAP (
          next_state_signal => next_state_signal,
          current_state_bus => current_state_bus,
          sync_reset => sync_reset,
          clock => clock
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
      -- hold reset state for 100 ns.
		sync_reset <= '1';
      wait for 100 ns;

		sync_reset <= '0';
      wait for clock_period * 2 + 5 ns;
		
		next_state_signal <= '1';
		wait for clock_period;
		
		next_state_signal <= '0';
		wait for clock_period;

		next_state_signal <= '1';
		wait for clock_period;
		
		next_state_signal <= '0';
		wait for clock_period * 2;
		
		next_state_signal <= '1';
		sync_reset <= '1';
		wait for clock_period;
		
		next_state_signal <= '1';
		sync_reset <= '0';
		wait for clock_period;
		
		next_state_signal <= '1';
		wait for clock_period * 7;
		
		next_state_signal <= '0';
		wait for clock_period * 2;
		
		sync_reset <= '1';
		wait for clock_period * 2;
		
		sync_reset <= '0';
		wait for clock_period;
		
      wait;
   end process;

END;
