library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_8b_simple is
  port (clock  : in  std_logic;
        reset  : in  std_logic;
        output : out std_logic_vector (7 downto 0));
end counter_8b_simple;

architecture Behavioral of counter_8b_simple is

  signal output_i : unsigned(7 downto 0) := X"00";

begin

  process (clock)
  begin
    if rising_edge(clock) then
      if reset = '1' then
        output_i <= X"00";
      else
        output_i <= output_i + 1;
      end if;
    end if;
  end process;

  output <= std_logic_vector(output_i);

end Behavioral;
