library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.game_master_constants.all;
use work.graphics_constants.all;

entity game_master is
  port(
    game_clock_i : in  std_logic;
    start_game   : in  std_logic;
    new_game     : in  std_logic;
    reset_game   : in  std_logic;
    game_state   : out std_logic_vector (2 downto 0);

    -- data
    subgame_data       : in  std_logic_vector (7 downto 0);
    subgame_data_ready : in  std_logic;
    subgame_address    : out std_logic_vector (1 downto 0);
    subgame_start      : out std_logic;
    game_points        : out GR_ELEMENT_REP_TYPE
    );
end game_master;


architecture Behavioral of game_master is

  component game_loop_sm is
    port(
      b_next_state    : in  std_logic_vector(2 downto 0);
      s_reset         : in  std_logic;
      clock           : in  std_logic;
      b_current_state : out std_logic_vector (2 downto 0)
      );
  end component;

  component accumulator_8b_simple is
    port(
      clock         : in  std_logic;
      clear         : in  std_logic;
      sum_component : in  std_logic_vector(7 downto 0);
      accumulator   : out std_logic_vector(7 downto 0)
      );
  end component;

  -- Game state machine
  signal i_b_next_state_sm    : std_logic_vector(2 downto 0) := "000";
  signal i_s_reset_sm         : std_logic                    := '0';
  signal i_b_current_state_sm : std_logic_vector(2 downto 0);

  -- Choose next game
  signal last_subgame_finished : std_logic            := '0';
  signal next_game_address     : unsigned(1 downto 0) := "00";
  signal i_subgame_start       : std_logic            := '0';

  -- Game points accumulator
  signal reset_points   : std_logic                    := '0';
  signal points_to_add  : std_logic_vector(7 downto 0) := X"00";
  signal current_points : std_logic_vector(7 downto 0);

begin

  inner_state_machine : game_loop_sm
    port map (
      b_next_state    => i_b_next_state_sm,
      s_reset         => i_s_reset_sm,
      clock           => game_clock_i,
      b_current_state => i_b_current_state_sm
      );

  i_b_next_state_sm <= new_game & last_subgame_finished & start_game;
  game_state        <= i_b_current_state_sm;
  i_s_reset_sm      <= reset_game;

  choose_next_subgame : process(game_clock_i)
  begin
    if rising_edge(game_clock_i) then
      if i_b_current_state_sm = C_ST1_GAME_RUNNING_I then  -- Initialization
        next_game_address     <= "00";
        last_subgame_finished <= '0';
        i_subgame_start       <= '1';
      elsif subgame_data_ready = '1' then                  -- Next subgame
        if next_game_address = "10" then                   -- Game end
          next_game_address     <= "00";
          last_subgame_finished <= '1';
          i_subgame_start       <= '0';
        else
          next_game_address     <= next_game_address + 1;
          last_subgame_finished <= '0';
          i_subgame_start       <= '1';
        end if;
      else
        last_subgame_finished <= '0';                      -- No action
        i_subgame_start       <= '0';
      end if;
    end if;
  end process;

  subgame_start   <= i_subgame_start;
  subgame_address <= std_logic_vector(next_game_address);

  points_accumulator : accumulator_8b_simple
    port map (
      clock         => game_clock_i,
      clear         => reset_points,
      sum_component => points_to_add,
      accumulator   => current_points
      );

  collect_subgame_data : process(subgame_data_ready, subgame_data)
  begin
    if subgame_data_ready = '1' then
      points_to_add <= subgame_data;
    else
      points_to_add <= X"00";
    end if;
  end process;

  reset_current_points : process(i_b_current_state_sm)
  begin
    if i_b_current_state_sm = C_ST1_GAME_RUNNING_I then
      reset_points <= '1';
    else
      reset_points <= '0';
    end if;
  end process;

  game_points(0) <= HB2ASCII_HEX(current_points(7 downto 4));
  game_points(1) <= HB2ASCII_HEX(current_points(3 downto 0));
  game_points(2) <= X"00";
  game_points(3) <= X"00";
  game_points(4) <= X"00";

end Behavioral;
