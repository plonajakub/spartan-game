-- Vhdl test bench created from schematic C:\Users\mariu\Desktop\PWr\Semestr VI\UCiSW_2\spartan-game\spartan3e_skb_game\keyboard_key_resolver.sch - Mon Apr 13 16:47:26 2020
--
-- Notes:
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the
-- stimulus for your design.
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.all;
entity keyboard_key_resolver_keyboard_key_resolver_sch_tb is
end keyboard_key_resolver_keyboard_key_resolver_sch_tb;
architecture behavioral of
  keyboard_key_resolver_keyboard_key_resolver_sch_tb is

  component keyboard_key_resolver
    port(B   : in  std_logic_vector (7 downto 0);
         Ret : out std_logic_vector (7 downto 0));
  end component;

  signal B   : std_logic_vector (7 downto 0);
  signal Ret : std_logic_vector (7 downto 0);

  constant Clk_period : time := 10 ns;

begin

  UUT : keyboard_key_resolver port map(
    B   => B,
    Ret => Ret
    );

-- *** Test Bench - User Defined Section ***
  tb : process
  begin
    B <= X"30";
    wait for Clk_period;

    B <= X"31";
    wait for Clk_period;

    B <= X"32";
    wait for Clk_period;

    B <= X"33";
    wait for Clk_period;

    B <= X"34";
    wait for Clk_period;

    B <= X"35";
    wait for Clk_period;

    B <= X"36";
    wait for Clk_period;

    B <= X"37";
    wait for Clk_period;

    B <= X"38";
    wait for Clk_period;

    B <= X"39";
    wait for Clk_period;

    B <= X"40";
    wait;                               -- will wait forever
  end process;
-- *** End Test Bench - User Defined Section ***

end;
