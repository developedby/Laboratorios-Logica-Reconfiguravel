library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex2 is
	port
	(
		clk, rst : in std_logic;
		numero : in unsigned(2 downto 0);
		for_out : out unsigned(1 downto 0);
		while_out : out unsigned(1 downto 0);
		signal_out : out unsigned(1 downto 0);
		raw_out : out unsigned(1 downto 0)
	);
end entity;
	
architecture arch of ex2 is

signal num0, num1, num2 : unsigned;
begin
	num0 <= numero(0);
	num1 <= numero(1);
	num2 <= numero(2);

	raw_out <= numero(2) + numero(1) + numero(0);
	signal_out <=
		"00" when num0 = 0 and num1 = 0 and num2 = 0 else
		"01" when num0 = 1 and num1 = 0 and num2 = 0 else
		"01" when num0 = 0 and num1 = 1 and num2 = 0 else
		"10" when num0 = 1 and num1 = 1 and num2 = 0 else
		"01" when num0 = 0 and num1 = 0 and num2 = 1 else
		"10" when num0 = 1 and num1 = 0 and num2 = 1 else
		"10" when num0 = 0 and num1 = 1 and num2 = 1 else
		"11" when num0 = 1 and num1 = 1 and num2 = 1 else
		"00";