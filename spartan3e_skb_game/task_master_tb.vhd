--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   17:33:06 05/11/2020
-- Design Name:
-- Module Name:   C:/Users/mariu/Desktop/PWr/Semestr VI/UCiSW_2/spartan-game/spartan3e_skb_game/task_master_tb.vhd
-- Project Name:  spartan3e_skb_game
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: task_master
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

entity task_master_tb is
end task_master_tb;

architecture behavior of task_master_tb is

  -- Component Declaration for the Unit Under Test (UUT)

  component task_master
    port(
      game_clock_i             : in  std_logic;
      start_task_i             : in  std_logic;
      coded_answer             : in  std_logic_vector(7 downto 0);
      correct_answer           : in  std_logic_vector(7 downto 0);
      current_task_description : in  std_logic_vector(7 downto 0);
      game_clock_o             : out std_logic;
      current_task_state       : out std_logic_vector(2 downto 0);
      task_points              : out std_logic_vector(7 downto 0);
      task_finished            : out std_logic;
      graphics_handle          : out std_logic_vector(7 downto 0)
      );
  end component;


  --Inputs
  signal game_clock_i             : std_logic                    := '0';
  signal start_task_i             : std_logic                    := '0';
  signal coded_answer             : std_logic_vector(7 downto 0) := (others => '0');
  signal correct_answer           : std_logic_vector(7 downto 0) := (others => '0');
  signal current_task_description : std_logic_vector(7 downto 0) := (others => '0');

  --Outputs
  signal game_clock_o       : std_logic;
  signal current_task_state : std_logic_vector(2 downto 0);
  signal task_points        : std_logic_vector(7 downto 0);
  signal task_finished      : std_logic;
  signal graphics_handle    : std_logic_vector(7 downto 0);
  -- No clocks detected in port list. Replace <clock> below with
  -- appropriate port name

  constant clock_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : task_master port map (
    game_clock_i             => game_clock_i,
    start_task_i             => start_task_i,
    coded_answer             => coded_answer,
    correct_answer           => correct_answer,
    current_task_description => current_task_description,
    game_clock_o             => game_clock_o,
    current_task_state       => current_task_state,
    task_points              => task_points,
    task_finished            => task_finished,
    graphics_handle          => graphics_handle
    );

  -- Clock process definitions
  game_clock_i_process : process
  begin
    game_clock_i <= '0';
    wait for clock_period/2;
    game_clock_i <= '1';
    wait for clock_period/2;
  end process;


  -- Stimulus process
  stim_proc : process
  begin
    wait for clock_period * 3;
    wait for clock_period / 4;

    -- hold
    start_task_i             <= '0';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= (others => '0');
    wait for clock_period * 2;

    -- TEST
    -- start_task_i
    start_task_i             <= '1';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= (others => '0');
    wait for clock_period * 2;

    start_task_i             <= '0';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= (others => '0');
    wait for clock_period * 2;

    -- TEST
    -- start_task_i again (shouldn't have any effect)
    start_task_i             <= '1';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= (others => '0');
    wait for clock_period * 2;

    start_task_i             <= '0';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= (others => '0');
    wait for clock_period * 2;

    -- TEST
    -- simulate current_task_description arrived
    start_task_i             <= '1';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= (others => '0');
    wait for clock_period * 2;

    start_task_i             <= '0';
    coded_answer             <= (others => '0');
    correct_answer           <= (others => '0');
    current_task_description <= X"01";
    wait for clock_period * 4;


    wait;
  end process;

end;
