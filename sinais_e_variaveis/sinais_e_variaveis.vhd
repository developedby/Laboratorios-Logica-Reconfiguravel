library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sinais_e_variaveis is
	port 
	(
		clk, rst : in std_logic;
		-- saidas nos displays 7seg
		d_ex1_signal_out : out unsigned(6 downto 0); --hex7
		d_ex1_var_out : out unsigned(6 downto 0); --hex6
		d_ex2_for_out : out unsigned(6 downto 0); --hex3
		d_ex2_while_out : out unsigned(6 downto 0); --hex2
		d_ex2_signal_out : out unsigned(6 downto 0); --hex1
		d_ex2_raw_out : out unsigned(6 downto 0) --hex0
	);
end entity;

architecture arch of sinais_e_variaveis is
	component ex1 is
		port
		(
			clk, rst : in std_logic;
			signal_out : out unsigned(2 downto 0);
			var_out : out unsigned(2 downto 0)
		);
	end component;
	component ex2 is
		port
		(
			clk, rst : in std_logic;
			numero : in unsigned(2 downto 0);
			for_out : out unsigned(1 downto 0);
			while_out : out unsigned(1 downto 0);
			signal_out : out unsigned(1 downto 0);
			raw_out : out unsigned(1 downto 0)
		);
	end component;
	component bcd_7seg is
		port
		(
			en : in std_logic; 
			i : in unsigned (3 downto 0); 
			dot: in std_logic; 
			o : out unsigned (6 downto 0); 
			dp : out std_logic; 
			clk : in std_logic
		);
	end component;
	
begin

	
end architecture;