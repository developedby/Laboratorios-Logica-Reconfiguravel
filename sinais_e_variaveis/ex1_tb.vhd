library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex1_tb is
end entity;
	
architecture test of ex1_tb is
	component ex1 is
		port
		(
			clk, rst : in std_logic;
			signal_out : out unsigned(2 downto 0);
			var_out : out unsigned(2 downto 0)
		);
	end component;
	signal clk, rst: std_logic;
	signal signal_out, var_out : unsigned(2 downto 0);
	
begin

	uut: ex1
	port map
	(
		clk => clk,
		rst => rst,
		signal_out => signal_out,
		var_out => var_out
	);
	
	process
	begin
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait;
	end process;
	
	process
	begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
	end process;	
end architecture;
	