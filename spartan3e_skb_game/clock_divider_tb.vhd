--------------------------------------------------------------------------------
-- Company:
-- Engineer: Mariusz Wiśniewski
--
-- Create Date:   23:51:13 03/30/2020
-- Design Name:
-- Module Name:   C:/Users/mariu/Desktop/PWr/Semestr VI/UCiSW_2/spartan-game/spartan3e_skb_game/clock_divider_tb.vhd
-- Project Name:  spartan3e_skb_game
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: clock_divider
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity clock_divider_tb is
end clock_divider_tb;

architecture behavior of clock_divider_tb is

  -- Component Declaration for the Unit Under Test (UUT)

  component clock_divider
    generic(clock_input_speed : integer := 1; clock_output_speed : integer := 2);
    port(
      clock_in  : in  std_logic;
      reset     : in  std_logic;
      clock_out : out std_logic;
      impulse   : out std_logic
      );
  end component;


  --Inputs
  signal clock_in : std_logic := '0';
  signal reset    : std_logic := '0';

  --Outputs
  signal clock_out : std_logic;
  signal impulse   : std_logic;

  -- Clock period definitions
  constant clock_in_period : time := 10 ns;

  constant system_speed : natural := 50e6;

begin

  clock_10hz_generator : component clock_divider
    generic map(clock_input_speed => system_speed, clock_output_speed => 10)
    port map (
      clock_in  => clock_in,
      reset     => reset,
      clock_out => clock_out,
      impulse   => impulse
      );

  -- Clock process definitions
  clock_in_process : process
  begin
    clock_in <= '0';
    wait for clock_in_period/2;
    clock_in <= '1';
    wait for clock_in_period/2;
  end process;

  -- Stimulus process
  stim_proc : process
  begin
    -- hold reset state for 100 ns.
    wait for 100 ms;

    reset <= '1';

    wait for clock_in_period*10;

    wait;
  end process;

end;
