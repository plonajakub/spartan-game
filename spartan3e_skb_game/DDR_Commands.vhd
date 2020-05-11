--      Package File Template
--
--      Purpose: This package defines supplemental types, subtypes,
--               constants, and functions


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package DDR_Commands is

  -- DDR Commands
  constant CMD_NOP       : std_logic_vector(2 downto 0) := "000";
  constant CMD_Active    : std_logic_vector(2 downto 0) := "001";
  constant CMD_Read      : std_logic_vector(2 downto 0) := "010";
  constant CMD_Write     : std_logic_vector(2 downto 0) := "011";
  constant CMD_Precharge : std_logic_vector(2 downto 0) := "100";
  constant CMD_PreAll    : std_logic_vector(2 downto 0) := "101";
  constant CMD_AutoRefr  : std_logic_vector(2 downto 0) := "110";

end DDR_Commands;
