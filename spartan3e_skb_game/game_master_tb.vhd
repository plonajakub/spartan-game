library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity game_master_tb is
end game_master_tb;

architecture behavior of game_master_tb is

  -- Component Declaration for the Unit Under Test (UUT)

  component game_master
    port(
      game_clock_i       : in  std_logic;
      start_game         : in  std_logic;
      new_game           : in  std_logic;
      reset_game         : in  std_logic;
      game_state         : out std_logic_vector(2 downto 0);
      game_clock_o       : out std_logic;
      subgame_data       : in  std_logic_vector(7 downto 0);
      subgame_data_ready : in  std_logic;
      subgame_address    : out std_logic_vector(1 downto 0);
      subgame_start      : out std_logic;
      game_points        : out std_logic_vector(7 downto 0)
      );
  end component;


  --Inputs
  signal game_clock_i       : std_logic                    := '0';
  signal start_game         : std_logic                    := '0';
  signal new_game           : std_logic                    := '0';
  signal reset_game         : std_logic                    := '0';
  signal subgame_data       : std_logic_vector(7 downto 0) := (others => '0');
  signal subgame_data_ready : std_logic                    := '0';

  --Outputs
  signal game_state      : std_logic_vector(2 downto 0);
  signal game_clock_o    : std_logic;
  signal subgame_address : std_logic_vector(1 downto 0);
  signal subgame_start   : std_logic;
  signal game_points     : std_logic_vector(7 downto 0);
  -- No clocks detected in port list. Replace <clock> below with
  -- appropriate port name

  constant clock_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : game_master port map (
    game_clock_i       => game_clock_i,
    start_game         => start_game,
    new_game           => new_game,
    reset_game         => reset_game,
    game_state         => game_state,
    game_clock_o       => game_clock_o,
    subgame_data       => subgame_data,
    subgame_data_ready => subgame_data_ready,
    subgame_address    => subgame_address,
    subgame_start      => subgame_start,
    game_points        => game_points
    );

  -- Clock process definitions
  clock_process : process
  begin
    game_clock_i <= '0';
    wait for clock_period / 2;
    game_clock_i <= '1';
    wait for clock_period / 2;
  end process;


  -- Stimulus process
  stim_proc : process
  begin
    wait for clock_period * 3;
    wait for clock_period / 4;

    -- hold
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 2;

    -- TEST
    -- start_game
    start_game         <= '1';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 4;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 2;

    -- start_game again (it shouldn't have any effect)
    start_game         <= '1';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 4;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 2;

    -- TEST
    -- simulate data from task module arrived (1st game)
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"11";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"11";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- TEST
    -- simulate data from task module arrived (2nd game)
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"0D";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- TEST
    -- simulate data from task module arrived (3rd game)
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"0A";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- TEST
    -- start new game after finished one
    start_game         <= '0';
    new_game           <= '1';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 2;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- simulate data from task module arrived (2 next games)
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"11";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"11";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"0D";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- TEST
    -- reset master module (reset game)
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '1';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 2;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- start_game
    start_game         <= '1';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 4;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 2;

    -- start next two games
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"11";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"11";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"0D";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    -- TEST
    -- finish last game
    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"0F";
    subgame_data_ready <= '1';
    wait for clock_period;

    start_game         <= '0';
    new_game           <= '0';
    reset_game         <= '0';
    subgame_data       <= X"00";
    subgame_data_ready <= '0';
    wait for clock_period * 6;

    wait;
  end process;

end;
