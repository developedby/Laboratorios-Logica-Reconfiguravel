library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nios_userhw is
	port
	(
		clk, rst: in std_logic;
		disp_r1_1, disp_r1_2: out std_logic_vector(7 downto 0);
		disp_r0_1, disp_r0_2: out std_logic_vector(7 downto 0);
		disp_count_1, disp_count_2: out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch of nios_userhw is
	component jtag_uart_sys is
		port
		(
			clk_clk          : in  std_logic                     := '0';             --       clk.clk
			rcvd_byte_export : out std_logic_vector(8 downto 0);                     -- rcvd_byte.export
			regs_export      : in  std_logic_vector(16 downto 0) := (others => '0'); --      regs.export
			reset_reset_n    : in  std_logic                     := '0'              --     reset.reset_n
		);
	end component;
	component userhw is
		port
		(
			clk, rst : in std_logic;
			uart_byte : in std_logic_vector(7 downto 0);
			rx_rdy: in std_logic;
			tx_rdy: out std_logic;
			reg0, reg1 : out std_logic_vector(7 downto 0)
		);
	end component;
			
	signal rcvd_byte_w_rdy : std_logic_vector(8 downto 0);
	signal regs_w_rdy: std_logic_vector(16 downto 0);
begin

	uart: jtag_uart_sys
		port map
		(
			clk_clk => clk,
			rcvd_byte_export => rcvd_byte_w_rdy,
			regs_export => regs_w_rdy,
			reset_reset_n => rst			
		);

	my_hw: userhw
		port map
		(
			clk => clk,
			rst => rst,
			uart_byte => rcvd_byte_w_rdy(7 downto 0),
			rx_rdy => rcvd_byte_w_rdy(8),
			tx_rdy => regs_w_rdy(16),
			reg0 => regs_w_rdy(7 downto 0),
			reg1 => regs_w_rdy(15 downto 8)
		);
		
end architecture;