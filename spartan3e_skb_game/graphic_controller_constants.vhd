library IEEE;
use IEEE.STD_LOGIC_1164.all;

package graphic_controller_constants is

  subtype graphic_controller_command_type is std_logic_vector(2 downto 0);
  constant CMD_MOVE  : graphic_controller_command_type := "000";
  constant CMD_PLACE : graphic_controller_command_type := "001";
  constant CMD_SHOW  : graphic_controller_command_type := "010";
  constant CMD_HIDE  : graphic_controller_command_type := "011";

end graphic_controller_constants;

package body graphic_controller_constants is
end graphic_controller_constants;
