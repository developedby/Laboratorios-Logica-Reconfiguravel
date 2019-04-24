library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count8 is
	port
	(
		clk, rst, en, clr : in std_logic;
		saida : out unsigned(2 downto 0)
	);
end entity;

architecture arq of count8 is
signal saida_s : unsigned(2 downto 0);
begin
saida <= saida_s;
	process(clk, rst)
		begin
		if rst = '1' then
			saida_s <= (others => '0');
		elsif clk' event and clk = '1' then
			if clr = '1'then
				saida_s <= (others => '0');
			else
				if en = '1' then
					saida_s <= saida_s + 1;
				end if;
			end if;
      end if;
	end process;
end architecture;