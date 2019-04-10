library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex1 is
	port
	(
		clk, rst : in std_logic;
		signal_out : out unsigned(2 downto 0);
		var_out : out unsigned(2 downto 0)
	);
end entity;
	
architecture arch of ex1 is
signal count_signal : unsigned(2 downto 0);
begin
	signal_out <= count_signal;

	process(rst, clk)
		variable count_var : unsigned(2 downto 0);
	begin
		if rst = '1' then
			count_signal <= "000";
			count_var := "000";
		elsif clk = '1' and clk'event then
			if count_signal >= 7 then
				count_signal <= "000";
			else
				count_signal <= count_signal + 1;
			end if;
			if count_var >= 7 then
				count_var := "000";
			else
				count_var := count_var + 1;
			end if;
		end if;
		var_out <= count_var;
	end process;
end architecture;