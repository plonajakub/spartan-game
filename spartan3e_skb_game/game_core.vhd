----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    19:02:30 06/12/2020
-- Design Name:
-- Module Name:    game_core - Behavioral
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

use work.graphics_constants.all;
use work.graphic_controller_constants.all;


entity game_core is
  port (
    game_clock_i             : in std_logic;
    start_game               : in std_logic;
    new_game                 : in std_logic;
    reset_game               : in std_logic;
    keyboard_data_received_i : in std_logic;
    coded_answer             : in std_logic_vector (7 downto 0);
    command_rdy              : in std_logic;

    ascii_out : out std_logic_vector (7 downto 0);  -- for VGAtxt module
    busy      : out std_logic
    );
end game_core;

architecture Behavioral of game_core is
  component game_master
    port (
      game_clock_i       : in  std_logic;
      start_game         : in  std_logic;
      new_game           : in  std_logic;
      reset_game         : in  std_logic;
      game_state         : out std_logic_vector (2 downto 0);
      subgame_data       : in  std_logic_vector (7 downto 0);
      subgame_data_ready : in  std_logic;
      subgame_address    : out std_logic_vector (1 downto 0);
      subgame_start      : out std_logic;
      game_points        : out GR_ELEMENT_REP_TYPE
      );
  end component game_master;

  component task_master
    port (
      game_clock_i             : in  std_logic;
      start_task_i             : in  std_logic;
      keyboard_data_received_i : in  std_logic;
      coded_answer             : in  std_logic_vector (7 downto 0);
      current_task_state       : out std_logic_vector (2 downto 0);
      task_points              : out std_logic_vector (7 downto 0);
      current_task_number      : out unsigned (2 downto 0);
      task_finished            : out std_logic
      );
  end component task_master;

  component graphic_controller
    port (
      clock           : in  std_logic;
      command_rdy     : in  std_logic;
      command         : in  graphic_controller_command_type;
      in_gr_id        : in  natural;
      in_gr_row_idx   : in  natural;
      in_gr_col_idx   : in  natural;
      string_to_write : in  GR_ELEMENT_REP_TYPE;
      ascii_out       : out std_logic_vector (7 downto 0);
      busy            : out std_logic
      );
  end component graphic_controller;

  -- task master signals
  signal start_task_i        : std_logic;
  signal task_points         : std_logic_vector (7 downto 0);
  signal task_finished       : std_logic;
  signal current_task_state  : std_logic_vector (2 downto 0);
  signal current_task_number : unsigned (2 downto 0);

  -- game master signals
  signal subgame_start      : std_logic;
  signal subgame_data_ready : std_logic;
  signal subgame_data       : std_logic_vector (7 downto 0);
  signal game_points        : GR_ELEMENT_REP_TYPE;
  signal game_state         : std_logic_vector (2 downto 0);
  signal subgame_address    : std_logic_vector (1 downto 0);

  -- graphic controller signals
  signal command         : graphic_controller_command_type := CMD_PLACE;
  signal in_gr_id        : natural                         := 2;
  signal in_gr_row_idx   : natural;
  signal in_gr_col_idx   : natural;
  signal string_to_write : GR_ELEMENT_REP_TYPE;


begin

  game_master_i : game_master
    port map (
      game_clock_i       => game_clock_i,
      start_game         => start_game,
      new_game           => new_game,
      reset_game         => reset_game,
      game_state         => game_state,
      subgame_data       => subgame_data,
      subgame_data_ready => subgame_data_ready,
      subgame_address    => subgame_address,
      subgame_start      => subgame_start,
      game_points        => game_points
      );

  task_master_i : task_master
    port map (
      game_clock_i             => game_clock_i,
      start_task_i             => start_task_i,
      keyboard_data_received_i => keyboard_data_received_i,
      coded_answer             => coded_answer,
      current_task_state       => current_task_state,
      task_points              => task_points,
      current_task_number      => current_task_number,
      task_finished            => task_finished
      );

  graphic_controller_i : graphic_controller
    port map (
      clock           => game_clock_i,
      command_rdy     => command_rdy,
      command         => command,
      in_gr_id        => in_gr_id,
      in_gr_row_idx   => in_gr_row_idx,
      in_gr_col_idx   => in_gr_col_idx,
      string_to_write => string_to_write,
      ascii_out       => ascii_out,
      busy            => busy
      );

  -- task master ports
  start_task_i <= subgame_start;

  -- game master ports
  subgame_data_ready <= task_finished;
  subgame_data       <= task_points;

  -- graphic controller ports
  string_to_write <= game_points;

end Behavioral;
