library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sinais_e_variaveis is
	port 
	(
		clk, rst : in std_logic;
		-- saidas nos displays 7seg
		d_ex1_signal_out : out unsigned(6 downto 0); --hex0
		d_ex1_var_out : out unsigned(6 downto 0); --hex1
		d_ex2_for_out : out unsigned(6 downto 0); --hex2
		d_ex2_while_out : out unsigned(6 downto 0); --hex3
		d_ex2_signal_out : out unsigned(6 downto 0) --hex4
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
			clk : in std_logic;
			rst : in std_logic;
			numero : in unsigned(2 downto 0);
			for_out : out unsigned(1 downto 0);
			while_out : out unsigned(1 downto 0);
			signal_out : out unsigned(1 downto 0)
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
	signal ex1_signal_out, ex1_var_out : unsigned(2 downto 0);
	signal ex2_for_out, ex2_while_out, ex2_signal_out : unsigned(1 downto 0);
	signal ex1_signal_out_c, ex1_var_out_c, ex2_for_out_c, ex2_while_out_c, ex2_signal_out_c : unsigned(3 downto 0);
begin
	ex1_signal_out_c <= "0" & ex1_signal_out;
	ex1_var_out_c <= "0" & ex1_var_out;
	ex2_for_out_c <= "00" & ex2_for_out;
	ex2_while_out_c <= "00" & ex2_while_out;
	ex2_signal_out_c <= "00" & ex2_signal_out;

	iex1: ex1
	port map
	(
		clk => clk,
		rst => rst,
		signal_out => ex1_signal_out,
		var_out => ex1_var_out
	);
	
	iex2: ex2
	port map
	(
		clk => clk,
		rst => rst,
		numero => ex1_var_out,
		for_out => ex2_for_out,
		while_out => ex2_while_out,
		signal_out => ex2_signal_out
	);
	
	bcd_ex1_signal: bcd_7seg
	port map
	(
		en => '1',
		i => ex1_signal_out_c,
		dot => '0',
		o => d_ex1_signal_out,
		clk => clk
	);
	
	bcd_ex1_var: bcd_7seg
	port map
	(
		en => '1',
		i => ex1_var_out_c,
		dot => '0',
		o => d_ex1_var_out,
		clk => clk
	);
	
	bcd_for: bcd_7seg
	port map
	(
		en => '1',
		i => ex2_for_out_c,
		dot => '0',
		o => d_ex2_for_out,
		clk => clk
	);
	
	bcd_while: bcd_7seg
	port map
	(
		en => '1',
		i => ex2_while_out_c,
		dot => '0',
		o => d_ex2_while_out,
		clk => clk
	);
	
	bcd_signal: bcd_7seg
	port map
	(
		en => '1',
		i => ex2_signal_out_c,
		dot => '0',
		o => d_ex2_signal_out,
		clk => clk
	);
	
end architecture;