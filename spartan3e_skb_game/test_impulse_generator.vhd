library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity test_impulse_generator is
end test_impulse_generator;

architecture behavior of test_impulse_generator is

  -- Component Declaration for the Unit Under Test (UUT)

  component impulse_generator
    port(
      generate_impulse : in  std_logic;
      clock            : in  std_logic;
      reset            : in  std_logic;
      impulse_out      : out std_logic
      );
  end component;


  --Inputs
  signal generate_impulse : std_logic := '0';
  signal clock            : std_logic := '0';
  signal reset            : std_logic := '0';

  --Outputs
  signal impulse_out : std_logic;

  -- Clock period definitions
  constant clock_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : impulse_generator port map (
    generate_impulse => generate_impulse,
    clock            => clock,
    reset            => reset,
    impulse_out      => impulse_out
    );

  -- Clock process definitions
  clock_process : process
  begin
    clock <= '0';
    wait for clock_period/2;
    clock <= '1';
    wait for clock_period/2;
  end process;


  -- Stimulus process
  stim_proc : process
  begin
    wait for clock_period / 4;
    wait for clock_period*2;

    generate_impulse <= '1';
    reset            <= '0';
    wait for clock_period * 2;

    generate_impulse <= '0';
    reset            <= '0';
    wait for clock_period * 2;

    generate_impulse <= '1';
    reset            <= '0';
    wait for clock_period * 2;

    generate_impulse <= '1';
    reset            <= '1';
    wait for clock_period * 2;

    generate_impulse <= '0';
    reset            <= '1';
    wait for clock_period * 2;

    generate_impulse <= '1';
    reset            <= '0';
    wait for clock_period * 2;
    wait;
  end process;

end;
