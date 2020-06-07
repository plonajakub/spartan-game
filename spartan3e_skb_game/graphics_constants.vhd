library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package graphics_constants is

  -- ASCII constants
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

  -- Small letters
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

  -- Number of stored graphic elements
  constant N_GRAPHIC_ELEMENTS : natural := 3;

  -- Screen parameters
  constant N_SCN_ROW : natural := 20;
  constant N_SCN_COL : natural := 48;

  constant GR_ELEMENT_MAX_REP_LEN : natural := 5;
  type GR_ELEMENT_REP_TYPE is array (0 to GR_ELEMENT_MAX_REP_LEN - 1) of std_logic_vector(7 downto 0);
  type GR_ELEMENT_POS_TYPE is array (0 to 1) of natural;

  -- Graphic elements
  constant GR_TIME_ID  : natural             := 0;
  constant GR_TIME_LEN : natural             := 4;
  constant GR_TIME_POS : GR_ELEMENT_POS_TYPE := (0, 1);  -- (row, col)
  constant GR_TIME_REP : GR_ELEMENT_REP_TYPE := (cT, i, m, e, others => X"00");

  constant GR_SCORE_ID  : natural             := 1;
  constant GR_SCORE_LEN : natural             := 5;
  constant GR_SCORE_POS : GR_ELEMENT_POS_TYPE := (0, 9);
  constant GR_SCORE_REP : GR_ELEMENT_REP_TYPE := (cS, c, o, r, e, others => X"00");

  constant GR_NSCORE_ID  : natural             := 2;
  constant GR_NSCORE_LEN : natural             := 2;
  constant GR_NSCORE_POS : GR_ELEMENT_POS_TYPE := (0, 15);
  constant GR_NSCORE_REP : GR_ELEMENT_REP_TYPE := (X"30", X"30", others => X"00");

  -- Starting visibility
  subtype GR_IS_VISIBLE_TYPE is std_logic_vector(0 to N_GRAPHIC_ELEMENTS - 1);
  constant GR_IS_VISIBLE : GR_IS_VISIBLE_TYPE := (GR_TIME_ID   => '1',
                                                  GR_SCORE_ID  => '1',
                                                  GR_NSCORE_ID => '1');

  -- Convenient containers
  type GR_LEN_ARR_TYPE is array (0 to N_GRAPHIC_ELEMENTS - 1) of natural;
  constant GR_LEN_ARR : GR_LEN_ARR_TYPE := (GR_TIME_ID   => GR_TIME_LEN,
                                            GR_SCORE_ID  => GR_SCORE_LEN,
                                            GR_NSCORE_ID => GR_NSCORE_LEN);

  type GR_POS_ARR_TYPE is array (0 to N_GRAPHIC_ELEMENTS - 1) of GR_ELEMENT_POS_TYPE;
  constant GR_POS_ARR : GR_POS_ARR_TYPE := (GR_TIME_ID   => GR_TIME_POS,
                                            GR_SCORE_ID  => GR_SCORE_POS,
                                            GR_NSCORE_ID => GR_NSCORE_POS);

  type GR_REP_ARR_TYPE is array (0 to N_GRAPHIC_ELEMENTS - 1) of GR_ELEMENT_REP_TYPE;
  constant GR_REP_ARR : GR_REP_ARR_TYPE := (GR_TIME_ID   => GR_TIME_REP,
                                            GR_SCORE_ID  => GR_SCORE_REP,
                                            GR_NSCORE_ID => GR_NSCORE_REP);

  function sidx (row_idx   : natural; col_idx : natural) return natural;
  function soidx (row_idx  : natural; col_idx : natural; offset : natural) return natural;
  function roidx (gr_el_id : natural; offset : natural) return natural;

  function HB2ASCII_HEX (half_byte : std_logic_vector) return std_logic_vector;

end graphics_constants;

--------------------------------------------------------------------------------

package body graphics_constants is

  -- vram index
  function sidx (row_idx : natural; col_idx : natural) return natural is
  begin
    return N_SCN_COL * row_idx + col_idx;
  end sidx;

  -- vram index + offset
  function soidx (row_idx : natural; col_idx : natural; offset : natural) return natural is
  begin
    return N_SCN_COL * row_idx + col_idx + offset;
  end soidx;

  -- ram_gr_rep index + offset
  function roidx (gr_el_id : natural; offset : natural) return natural is
  begin
    return GR_ELEMENT_MAX_REP_LEN * gr_el_id + offset;
  end roidx;

  function HB2ASCII_HEX (half_byte : std_logic_vector) return std_logic_vector is
  begin
    if to_integer(unsigned(half_byte)) < 10 then
      return std_logic_vector(to_unsigned(to_integer(unsigned(half_byte)) + 48, 8));
    else
      return std_logic_vector(to_unsigned(to_integer(unsigned(half_byte)) + 55, 8));  -- num - 10 + 65: upper case letters in ASCII
    end if;
  end HB2ASCII_HEX;

end graphics_constants;
