library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity accumulator_8b_simple is
	port(	clock: in STD_LOGIC;
			clear: in STD_LOGIC;
			sum_component: in STD_LOGIC_VECTOR(7 downto 0);
			accumulator: out STD_LOGIC_VECTOR(7 downto 0));
end accumulator_8b_simple;

architecture Behavioral of accumulator_8b_simple is

	signal accumulator_i: UNSIGNED(7 downto 0) := X"00";
begin

    process (clock)
    begin
        if rising_edge(clock) then
          if clear = '1' then
            accumulator_i <= X"00";
          else
            accumulator_i <= accumulator_i + UNSIGNED(sum_component);
          end if;
        end if;
    end process;
    
    accumulator <= STD_LOGIC_VECTOR(accumulator_i);
end Behavioral;

