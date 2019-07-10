LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY gc_avalon_interface IS
	PORT
	(
		clock, resetn : IN STD_LOGIC;
		readdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
		ctrl_pin : inout std_logic
	);
END gc_avalon_interface;

ARCHITECTURE arch OF gc_avalon_interface IS
	signal reset: std_logic;
	 
	component gamecube_controller
		port
		 (
			  clk, rst: in std_logic;
			  readdata: out std_logic_vector(63 downto 0);
			  ctrl_pin: inout std_logic
		 );
	end component;
BEGIN
	gc: gamecube_controller
	port map 
	(
		clk => clock,
		rst => reset,
		readdata => readdata,
		ctrl_pin => ctrl_pin
	);
	reset <= not resetn;
END architecture;