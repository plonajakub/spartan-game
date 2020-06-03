
-- VHDL Instantiation Created from source file task_master.vhd -- 23:41:51 05/24/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT task_master
	PORT(
		game_clock_i : IN std_logic;
		start_task_i : IN std_logic;
		coded_answer : IN std_logic_vector(7 downto 0);
		correct_answer : IN std_logic_vector(7 downto 0);
		current_task_description : IN std_logic_vector(7 downto 0);          
		game_clock_o : OUT std_logic;
		current_task_state : OUT std_logic_vector(2 downto 0);
		task_points : OUT std_logic_vector(7 downto 0);
		task_finished : OUT std_logic;
		graphics_handle : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_task_master: task_master PORT MAP(
		game_clock_i => ,
		start_task_i => ,
		coded_answer => ,
		correct_answer => ,
		current_task_description => ,
		game_clock_o => ,
		current_task_state => ,
		task_points => ,
		task_finished => ,
		graphics_handle => 
	);


