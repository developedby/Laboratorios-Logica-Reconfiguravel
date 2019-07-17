library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gamecube_controller is
    port
    (
        clk, rst: in std_logic;
        readdata: out std_logic_vector(63 downto 0);
        ctrl_pin: inout std_logic
    );
end entity;

architecture arch of gamecube_controller is
    component controller_signal
        port
        (
            data_in : in std_logic; -- input data
            data_out : out std_logic; -- Output data
            ctrl_pin : inout std_logic; -- Bidirectional Data Pin
            oe : in std_logic -- Output Enable
        ); 
    end component;

    component counter
	     generic (data_width: integer);
        port
        (
            clk, rst: in std_logic;
            clr, en: in std_logic;
            saida : out unsigned((data_width - 1) downto 0)
        );
    end component;
	 
    component divisor
	 generic (period_ticks : integer);
	 port
	 (
        clk: in std_logic;
        rst: in std_logic;
		  clr: in std_logic;
        div: out std_logic
	 );		 
    end component;

    type states is (idle, writing, waiting, reading);
    signal crnt_state, next_state: states;

	 signal ctrl_oe: std_logic;
	 signal ctrl_data_in, ctrl_data_out: std_logic;
	 
	 signal timer_reading_timeout: std_logic;
	 
	 signal timer_ctrl_wr_bit_quarter_clr, timer_ctrl_wr_bit_quarter_en, timer_ctrl_wr_bit_quarter_timeout: std_logic;
	 signal ctrl_wr_bit_quarter_counter_clr, ctrl_wr_bit_quarter_counter_en: std_logic;
	 signal ctrl_wr_bit_quarter_counter_out: unsigned(6 downto 0);
	 
	 signal c0, c1 : std_logic_vector(0 to 4);
	 signal stop_bit : std_logic_vector(0 to 2);
	 signal ctrl_wr_cmd : std_logic_vector (0 to (5*24)+3-1);
	 signal ctrl_wr_out : std_logic;
	 
	 signal ctrl_rd_sample0_counter_clr, ctrl_rd_sample0_counter_en: std_logic;
    signal ctrl_rd_sample0_counter_out: unsigned(9 downto 0);
	 signal ctrl_rd_sample1_counter_clr, ctrl_rd_sample1_counter_en: std_logic;
    signal ctrl_rd_sample1_counter_out: unsigned(9 downto 0);
    signal ctrl_rd_bit_counter_clr, ctrl_rd_bit_counter_en: std_logic;
    signal ctrl_rd_bit_counter_out: unsigned(6 downto 0);
	 signal ctrl_rd_bit: std_logic;
	 
	 signal ctrl_rd_cmd, ctrl_rd_last_cmd: std_logic_vector(63 downto 0);
	 signal ctrl_last_sample: std_logic;
	 
	 
begin

    ctrl_signal: controller_signal
    port map
    (
        data_in => ctrl_data_in,
        data_out => ctrl_data_out,
        ctrl_pin => ctrl_pin,
        oe => ctrl_oe
    );

	 timer_reading : divisor
	 generic map (period_ticks => 400000) -- 120Hz, de preferencia maior do que a velocidade de leitura do processador
	 port map
	 (
        clk => clk,
		  rst => rst,
        clr => '0',
        div => timer_reading_timeout
	 );
	 
	 timer_ctrl_wr_bit_quarter : divisor
	 generic map (period_ticks => 50) -- 1MHz
	 port map
	 (
        clk => clk,
		  rst => rst,
        clr => timer_ctrl_wr_bit_quarter_clr,
        div => timer_ctrl_wr_bit_quarter_timeout
	 );
	 
	 ctrl_wr_bit_quarter_counter : counter
	 generic map (data_width => 7)
    port map
    (
        clk => clk,
        rst => rst,
        clr => ctrl_wr_bit_quarter_counter_clr,
        en => ctrl_wr_bit_quarter_counter_en,
        saida => ctrl_wr_bit_quarter_counter_out
    );
	 	 
    ctrl_rd_sample0_counter : counter
	 generic map (data_width => 10)
    port map
    (
        clk => clk,
        rst => rst,
        clr => ctrl_rd_sample0_counter_clr,
        en => ctrl_rd_sample0_counter_en,
        saida => ctrl_rd_sample0_counter_out
    );
	 
	 ctrl_rd_sample1_counter : counter
	 generic map (data_width => 10)
    port map
    (
        clk => clk,
        rst => rst,
        clr => ctrl_rd_sample1_counter_clr,
        en => ctrl_rd_sample1_counter_en,
        saida => ctrl_rd_sample1_counter_out
    );
	 
	 ctrl_rd_bit_counter : counter
	 generic map (data_width => 7)
    port map
    (
        clk => clk,
        rst => rst,
        clr => ctrl_rd_bit_counter_clr,
        en => ctrl_rd_bit_counter_en,
        saida => ctrl_rd_bit_counter_out
    );
	 
	 -- crnt_state
    process(clk, rst)
    begin
        if rst = '1' then
            crnt_state <= idle;
        elsif rising_edge(clk) then
            crnt_state <= next_state;
        end if;
    end process;

	 -- next_state
    process(clk, rst)
    begin
        if rst = '1' then
            next_state <= idle;
        elsif rising_edge(clk) then
            if timer_reading_timeout = '1' then
					next_state <= writing;
				elsif crnt_state = writing and ctrl_wr_bit_quarter_counter_out = (5*24) + 3 - 1 then
					next_state <= waiting;
				elsif crnt_state = waiting and ctrl_last_sample = '1' and ctrl_data_out = '0' then
					next_state <= reading;
				elsif crnt_state = reading and ctrl_rd_bit_counter_out = 63 then
					next_state <= idle;
				else
					next_state <= next_state;
				end if;
        end if;
    end process;
	 
	 ctrl_data_in <= ctrl_wr_out;
	 ctrl_oe <= '1' when crnt_state = writing else '0';
	 
	 c0 <= "00001";
	 c1 <= "01111";
	 stop_bit <= "011";
	 ctrl_wr_cmd <=  c0&c1&c0&c0 & c0&c0&c0&c0 & c0&c0&c0&c0 & c0&c0&c1&c1 & c0&c0&c0&c0 & c0&c0&c0&c0 & stop_bit;
	 ctrl_wr_out <= ctrl_wr_cmd(to_integer(ctrl_wr_bit_quarter_counter_out));
	 
	 -- ctrl_wr_bit_quarter_counter_clr, timer_ctrl_wr_bit_quarter_clr, ctrl_wr_bit_counter_clr
	 process(clk, rst)
	 begin
		if rst = '1' then
			timer_ctrl_wr_bit_quarter_clr <= '0';
			ctrl_wr_bit_quarter_counter_clr <= '0';
			ctrl_wr_bit_quarter_counter_clr <= '0';
		elsif rising_edge(clk) then
			if crnt_state /= writing and next_state = writing then
				timer_ctrl_wr_bit_quarter_clr <= '1';
				ctrl_wr_bit_quarter_counter_clr <= '1';

			else
				timer_ctrl_wr_bit_quarter_clr <= '0';
				ctrl_wr_bit_quarter_counter_clr <= '0';
			end if;
		end if;
	end process;

	ctrl_wr_bit_quarter_counter_en <= timer_ctrl_wr_bit_quarter_timeout when crnt_state = writing else '0';
	
	    
	-- ctrl_last_sample
	process (clk, rst)
	begin
		if rst = '1' then
			ctrl_last_sample <= '0';
		elsif rising_edge(clk) then
		   ctrl_last_sample <= ctrl_data_out;
		end if;
	end process;
	
	ctrl_rd_sample0_counter_en <= not ctrl_data_out when crnt_state = reading else '0';
	ctrl_rd_sample1_counter_en <= ctrl_data_out when crnt_state = reading else '0';
	
	-- ctrl_rd_bit, ctrl_rd_bit_counter_en, ctrl_rd_sample0_counter_clr, ctrl_rd_sample1_counter_clr, ctrl_rd_cmd
	process(clk, rst)
	begin
		if rst = '1' then
			ctrl_rd_bit <= '0';
			ctrl_rd_bit_counter_en <= '0';
			ctrl_rd_sample0_counter_clr <= '0';
			ctrl_rd_sample1_counter_clr <= '0';
			ctrl_rd_cmd <= (others => '0');
		elsif rising_edge(clk) then
			if crnt_state = reading and ctrl_data_out = '0' and ctrl_last_sample = '1' then
				ctrl_rd_bit_counter_en <= '1';
				ctrl_rd_sample0_counter_clr <= '1';
				ctrl_rd_sample1_counter_clr <= '1';
				
				if ctrl_rd_sample1_counter_out > ctrl_rd_sample0_counter_out then
					ctrl_rd_bit <= '1';
				else
					ctrl_rd_bit <= '0';
				end if;
				ctrl_rd_cmd(to_integer(ctrl_rd_bit_counter_out)) <= ctrl_rd_bit;
			elsif crnt_state /= reading and next_state = reading then
				ctrl_rd_sample0_counter_clr <= '1';
			else
				ctrl_rd_bit <= ctrl_rd_bit;
				ctrl_rd_bit_counter_en <= '0';
				ctrl_rd_sample0_counter_clr <= '0';
				ctrl_rd_sample1_counter_clr <= '0';
				ctrl_rd_cmd(to_integer(ctrl_rd_bit_counter_out)) <= ctrl_rd_cmd(to_integer(ctrl_rd_bit_counter_out));
			end if;
			
			ctrl_rd_cmd(63 downto to_integer(ctrl_rd_bit_counter_out) + 1) <= ctrl_rd_cmd(63 downto to_integer(ctrl_rd_bit_counter_out) + 1);
			ctrl_rd_cmd(to_integer(ctrl_rd_bit_counter_out) - 1 downto 0) <= ctrl_rd_cmd(to_integer(ctrl_rd_bit_counter_out) - 1 downto 0);
		end if;
	end process;
	
	-- ctrl_rd_bit_counter_clr
	process(clk, rst)
	begin
		if rst = '1' then
			ctrl_rd_bit_counter_clr <= '0';
		elsif rising_edge(clk) then
			if crnt_state /= reading and next_state = reading then
				ctrl_rd_bit_counter_clr <= '1';
			else
				ctrl_rd_bit_counter_clr <= '0';
			end if;
		end if;
	end process;
	
	-- ctrl_rd_last_cmd
	process(clk, rst)
	begin
		if rst = '1' then
			ctrl_rd_last_cmd <= (others => '0');
		elsif rising_edge(clk) then
			if crnt_state /= idle and next_state = idle then
				ctrl_rd_last_cmd <= ctrl_rd_cmd;
			else
				ctrl_rd_last_cmd <= ctrl_rd_last_cmd;
			end if;
		end if;
	end process;
	
	readdata <= ctrl_rd_last_cmd;
end architecture;
