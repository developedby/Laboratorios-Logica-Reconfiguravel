library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg32_avalon_interface_tb is
end entity;

architecture test of reg32_avalon_interface_tb is

component reg32_avalon_interface
	PORT ( clock, resetn : IN STD_LOGIC;
	read, write, chipselect : IN STD_LOGIC;
	writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Q_export : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
END component;

signal clock, resetn, read, write, chipselect : std_logic;
signal byteenable : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal writedata, readdata, Q_export : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

	uut : reg32_avalon_interface
	port map
	(
		clock, resetn, read, write, chipselect, writedata, byteenable, readdata, Q_export
	);
	
	process
	begin
		clock <= '1';
		wait for 10 ns;
		clock <= '0';
		wait for 10 ns;
	end process;
	
	process
	begin
		resetn <= '0';
		wait for 100 ns;
		resetn <= '1';
		wait for 20 ns;
		
		byteenable <= "0001";
		writedata(31 downto 8) <= (others => '0');
		writedata(7 downto 0) <= "10010111"; -- 100 101 11 write, load, enable, 5 
		write <= '1';
		chipselect <= '1';
		wait for 20 ns;
		
		writedata <= (others => '0');
		write <= '0';
		chipselect <= '0';
		wait for 100 ns;
		
		
		writedata(31 downto 8) <= (others => '0');
		writedata(7 downto 0) <= "11100010"; -- 111 00010 load, 16 (21 no total)
		write <= '1';
		chipselect <= '1';
		wait for 20 ns;
		
		writedata <= (others => '0');
		write <= '0';
		chipselect <= '0';
		wait for 100 ns;
		
		
		writedata(31 downto 8) <= (others => '0');
		writedata(7 downto 0) <= "10000001"; -- 100 000 11 no load, enable
		write <= '1';
		chipselect <= '1';
		wait for 20 ns;
		
		writedata <= (others => '0');
		write <= '0';
		chipselect <= '0';
		wait for 100 ns;
		
		
		writedata(31 downto 8) <= (others => '0');
		writedata(7 downto 0) <= "01100000"; -- read, reg1 e reg0
		write <= '1';
		chipselect <= '1';
		wait for 20 ns;
		
		writedata <= (others => '0');
		write <= '0';
		chipselect <= '0';
		wait;
	end process;
	
end architecture;