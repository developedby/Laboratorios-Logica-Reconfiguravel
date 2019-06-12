library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity userhw is
port
	(
		clk, rst : in std_logic;
		uart_byte : in std_logic_vector(7 downto 0);
		rx_rdy: in std_logic;
		tx_rdy: out std_logic;
		reg0, reg1 : out std_logic_vector(7 downto 0)
	);
end entity;

architecture arch of userhw is

begin
	
end architecture;