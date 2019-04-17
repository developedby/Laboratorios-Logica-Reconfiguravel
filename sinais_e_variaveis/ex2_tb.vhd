library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex2_tb is
end entity;
	
architecture test of ex2_tb is
	component ex2 is
		port
		(
			clk, rst : in std_logic;
			numero : in unsigned(2 downto 0);
			for_out : out unsigned(1 downto 0);
			while_out : out unsigned(1 downto 0);
			signal_out : out unsigned(1 downto 0)
		);
	end component;
	signal clk, rst: std_logic;
	signal numero : unsigned(2 downto 0);
	signal for_out, while_out, signal_out : unsigned(1 downto 0);
	
begin
	uut: ex2
	port map
	(
		clk => clk,
		rst => rst,
		numero => numero,
		for_out => for_out,
		while_out => while_out,
		signal_out => signal_out
	);
	
	process
	begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
	end process;	
	
	process
	begin
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait;
	end process;	
	
	process
	begin
		numero <= "000";
		wait for 21 ns;
		numero <= "001";
		wait for 21 ns;
		numero <= "010";
		wait for 21 ns;
		numero <= "011";
		wait for 21 ns;
		numero <= "100";
		wait for 21 ns;
		numero <= "101";
		wait for 21 ns;
		numero <= "110";
		wait for 21 ns;
		numero <= "111";
		wait;
	end process;
	
end architecture;
	