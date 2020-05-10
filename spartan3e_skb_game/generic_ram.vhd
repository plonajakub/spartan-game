library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_ram is
  generic(
    address_len : integer := 8;
    cell_size   : integer := 8
    );
  port (
    CLK : in  std_logic;
    WE  : in  std_logic;
    AW  : in  std_logic_vector(address_len - 1 downto 0);
    AR  : in  std_logic_vector(address_len - 1 downto 0);
    DI  : in  std_logic_vector(cell_size - 1 downto 0);
    DO  : out std_logic_vector(cell_size - 1 downto 0)
    );
end generic_ram;

architecture Behavioral of generic_ram is

  type ram_type is array (2 ** address_len - 1 downto 0) of std_logic_vector (cell_size - 1 downto 0);
  signal RAM : ram_type;

begin

  process (CLK)
  begin
    if rising_edge(CLK) then
      if WE = '1' then
        RAM(to_integer(unsigned(AW))) <= DI;
      end if;
    end if;
  end process;

  DO <= RAM(to_integer(unsigned(AR)));

end Behavioral;
