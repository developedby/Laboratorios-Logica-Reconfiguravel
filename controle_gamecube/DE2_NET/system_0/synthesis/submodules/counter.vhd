library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	generic (data_width : integer);
	port
	(
		clk, rst: in std_logic;
		clr, en: in std_logic;
		saida : out unsigned((data_width - 1) downto 0)
	);
end entity;

architecture arq of counter is
signal saida_s : unsigned((data_width - 1) downto 0);
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