--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package game_master_constants is
	
	-- Game master's inner state machine state encoding
	-- State with "I" suffix is an impulse: last one clock tick
	constant C_ST0_WELCOME_SCREEN : STD_LOGIC_VECTOR(2 downto 0) := "000";
	constant C_ST1_GAME_RUNNING_I : STD_LOGIC_VECTOR(2 downto 0) := "001";
	constant C_ST2_GAME_RUNNING : STD_LOGIC_VECTOR(2 downto 0) := "010";
	constant C_ST3_GAME_OVER_I : STD_LOGIC_VECTOR(2 downto 0) := "011";
	constant C_ST4_GAME_OVER : STD_LOGIC_VECTOR(2 downto 0) := "100";

end game_master_constants;

package body game_master_constants is
end game_master_constants;
