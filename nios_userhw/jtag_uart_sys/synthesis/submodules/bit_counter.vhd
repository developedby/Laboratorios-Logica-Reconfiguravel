library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_counter is
	port
	(
		clk, rst : in std_logic;
		input : in std_logic_vector(7 downto 0);
		for_out : out std_logic_vector(7 downto 0)
	);
end entity;
	
architecture arch of bit_counter is

begin
		
	process(input)
		variable for_var : std_logic_vector(7 downto 0);
	begin
		for_var := "00000000";
		for i in 0 to 7 loop
			if input(i) = '1' then
				for_var := std_logic_vector(unsigned(for_var) + 1);
			end if;
		end loop;	
		for_out <= for_var;
	end process;

end architecture;