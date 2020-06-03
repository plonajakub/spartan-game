library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.math_real.all;

package graphics_constants is

  -- Capital letters
  constant cA : std_logic_vector(7 downto 0) := X"41";
  constant cB : std_logic_vector(7 downto 0) := X"42";
  constant cC : std_logic_vector(7 downto 0) := X"43";
  constant cD : std_logic_vector(7 downto 0) := X"44";
  constant cE : std_logic_vector(7 downto 0) := X"45";
  constant cF : std_logic_vector(7 downto 0) := X"46";
  constant cG : std_logic_vector(7 downto 0) := X"47";
  constant cH : std_logic_vector(7 downto 0) := X"48";
  constant cI : std_logic_vector(7 downto 0) := X"49";
  constant cJ : std_logic_vector(7 downto 0) := X"4A";
  constant cK : std_logic_vector(7 downto 0) := X"4B";
  constant cL : std_logic_vector(7 downto 0) := X"4C";
  constant cM : std_logic_vector(7 downto 0) := X"4D";
  constant cN : std_logic_vector(7 downto 0) := X"4E";
  constant cO : std_logic_vector(7 downto 0) := X"4F";
  constant cP : std_logic_vector(7 downto 0) := X"50";
  constant cQ : std_logic_vector(7 downto 0) := X"51";
  constant cR : std_logic_vector(7 downto 0) := X"52";
  constant cS : std_logic_vector(7 downto 0) := X"53";
  constant cT : std_logic_vector(7 downto 0) := X"54";
  constant cU : std_logic_vector(7 downto 0) := X"55";
  constant cV : std_logic_vector(7 downto 0) := X"56";
  constant cW : std_logic_vector(7 downto 0) := X"57";
  constant cX : std_logic_vector(7 downto 0) := X"58";
  constant cY : std_logic_vector(7 downto 0) := X"59";
  constant cZ : std_logic_vector(7 downto 0) := X"5A";

  -- small letters
  constant a : std_logic_vector(7 downto 0) := X"61";
  constant b : std_logic_vector(7 downto 0) := X"62";
  constant c : std_logic_vector(7 downto 0) := X"63";
  constant d : std_logic_vector(7 downto 0) := X"64";
  constant e : std_logic_vector(7 downto 0) := X"65";
  constant f : std_logic_vector(7 downto 0) := X"66";
  constant g : std_logic_vector(7 downto 0) := X"67";
  constant h : std_logic_vector(7 downto 0) := X"68";
  constant i : std_logic_vector(7 downto 0) := X"69";
  constant j : std_logic_vector(7 downto 0) := X"6A";
  constant k : std_logic_vector(7 downto 0) := X"6B";
  constant l : std_logic_vector(7 downto 0) := X"6C";
  constant m : std_logic_vector(7 downto 0) := X"6D";
  constant n : std_logic_vector(7 downto 0) := X"6E";
  constant o : std_logic_vector(7 downto 0) := X"6F";
  constant p : std_logic_vector(7 downto 0) := X"70";
  constant q : std_logic_vector(7 downto 0) := X"71";
  constant r : std_logic_vector(7 downto 0) := X"72";
  constant s : std_logic_vector(7 downto 0) := X"73";
  constant t : std_logic_vector(7 downto 0) := X"74";
  constant u : std_logic_vector(7 downto 0) := X"75";
  constant v : std_logic_vector(7 downto 0) := X"76";
  constant w : std_logic_vector(7 downto 0) := X"77";
  constant x : std_logic_vector(7 downto 0) := X"78";
  constant y : std_logic_vector(7 downto 0) := X"79";
  constant z : std_logic_vector(7 downto 0) := X"7A";

  -- Initialization data of graphic elements
  -- (static and dynamic in the first state)

  -- Number of stored graphic elements
  constant N_GRAPHIC_ELEMENTS : integer := 2;

  -- Screen parameters
  constant N_SCN_ROW : integer := 20;
  constant N_SCN_COL : integer := 48;

  constant N_GRAPHIC_FIELDS : integer := N_GRAPHIC_ELEMENTS * N_SCN_ROW * N_SCN_COL;

  -- IDs
  constant GR_ID_CLEAR_SCREEN : integer := 0;
  constant GR_ID_SCORE        : integer := 1;


  subtype ascii is std_logic_vector(7 downto 0);
  type ascii_vector is array(natural range <>) of ascii;
  subtype screen_row is ascii_vector(0 to N_SCN_COL - 1);
  type screen_row_vector is array(natural range <>) of screen_row;
  subtype screen_matrix is screen_row_vector(0 to N_SCN_ROW - 1);
  type graphic_element_vector is array(natural range <>) of screen_matrix;
  subtype graphic_elements is graphic_element_vector(0 to N_GRAPHIC_ELEMENTS - 1);

  constant graphic_elements_index : graphic_elements := (0 =>
                                                         (others => (others => X"00")),
                                                         1 =>
                                                         (1      => (3 => X"53", 4 => X"43", 5 => X"4F", 6 => X"52", 7 => X"45", 8 => X"3A", 9 => X"20", others => X"00"), others => (others => X"00"))
                                                         );  -- TODO make ascii codes as constants


  -- Starting visibility
  constant GVIRAM_ADDR_WIDTH : integer := integer(ceil(log2(real(N_GRAPHIC_ELEMENTS))));
  type bool_array is array (2 ** GVIRAM_ADDR_WIDTH - 1 downto 0) of std_logic;
  constant gr_visible : bool_array := ('1',
                                       '1');

  function ridx
    (el_idx  : integer;
     row_idx : integer;
     col_idx : integer) return integer;

end graphics_constants;

package body graphics_constants is

  function ridx (el_idx  : integer;
                 row_idx : integer;
                 col_idx : integer)
    return integer is
  begin
    return N_SCN_ROW * N_SCN_COL * el_idx + N_SCN_COL * row_idx + col_idx;
  end ridx;

end graphics_constants;
