library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bram_fifo_tb is
end entity;

architecture test of bram_fifo_tb is
	component bram_fifo is
		port
		(
			clk, rst 			: in std_logic;
			rd_addr_ram_rd_sw : in std_logic_vector (9 downto 0);
			pause_sw 			: in std_logic;
			disp_10_2 			: out unsigned (6 downto 0);
			disp_10_1			: out unsigned (6 downto 0);
			disp_10_0 			: out unsigned (6 downto 0)
		);
	end component;
	
signal clk, rst, pause_sw : std_logic;
signal rd_addr_ram_rd_sw : std_logic_vector (9 downto 0);
signal disp_10_2, disp_10_1, disp_10_0 : unsigned (6 downto 0);

begin

	uut: bram_fifo
	port map
	(
		clk => clk,
		rst => rst,
		pause_sw => pause_sw,
		disp_10_0 => disp_10_0,
		disp_10_1 => disp_10_1,
		disp_10_2 => disp_10_2,
		rd_addr_ram_rd_sw => rd_addr_ram_rd_sw
	);

	rd_addr_ram_rd_sw <= "0000000000";
	pause_sw <= '0';
	
	process
	begin
		rst <= '1';
		wait for 10 us;
		rst <= '0';
		wait;
	end process;

	process
	begin
		clk <= '1';
		wait for 50 ns;
		clk <= '0';
		wait for 50 ns;
	end process;
end architecture;