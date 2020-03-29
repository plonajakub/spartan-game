
-- VHDL Instantiation Created from source file game_running_state_machine.vhd -- 00:17:59 03/30/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT game_running_state_machine
	PORT(
		next_state_signal : IN std_logic;
		sync_reset : IN std_logic;
		clock : IN std_logic;          
		current_state_bus : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_game_running_state_machine: game_running_state_machine PORT MAP(
		next_state_signal => ,
		current_state_bus => ,
		sync_reset => ,
		clock => 
	);


