library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


use work.game_master_constants.all;

entity game_loop_sm is
	port(
		b_next_state : in STD_LOGIC_VECTOR(2 downto 0);
        s_reset : in STD_LOGIC;
        clock : in STD_LOGIC;
		b_current_state : out STD_LOGIC_VECTOR (2 downto 0)
		);
end game_loop_sm;

architecture Behavioral of game_loop_sm is

	constant C_START_BUTTON_PRESSED : STD_LOGIC_VECTOR(2 downto 0) := "001";
	constant C_GAME_ENDED : STD_LOGIC_VECTOR(2 downto 0) := "010";
	constant C_NEW_GAME_BUTTON_PRESSED : STD_LOGIC_VECTOR(2 downto 0) := "100";
	
	type game_state is (
		st0_welcome_screen,
		st1_game_running_i, --impulse
		st2_game_running,
		st3_game_over_i, --impulse
		st4_game_over
	);
	signal state, next_state : game_state; 

begin

   SYNC_PROC: process (clock)
   begin
      if rising_edge(clock) then
         if s_reset = '1' then
            state <= st0_welcome_screen;
         else
            state <= next_state;
         end if;        
      end if;
   end process;
 
  NEXT_STATE_DECODE: process (state, b_next_state)
  begin
    next_state <= state;
	case (state) is
		when st0_welcome_screen =>
			if b_next_state = C_START_BUTTON_PRESSED then
				next_state <= st1_game_running_i;
            end if;
        when st1_game_running_i =>
			next_state <= st2_game_running;
        when st2_game_running =>
            if b_next_state = C_GAME_ENDED then
				next_state <= st3_game_over_i;
            end if;
		when st3_game_over_i =>
			next_state <= st4_game_over;
        when st4_game_over =>
            if b_next_state = C_NEW_GAME_BUTTON_PRESSED then
				next_state <= st1_game_running_i;
			end if;
		end case;      
	end process;
	
	b_current_state <= 	C_ST0_WELCOME_SCREEN when state = st0_welcome_screen else
						C_ST1_GAME_RUNNING_I when state = st1_game_running_i else
						C_ST2_GAME_RUNNING when state = st2_game_running else
						C_ST3_GAME_OVER_I when state = st3_game_over_i else
						C_ST4_GAME_OVER when state = st4_game_over else
						"XXX";
	
end Behavioral;

