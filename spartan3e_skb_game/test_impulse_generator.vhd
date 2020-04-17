LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_impulse_generator IS
END test_impulse_generator;
 
ARCHITECTURE behavior OF test_impulse_generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT impulse_generator
    PORT(
         generate_impulse : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         impulse_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal generate_impulse : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal impulse_out : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: impulse_generator PORT MAP (
          generate_impulse => generate_impulse,
          clock => clock,
          reset => reset,
          impulse_out => impulse_out
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
		wait for clock_period / 4;
      wait for clock_period*2;
		
		generate_impulse <= '1';
		reset <= '0';
		wait for clock_period * 2;
		
		generate_impulse <= '0';
		reset <= '0';
		wait for clock_period * 2;
		
		generate_impulse <= '1';
		reset <= '0';
		wait for clock_period * 2;
		
		generate_impulse <= '1';
		reset <= '1';
		wait for clock_period * 2;
		
		generate_impulse <= '0';
		reset <= '1';
		wait for clock_period * 2;
		
		generate_impulse <= '1';
		reset <= '0';
		wait for clock_period * 2;
      wait;
   end process;

END;
