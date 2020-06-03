library IEEE;
use IEEE.STD_LOGIC_1164.all;

package graphics_constants is

  -- Initialization data of graphic elements
  -- (static and dynamic in the first state)

  -- Number of stored graphic elements
  constant N_GRAPHIC_ELEMENTS : integer := 2;

  -- Screen parameters
  constant N_SCN_ROW : integer := 20;
  constant N_SCN_COL : integer := 48;

  -- IDs
  constant GR_ID_CLEAR_SCREEN : integer := 0;
  constant GR_ID_SCORE        : integer := 1;

  -- Screen hooks (probably do **not** needed)
  type vectors2 is array(0 to N_GRAPHIC_ELEMENTS - 1, 0 to 1) of integer;
  constant gr_hooks : vectors2 := ((0, 0),  -- (row, col)
                                   (1, 3));


  subtype ascii is std_logic_vector(7 downto 0);
  type ascii_vector is array(natural range <>) of ascii;
  subtype screen_row is ascii_vector(0 to N_SCN_COL - 1);
  type screen_row_vector is array(natural range <>) of screen_row;
  subtype screen_matrix is screen_row_vector(0 to N_SCN_ROW - 1);
  type graphic_element_vector is array(natural range <>) of screen_matrix;
  subtype graphic_elements is graphic_element_vector(0 to N_GRAPHIC_ELEMENTS - 1);
  -- type graphic_elements is array(0 to N_GRAPHIC_ELEMENTS - 1, 0 to N_SCN_ROW - 1, 0 to N_SCN_COL - 1) of std_logic_vector(7 downto 0);

  -- Capital letters
  constant cA : ascii := X"41";
  constant cB : ascii := X"42";
  constant cC : ascii := X"43";
  constant cD : ascii := X"44";
  constant cE : ascii := X"45";
  constant cF : ascii := X"46";
  constant cG : ascii := X"47";
  constant cH : ascii := X"48";
  constant cI : ascii := X"49";
  constant cJ : ascii := X"4A";
  constant cK : ascii := X"4B";
  constant cL : ascii := X"4C";
  constant cM : ascii := X"4D";
  constant cN : ascii := X"4E";
  constant cO : ascii := X"4F";
  constant cP : ascii := X"50";
  constant cQ : ascii := X"51";
  constant cR : ascii := X"52";
  constant cS : ascii := X"53";
  constant cT : ascii := X"54";
  constant cU : ascii := X"55";
  constant cV : ascii := X"56";
  constant cW : ascii := X"57";
  constant cX : ascii := X"58";
  constant cY : ascii := X"59";
  constant cZ : ascii := X"5A";

  -- small letters
  constant a : ascii := X"61";
  constant b : ascii := X"62";
  constant c : ascii := X"63";
  constant d : ascii := X"64";
  constant e : ascii := X"65";
  constant f : ascii := X"66";
  constant g : ascii := X"67";
  constant h : ascii := X"68";
  constant i : ascii := X"69";
  constant j : ascii := X"6A";
  constant k : ascii := X"6B";
  constant l : ascii := X"6C";
  constant m : ascii := X"6D";
  constant n : ascii := X"6E";
  constant o : ascii := X"6F";
  constant p : ascii := X"70";
  constant q : ascii := X"71";
  constant r : ascii := X"72";
  constant s : ascii := X"73";
  constant t : ascii := X"74";
  constant u : ascii := X"75";
  constant v : ascii := X"76";
  constant w : ascii := X"77";
  constant x : ascii := X"78";
  constant y : ascii := X"79";
  constant z : ascii := X"7A";

  constant graphic_elements_index : graphic_elements := (0 =>
                                                         (others => (others => X"00")),
                                                         1 =>
                                                         (1      => (3 => X"53", 4 => X"43", 5 => X"4F", 6 => X"52", 7 => X"45", 8 => X"3A", 9 => X"20", others => X"00"), others => (others => X"00"))
                                                         );  -- TODO make ascii codes as constants


  -- Starting visibility
  type bool_array is array (0 to N_GRAPHIC_ELEMENTS - 1) of std_logic;
  constant gr_visible : bool_array := ('1',
                                       '1');



end graphics_constants;

package body graphics_constants is
end graphics_constants;
