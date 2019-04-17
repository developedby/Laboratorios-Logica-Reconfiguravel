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
		signal_out : out unsigned(1 downto 0)
	);
end entity;
	
architecture arch of ex2 is

begin

	signal_out <=
		"00" when numero(0) = '0' and numero(1) = '0' and numero(2) = '0' else
		"01" when numero(0) = '1' and numero(1) = '0' and numero(2) = '0' else
		"01" when numero(0) = '0' and numero(1) = '1' and numero(2) = '0' else
		"10" when numero(0) = '1' and numero(1) = '1' and numero(2) = '0' else
		"01" when numero(0) = '0' and numero(1) = '0' and numero(2) = '1' else
		"10" when numero(0) = '1' and numero(1) = '0' and numero(2) = '1' else
		"10" when numero(0) = '0' and numero(1) = '1' and numero(2) = '1' else
		"11" when numero(0) = '1' and numero(1) = '1' and numero(2) = '1' else
		"00";
		
	process(numero)
		variable for_var : unsigned(1 downto 0);
	begin
		for_var := "00";
		for i in 0 to 2 loop
			if numero(i) = '1' then
				for_var := for_var + 1;
			end if;
		end loop;	
		for_out <= for_var;
	end process;
	
	process(numero)
		variable while_var : unsigned(1 downto 0);
		variable i : integer;
	begin
		while_var := "00";
		i := 0;
		while i < 3 loop
			if numero(i) = '1' then
				while_var := while_var + 1;
			end if;
			i := i + 1;
		end loop;
		while_out <= while_var;
	end process;
	
end architecture;