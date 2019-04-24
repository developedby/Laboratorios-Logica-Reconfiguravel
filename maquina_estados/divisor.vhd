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
-- Divide por 50 milhoes (para dar 1Hz)
SIGNAL CONT: integer range 0 to 5; -- mudar para algo pequeno para fazer a simulacao (muito mais rapido)

begin
process (rst,clk)
begin
	if rst = '1' then
		div <= '0';
		CONT <= 0;
	Elsif clk = '1' and clk'event then
		if CONT = 5 then -- Mudar aqui tambem para a simulacao
			div <= '1';
			CONT <= 0;
		ELSE
			CONT <= CONT +1;
			div <= '0';
		end if;
	end if;
end process;
end architecture;