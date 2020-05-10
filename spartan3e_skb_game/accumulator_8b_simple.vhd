library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity accumulator_8b_simple is
  port(clock         : in  std_logic;
       clear         : in  std_logic;
       sum_component : in  std_logic_vector(7 downto 0);
       accumulator   : out std_logic_vector(7 downto 0));
end accumulator_8b_simple;

architecture Behavioral of accumulator_8b_simple is

  signal accumulator_i : unsigned(7 downto 0) := X"00";
begin

  process (clock)
  begin
    if rising_edge(clock) then
      if clear = '1' then
        accumulator_i <= X"00";
      else
        accumulator_i <= accumulator_i + unsigned(sum_component);
      end if;
    end if;
  end process;

  accumulator <= std_logic_vector(accumulator_i);
end Behavioral;
