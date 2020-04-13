-- Vhdl test bench created from schematic C:\Users\mariu\Desktop\PWr\Semestr VI\UCiSW_2\spartan-game\spartan3e_skb_game\keyboard_key_resolver.sch - Mon Apr 13 16:47:26 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY keyboard_key_resolver_keyboard_key_resolver_sch_tb IS
END keyboard_key_resolver_keyboard_key_resolver_sch_tb;
ARCHITECTURE behavioral OF 
      keyboard_key_resolver_keyboard_key_resolver_sch_tb IS 

   COMPONENT keyboard_key_resolver
   PORT( B	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          Ret	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0));
   END COMPONENT;

   SIGNAL B	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL Ret	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	constant Clk_period : time := 10 ns;

BEGIN

   UUT: keyboard_key_resolver PORT MAP(
		B => B, 
		Ret => Ret
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		B <= X"30";
		wait for Clk_period;
		
		B <= X"31";
		wait for Clk_period;
		
		B <= X"32";
		wait for Clk_period;
		
		B <= X"33";
		wait for Clk_period;
		
		B <= X"34";
		wait for Clk_period;
		
		B <= X"35";
		wait for Clk_period;
		
		B <= X"36";
		wait for Clk_period;
		
		B <= X"37";
		wait for Clk_period;
		
		B <= X"38";
		wait for Clk_period;

		B <= X"39";
		wait for Clk_period;
		
		B <= X"40";
		WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
