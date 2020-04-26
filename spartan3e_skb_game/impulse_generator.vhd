	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity impulse_generator is
    Port ( generate_impulse : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           impulse_out : out  STD_LOGIC);
end impulse_generator;

architecture Behavioral of impulse_generator is

	type generator_state is (standby, make_impulse, wait_for_reset); 
   signal state, next_state : generator_state; 

begin

   SYNC_PROC: process (clock, reset)
   begin
		if reset = '1' then
			state <= standby;
      else 
			if rising_edge(clock) then
				state <= next_state;
			end if;
		end if;
   end process;
  
   NEXT_STATE_DECODE: process (state, generate_impulse)
   begin
      next_state <= state;
		
      case (state) is
         when standby =>
            if generate_impulse = '1' then
               next_state <= make_impulse;
            end if;
         when make_impulse =>
				next_state <= wait_for_reset;
			when wait_for_reset =>
				null;
      end case;      
   end process;
	
	impulse_out <= '1' when state = make_impulse else '0';

end Behavioral;
