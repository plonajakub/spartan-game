library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity game_loop_state_machine is
    Port ( next_state_signal : in  STD_LOGIC;
           current_state_bus : out  STD_LOGIC_VECTOR (2 downto 0);
           sync_reset : in  STD_LOGIC;
           clock : in  STD_LOGIC);
end game_loop_state_machine;

architecture Behavioral of game_loop_state_machine is

   type game_state is (	st0_welcome_screen,
								st1_game_started, --impulse
								st2_game_running,
								st3_game_stopped, --impulse
								st4_game_over,
								st5_game_resumed);--impulse
   
	signal state, next_state : game_state; 

begin

   SYNC_PROC: process (clock)
   begin
      if rising_edge(clock) then
         if sync_reset = '1' then
            state <= st0_welcome_screen;
         else
            state <= next_state;
         end if;        
      end if;
   end process;
 
   OUTPUT_DECODE: process (state)
   begin
      if state = st0_welcome_screen then
         current_state_bus <= "000";
      elsif state = st1_game_started then
         current_state_bus <= "001";
		elsif state = st2_game_running then
         current_state_bus <= "010";
		elsif state = st3_game_stopped then
         current_state_bus <= "011";
		elsif state = st4_game_over then
         current_state_bus <= "100";
		elsif state = st5_game_resumed then
         current_state_bus <= "101";
		else
			current_state_bus <= "XXX";
      end if;
   end process;
 
   NEXT_STATE_DECODE: process (state, next_state_signal)
   begin
      next_state <= state;
      case (state) is
         when st0_welcome_screen =>
            if next_state_signal = '1' then
               next_state <= st1_game_started;
            end if;
         when st1_game_started =>
				next_state <= st2_game_running;
         when st2_game_running =>
            if next_state_signal = '1' then
               next_state <= st3_game_stopped;
            end if;
			when st3_game_stopped =>
				next_state <= st4_game_over;
         when st4_game_over =>
            if next_state_signal = '1' then
               next_state <= st5_game_resumed;
            end if;
			when st5_game_resumed =>
				next_state <= st1_game_started;
      end case;      
   end process;
	
end Behavioral;

