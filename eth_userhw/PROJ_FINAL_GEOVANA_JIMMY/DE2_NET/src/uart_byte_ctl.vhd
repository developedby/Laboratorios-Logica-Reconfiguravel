library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_byte_ctl is
	port
	(
		clk, rst : in std_logic;
		uart_byte : in std_logic_vector(7 downto 0);
		avalon_en : in std_logic;
		load_data : out std_logic_vector(7 downto 0);
		load_counter : out std_logic;
		en_counter : out std_logic;
		out_sel: out std_logic_vector(1 downto 0)
	);
end entity;

architecture arch of uart_byte_ctl is
	type states is (command, load);
	
	signal state_reg, state_next: states;
	signal rw_bit : std_logic;
	signal last_byte : std_logic_vector(7 downto 0);
	signal cmd : std_logic_vector(2 downto 0);
	signal load_bit, enable_bit : std_logic;
	signal data0 : std_logic_vector(2 downto 0);
	signal data1 : std_logic_vector(4 downto 0);
	signal en_counter_reg, load_counter_reg : std_logic;
	signal load_data_reg : std_logic_vector(7 downto 0);
	signal out_sel_reg : std_logic_vector(1 downto 0);
	
begin
	cmd <= uart_byte(7 downto 5);
	
	load_bit <= uart_byte(1);
	
	enable_bit <= uart_byte(0);
	
	data0 <= last_byte(4 downto 2);
	data1 <= uart_byte(4 downto 0);
	
	process (clk, rst, state_reg, avalon_en)
	begin
		if rst = '1' then
			load_data_reg <= (others => '0');
		elsif rising_edge(clk) then
			if state_reg = load and avalon_en = '1' then
				load_data_reg <= data1 & data0;
			else
				load_data_reg <= load_data_reg;
			end if;
		end if;
	end process;

	load_data <= load_data_reg;
	
	-- state_next
	process (clk, rst, avalon_en, state_reg, cmd)
	begin
		if rst = '1' then
			state_next <= command;
		elsif rising_edge(clk) then
			if avalon_en = '1' then
				if state_reg = command then
					if cmd = "100" and load_bit = '1' then
						state_next <= load;
					else
						state_next <= command;
					end if;
				elsif state_reg = load then
					state_next <= command;
				end if;
			else
				state_next <= state_next;
			end if;
		end if;
	end process;
		
	-- state_reg e last_byte
	process(clk, rst, avalon_en)
	begin
		if rst = '1' then
			state_reg <= command;
			last_byte <= "00000000";
		elsif rising_edge(clk) then
			state_reg <= state_next;
			if avalon_en = '1' then
				last_byte <= uart_byte;
			else
				last_byte <= last_byte;
			end if;
		end if;
	end process;
	
	-- load_counter_reg
	process(clk, rst, state_reg, avalon_en)
	begin
		if rst = '1' then
			load_counter_reg <= '0';
		elsif rising_edge(clk) then
			if state_reg = load and avalon_en = '1' then
				load_counter_reg <= '1';
			elsif state_reg = command and avalon_en = '1' and load_bit = '0' and cmd = "100" then
				load_counter_reg <= '0';
			else
				load_counter_reg <= load_counter_reg;
			end if;
		end if;
	end process;
	
	load_counter <= load_counter_reg;
	
	-- en_counter_reg
	process(clk, rst, state_reg, avalon_en)
	begin
		if rst = '1' then
			en_counter_reg <= '0';
		elsif rising_edge(clk) then
			if state_reg = command and avalon_en = '1' then
				if enable_bit = '1' and cmd = "100" then
					en_counter_reg <= '1';
				else
					en_counter_reg <= '0';
				end if;
			else
				en_counter_reg <= en_counter_reg;
			end if;
		end if;
	end process;
	
	en_counter <= en_counter_reg;
	
	-- out_sel_reg
	process(clk, rst, state_reg, avalon_en)
	begin
		if rst = '1' then
			out_sel_reg <= "00";
		elsif rising_edge(clk) then
			if state_reg = command and avalon_en = '1' then
				if cmd = "000" then
					out_sel_reg <= "01";
				elsif cmd = "001" then
					out_sel_reg <= "10";
				elsif cmd = "011" then
					out_sel_reg <= "11";
				else
					out_sel_reg <= "00";
				end if;
			else
				out_sel_reg <= out_sel_reg;
			end if;
		end if;
	end process;
	
	out_sel <= out_sel_reg;					  
	
end architecture;