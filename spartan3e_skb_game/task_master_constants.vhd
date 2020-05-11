--
--      Package File Template
--
--      Purpose: This package defines supplemental types, subtypes,
--               constants, and functions
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package task_master_constants is

  -- Task master's inner state machine state encoding
  -- State with "I" suffix is an impulse: lasts one clock tick
  constant C_ST0_WAIT_FOR_START   : std_logic_vector(2 downto 0) := "000";
  constant C_ST1_TASK_LOADED_I    : std_logic_vector(2 downto 0) := "001";
  constant C_ST2_WAIT_FOR_INPUT   : std_logic_vector(2 downto 0) := "010";
  constant C_ST3_INPUT_RESOLVED_I : std_logic_vector(2 downto 0) := "011";
  constant C_ST4_END_TASK_I       : std_logic_vector(2 downto 0) := "100";

  -- Tasks encoding
  constant C_NUMBER_OF_TASKS : unsigned(2 downto 0) := "101";

  -- Correct task answers
  constant C_TASK1_CORRECT_ANSWER : std_logic_vector(7 downto 0) := "00000001";  -- 0 key
  constant C_TASK2_CORRECT_ANSWER : std_logic_vector(7 downto 0) := "00000010";  -- 1 key
  constant C_TASK3_CORRECT_ANSWER : std_logic_vector(7 downto 0) := "00000100";  -- 2 key
  constant C_TASK4_CORRECT_ANSWER : std_logic_vector(7 downto 0) := "00001000";  -- 3 key
  constant C_TASK5_CORRECT_ANSWER : std_logic_vector(7 downto 0) := "00010000";  -- 4 key

end task_master_constants;

package body task_master_constants is
end task_master_constants;
