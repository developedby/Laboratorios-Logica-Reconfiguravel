library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometro_digital_tb is
end entity;

architecture arch of cronometro_digital_tb is
	component cronometro_digital is
		port
	  (
		  clk, hard_rst, btn1, btn2 : in std_logic;
		  d10e_m2 : out unsigned(6 downto 0); -- display de 10^-2 s
		  d10e_m1 : out unsigned(6 downto 0); -- display de 10^-1 s
		  d10e_0 : out unsigned(6 downto 0); -- display de 10^0 s
    		d10e_1 : out unsigned(6 downto 0); -- display de 10^1 s
		  display_en : in std_logic
   	);
	end component;
	signal clk, btn1, btn2, display_en, hard_rst : std_logic;
	signal d10e_m2, d10e_m1, d10e_0, d10e_1 : unsigned(6 downto 0);
begin
	uut: cronometro_digital
	port map
	(
		clk => clk,
		hard_rst => hard_rst,
		btn1 => btn1,
		btn2 => btn2,
		display_en => display_en,
		d10e_m2 => d10e_m2,
		d10e_m1 => d10e_m1,
		d10e_0 => d10e_0,
		d10e_1 => d10e_1
	);
	process
	begin
		clk <= '1';
		wait for 20 ns;
		clk <= '0';
		wait for 20 ns;
	end process;
	process
	begin
	  hard_rst <= '1';
		btn1 <= '1';
		btn2 <= '1';
		display_en <= '1';
		wait for 10 ns;
		hard_rst <= '0';
		wait for 100 ms;
		btn1 <= '0';
		wait for 100 ms;
		btn1 <= '1';
		wait for 62000 ms;
		
		btn1 <= '0';
		wait for 100 ms;
		btn1 <= '1';
		wait for 100 ms;
		btn2 <= '0';
		wait for 100 ms;
		btn2 <= '1';
		wait for 100 ms;
		btn1 <= '0';
		wait for 100 ms;
		btn1 <= '1';
		wait for 10000 ms;
	end process;	
end architecture;