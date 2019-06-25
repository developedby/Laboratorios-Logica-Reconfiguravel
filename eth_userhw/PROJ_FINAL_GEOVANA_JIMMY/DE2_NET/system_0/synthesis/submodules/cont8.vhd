library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont8 is
	port
	(
		clk, rst, en, clr, ld : in std_logic;
		load : in std_logic_vector(7 downto 0);
		saida : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arq of cont8 is
signal saida_s : std_logic_vector(7 downto 0);
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
					if ld = '1' then
						saida_s <= load;
					else
						saida_s <= std_logic_vector(unsigned(saida_s) + 1);
					end if;
				end if;
			end if;
      end if;
	end process;
end architecture;