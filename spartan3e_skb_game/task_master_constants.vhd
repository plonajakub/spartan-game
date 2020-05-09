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

package task_master_constants is

	-- Task master's inner state machine state encoding
	-- State with "I" suffix is an impulse: lasts one clock tick
	constant C_ST0_LOAD_TASK : STD_LOGIC_VECTOR(2 downto 0) := "000";
	constant C_ST1_TASK_LOADED_I : STD_LOGIC_VECTOR(2 downto 0) := "001";
	constant C_ST2_WAIT_FOR_INPUT : STD_LOGIC_VECTOR(2 downto 0) := "010";
	constant C_ST3_INPUT_RECEIVED_I : STD_LOGIC_VECTOR(2 downto 0) := "011";
	constant C_ST4_RESOLVE_INPUT : STD_LOGIC_VECTOR(2 downto 0) := "100";
	constant C_ST5_INPUT_RESOLVED_I : STD_LOGIC_VECTOR(2 downto 0) := "101";

	-- Tasks encoding
	constant NUMBER_OF_TASKS : UNSIGNED(2 downto 0) := "101";

end task_master_constants;

package body task_master_constants is
end task_master_constants;
