--
--      Package File Template
--
--      Purpose: This package defines supplemental types, subtypes,
--               constants, and functions
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package graphics_constants is

  -- Initialization data of graphic elements

  -- Number of stored graphic elements
  constant N_GRAPHIC_ELEMENTS : integer := 2;

  -- IDs
  constant GR_ID_CLEAR_SCREEN : integer := 0;
  constant GR_ID_SCORE        : integer := 1;

  -- Screen hooks
  type vectors2 is array(0 to N_GRAPHIC_ELEMENTS - 1, 0 to 1) of integer;
  constant gr_hooks : vectors2 := ((0, 0),  -- (row, col)
                                   (1, 3));

  -- subtype ascii is std_logic_vector(7 downto 0);
  -- type ascii_vector is array(natural range <>) of ascii;
  -- subtype row is ascii_vector(0 to 47);
  -- type row_vector is array(natural range <>) of row;
  -- subtype graphic_element is row_vector(0 to 19);
  -- type graphic_elements is array(natural range <>) of graphic_element;
  type graphic_elements is array(0 to N_GRAPHIC_ELEMENTS - 1, 0 to 19, 0 to 47) of std_logic_vector(7 downto 0);
  constant graphic_elements_index : graphic_elements := (0 =>
                                                         (others => (others => X"00")),
                                                         1 =>
                                                         (1      => (3 => X"53", 4 => X"43", 5 => X"4F", 6 => X"52", 7 => X"45", 8 => X"3A", 9 => X"20", others => X"00"), others => (others => X"00"))
                                                         );

  -- Starting visibility
  type bool_array is array (0 to N_GRAPHIC_ELEMENTS - 1) of std_logic;
  constant gr_visible : bool_array := ('1',
                                       '1');


end graphics_constants;

package body graphics_constants is
end graphics_constants;
