library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maquina_estados_tb is
end entity;

architecture teste of maquina_estados_tb is
	signal clk, rst : std_logic;
	signal btn_comeca : std_logic;
	signal display_sem1 : std_logic_vector(6 downto 0);
	signal display_sem2 : std_logic_vector(6 downto 0);
	
	component maquina_estados is
	port
	(
		clk, rst : in std_logic;
		btn_comeca : in std_logic;
		display_sem1 : out std_logic_vector(6 downto 0);
		display_sem2 : out std_logic_vector(6 downto 0)
	);
	end component;
begin
	uut: maquina_estados
		port map
		(
			clk => clk,
			rst => rst,
			btn_comeca => btn_comeca,
			display_sem1 => display_sem1,
			display_sem2 => display_sem2
		);

	process
	begin
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait;
	end process;
	
	process
	begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
	end process;
	
	process
	begin
		btn_comeca <= '1'; -- botao tem logica negativa
		wait for 10 us;
		btn_comeca <= '0';
		wait for 100 ns;
		btn_comeca <= '1';
		wait;
	end process;
end architecture;