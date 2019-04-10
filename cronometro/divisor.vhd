Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity divisor is

port	(clk: in std_logic;
		 rst: in std_logic;
		 div: out std_logic
		 );
		 
End entity;

Architecture x of divisor is

SIGNAL CONT: integer range 0 to 500000;

begin
process (rst,clk)
begin
	if rst = '1' then
		div <= '0';
		CONT <= 0;
	Elsif clk = '1' and clk'event then
		if CONT = 500000 then
			div <= '1';
			CONT <= 0;
		ELSE
			CONT <= CONT +1;
			div <= '0';
		end if;
	end if;
end process;
end architecture;