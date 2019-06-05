library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_byte_ctl is
begin
	clk, rst : in std_logic; -- Clk igual ao baud rate
	uart_byte : in std_logic_vector(7 downto 0);
	load_data : out std_logic_vector(7 downto 0);
	load_counter : out std_logic;
	en_counter : out std_logic;
end entity;

architecture arch of uart_byte_ctl is
	type states is (command, load);
	signal state_reg, state_next: states;
	
	signal last_byte : std_logic_vector(7 downto 0);
	signal cmd : std_logic_vector(2 downto 0);
	signal load_bit, enable_bit, last_en_bit : std_logic;
	signal data0 : std_logic_vector(2 downto 0);
	signal data1 : std_logic_vector(4 downto 0);
begin
	rw_bit <= uart_byte(7);
	
	cmd <= uart_byte(7 downto 5);
	
	load_bit <= uart_byte(1);
	
	enable_bit <= uart_byte(0);
	last_en_bit <= last_byte(0);
	
	data0 <= last_byte(4 downto 2);
	data1 <= uart_byte(4 downto 0);
	load_data <= data0 & data1;

	process (state_reg, cmd)
	begin
		if state_reg = command then
			if cmd /= "111" then
				next_state <= command;
			else
				next_state <= load;
			end if;
		elsif state_reg = load then
			next_state <= command;
		end if;
	end process;
	
	process(clk, rst)
	begin
		if rst = '1' then
			state_reg <= command;
			last_byte <= "00000000";
		elsif rising_edge(clk) then
			state_reg <= next_state;
			last_byte <= uart_byte;
		end if;
	end process;
	
	load_counter <= '1' when state_reg = load and cmd = "111" else '0';
	en_counter <= '1' when state_reg = command and cmd = "100" and load_bit = '0' else
					  '1' when state_reg = load and last_en_bit = '0' else
					  '0';
	
end architecture;
