----------------------------------------------------------------------------------
-- Company:
-- Engineer: Mariusz Wisniewski
--
-- Create Date:    21:38:56 03/30/2020
-- Design Name:
-- Module Name:    clock_divider - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity clock_divider is
  generic(clock_input_speed : integer := 1; clock_output_speed : integer := 1);
  port(
    clock_in  : in  std_logic;
    reset     : in  std_logic;
    clock_out : out std_logic;
    impulse   : out std_logic);
end entity clock_divider;

architecture Behavioral of clock_divider is

  function num_of_bits(n : natural) return natural is
  begin
    if n > 0 then
      return 1 + num_of_bits(n / 2);
    else
      return 1;
    end if;
  end num_of_bits;

  constant max_counter  : natural := (clock_input_speed / clock_output_speed) / 2;
  constant counter_bits : natural := num_of_bits(max_counter);

  signal counter           : unsigned(counter_bits - 1 downto 0) := (others => '0');
  signal clock_signal      : std_logic                           := '0';
  signal impulse_signal    : std_logic                           := '0';
  signal iteration_counter : natural                             := 0;

begin
  update_counter : process(clock_in, reset)
  begin
    if reset = '1' then
      counter           <= to_unsigned(0, counter_bits);
      impulse_signal    <= '0';
      iteration_counter <= 0;
      clock_signal      <= '0';
    elsif rising_edge(clock_in) then
      if counter = max_counter then
        counter      <= to_unsigned(0, counter_bits);
        clock_signal <= not clock_signal;

        if iteration_counter = 0 then
          impulse_signal <= '1';
        else
          impulse_signal <= '0';
        end if;

        iteration_counter <= iteration_counter + 1;
      else
        impulse_signal    <= '0';
        iteration_counter <= 0;
        counter           <= counter + 1;
      end if;
    end if;
  end process;

  clock_out <= clock_signal;
  impulse   <= impulse_signal;

end architecture Behavioral;
