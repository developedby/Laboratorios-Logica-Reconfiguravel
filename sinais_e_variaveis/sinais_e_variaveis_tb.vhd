library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sinais_e_variaveis_tb is
end entity;
	
architecture test of sinais_e_variaveis_tb is
	component sinais_e_variaveis is
		port 
		(
			clk, rst : in std_logic;
			-- saidas nos displays 7seg
			d_ex1_signal_out : out std_logic_vector(6 downto 0); --hex0
			d_ex1_var_out : out std_logic_vector(6 downto 0); --hex1
			d_ex2_for_out : out std_logic_vector(6 downto 0); --hex2
			d_ex2_while_out : out std_logic_vector(6 downto 0); --hex4
			d_ex2_signal_out : out std_logic_vector(6 downto 0) --hex3
		);
	end component;
	
	signal clk, rst: std_logic;
	signal d_ex1_signal_out, d_ex1_var_out, d_ex2_for_out, d_ex2_while_out, d_ex2_signal_out: std_logic_vector(6 downto 0);
begin

	uut: sinais_e_variaveis
	port map
	(
		clk => clk,
		rst => rst,
		d_ex1_signal_out => d_ex1_signal_out,
		d_ex1_var_out => d_ex1_var_out,
		d_ex2_for_out => d_ex2_for_out,
		d_ex2_while_out => d_ex2_while_out,
		d_ex2_signal_out => d_ex2_signal_out
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
	