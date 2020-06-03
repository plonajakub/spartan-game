--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:31:30 05/11/2020
-- Design Name:   
-- Module Name:   C:/Users/mariu/Desktop/PWr/Semestr VI/UCiSW_2/spartan-game/spartan3e_skb_game/test_task_master.vhd
-- Project Name:  spartan3e_skb_game
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: task_master
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_task_master IS
END test_task_master;
 
ARCHITECTURE behavior OF test_task_master IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT task_master
    PORT(
         game_clock_i : IN  std_logic;
         start_task_i : IN  std_logic;
         coded_answer : IN  std_logic_vector(7 downto 0);
         correct_answer : IN  std_logic_vector(7 downto 0);
         current_task_description : IN  std_logic_vector(7 downto 0);
         game_clock_o : OUT  std_logic;
         current_task_state : OUT  std_logic_vector(2 downto 0);
         task_points : OUT  std_logic_vector(7 downto 0);
         task_finished : OUT  std_logic;
         graphics_handle : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal game_clock_i : std_logic := '0';
   signal start_task_i : std_logic := '0';
   signal coded_answer : std_logic_vector(7 downto 0) := (others => '0');
   signal correct_answer : std_logic_vector(7 downto 0) := (others => '0');
   signal current_task_description : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal game_clock_o : std_logic;
   signal current_task_state : std_logic_vector(2 downto 0);
   signal task_points : std_logic_vector(7 downto 0);
   signal task_finished : std_logic;
   signal graphics_handle : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: task_master PORT MAP (
          game_clock_i => game_clock_i,
          start_task_i => start_task_i,
          coded_answer => coded_answer,
          correct_answer => correct_answer,
          current_task_description => current_task_description,
          game_clock_o => game_clock_o,
          current_task_state => current_task_state,
          task_points => task_points,
          task_finished => task_finished,
          graphics_handle => graphics_handle
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
