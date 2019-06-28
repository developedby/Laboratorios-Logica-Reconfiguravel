library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity userhw is
	port
	(
		clk, rst: in std_logic;
		uart_byte_in: in std_logic_vector(7 downto 0);
		avalon_enable: in std_logic;
		uart_byte_out: out std_logic_vector(15 downto 0)
	);
end entity;

architecture arch of userhw is

signal counter_load, counter_out, bit_counter_high_out, bit_counter_low_out: std_logic_vector(7 downto 0);
signal counter_ld, counter_en: std_logic;
signal out_sel: std_logic_vector(1 downto 0);

component uart_byte_ctl
	port
	(
		clk, rst : in std_logic;
		uart_byte : in std_logic_vector(7 downto 0);
		avalon_en : in std_logic;
		load_data : out std_logic_vector(7 downto 0);
		load_counter : out std_logic;
		en_counter : out std_logic;
		out_sel: out std_logic_vector(1 downto 0)
	);
end component;

component cont8
	port
	(
		clk, rst, en, clr, ld : in std_logic;
		load : in std_logic_vector(7 downto 0);
		saida : out std_logic_vector(7 downto 0)
	);
end component;

component bit_counter
	port
	(
		clk, rst : in std_logic;
		input : in std_logic_vector(7 downto 0);
		for_out : out std_logic_vector(7 downto 0)
	);
end component;

begin

counter : cont8
port map
(
	clk,
	rst,
	counter_en,
	'0',
	counter_ld,
	counter_load,
	counter_out
);

control : uart_byte_ctl
port map
(
	clk,
	rst,
	uart_byte_in,
	avalon_enable,
	counter_load,
	counter_ld,
	counter_en,
	out_sel
);
	
bit_counter_high : bit_counter
port map
(
	clk,
	rst,
	counter_out,
	bit_counter_high_out
);

bit_counter_low : bit_counter
port map
(
	clk,
	rst,
	not counter_out,
	bit_counter_low_out
);

uart_byte_out(15 downto 8) <= bit_counter_high_out when out_sel = "11" else (others => '0');
uart_byte_out(7 downto 0) <= bit_counter_high_out when out_sel = "10" else
									  bit_counter_low_out when out_sel(0) = '1' else (others => '0');
	
end architecture;