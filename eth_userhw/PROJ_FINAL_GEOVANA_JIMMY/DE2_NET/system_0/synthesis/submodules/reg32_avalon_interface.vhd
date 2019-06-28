LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY reg32_avalon_interface IS
	PORT ( clock, resetn : IN STD_LOGIC;
	read, write, chipselect : IN STD_LOGIC;
	writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END reg32_avalon_interface;

ARCHITECTURE Structure OF reg32_avalon_interface IS
SIGNAL local_byteenable : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL to_userhw: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal from_userhw: std_logic_vector(15 downto 0);

component userhw
	port
	(
		clk, rst: in std_logic;
		uart_byte_in: in std_logic_vector(7 downto 0);
		avalon_enable: in std_logic;
		uart_byte_out: out std_logic_vector(15 downto 0)
	);
end component;

BEGIN
	to_userhw <= writedata(7 downto 0);
	WITH (chipselect AND write) SELECT
		local_byteenable <= byteenable WHEN '1', "0000" WHEN OTHERS;
	user_hw: userhw
	port map 
	(
		clock,
		(not resetn),
		to_userhw,
		local_byteenable(0),
		from_userhw
	);
	
	readdata(15 downto 0) <= from_userhw;
	readdata(31 downto 16) <= (others => '0');
END Structure;