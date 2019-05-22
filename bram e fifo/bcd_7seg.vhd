-- Por Nicolas Abril e Lucca Rawlyk

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_7seg is
	port
	(
		en : in std_logic;
		i : in unsigned (3 downto 0);
		dot: in std_logic;
		o : out unsigned (6 downto 0);
		dp : out std_logic
	);
end entity;

architecture arch_BCD_7seg of BCD_7seg is
begin
	dp <= dot and en;
	o <= 
		"0000001" when en = '1' and (i = "0000") else -- logica negativa
		"1001111" when en = '1' and (i = "0001") else
		"0010010" when en = '1' and (i = "0010") else
		"0000110" when en = '1' and (i = "0011") else
		"1001100" when en = '1' and (i = "0100") else
		"0100100" when en = '1' and (i = "0101") else
		"0100000" when en = '1' and (i = "0110") else
		"0001111" when en = '1' and (i = "0111") else
		"0000000" when en = '1' and (i = "1000") else
		"0000100" when en = '1' and (i = "1001") else
		"1111111";
end architecture;