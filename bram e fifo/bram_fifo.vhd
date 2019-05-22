library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bram_fifo is
	port
	(
		clk, rst 			: in std_logic;
		rd_addr_ram_rd_sw : in std_logic_vector (9 downto 0);
		pause_sw 			: in std_logic;
		disp_10_2 			: out unsigned (6 downto 0);
		disp_10_1			: out unsigned (6 downto 0);
		disp_10_0 			: out unsigned (6 downto 0)
	);
end entity;

architecture arch1 of bram_fifo is
	component my_fifo is
		PORT
		(
			aclr			: IN STD_LOGIC  := '0';
			data			: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			rdclk			: IN STD_LOGIC ;
			rdreq			: IN STD_LOGIC ;
			wrclk			: IN STD_LOGIC ;
			wrreq			: IN STD_LOGIC ;
			q				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			rdempty		: OUT STD_LOGIC ;
			rdfull		: OUT STD_LOGIC ;
			rdusedw		: OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
			wrfull		: OUT STD_LOGIC 
		);
	end component;
	component bram_wr IS
		PORT
		(
			address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clken		: IN STD_LOGIC  := '1';
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END component;
	component bram_rd IS
		PORT
		(
			address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END component;
	component divisor is
		port	
		(
			clk : in std_logic;
			rst : in std_logic;
			div : out std_logic
		 );	 
	End component;
	
	component BCD_7seg is
		port
		(
			en : in std_logic; 
			i : in unsigned (3 downto 0);
			dot: in std_logic;
			o : out unsigned (6 downto 0);
			dp : out std_logic
		);
	end component;
	
	signal clk_ram_rd_toggle, clk_ram_rd 			  : std_logic;
	signal ram_rd_addr, ram_wr_addr		 			  : std_logic_vector (9 downto 0);
	signal ram_rd_out, ram_wr_out			 			  : std_logic_vector (7 downto 0);
	signal ram_rd_wren, ram_wr_wren			  		  : std_logic;
	signal ram_wr_clken									  : std_logic;
	signal fifo_wrreq, fifo_rdreq				  		  : std_logic;
	signal fifo_data_in, fifo_data_out				  : std_logic_vector (7 downto 0);
	signal fifo_empty, fifo_full, fifo_almost_full : std_logic;
	signal fifo_used_words					 			  : std_logic_vector (9 downto 0);
	signal ram_rd_out_10_0, ram_rd_out_10_1, ram_rd_out_10_2 : unsigned (7 downto 0);
	signal ram_rd_addr_cnt 								  : std_logic_vector (9 downto 0);
begin
	-- Instancias dos componentes
	div5 : divisor
		port map
		(
			clk => clk,
			rst => rst,
			div => clk_ram_rd_toggle
		);
	ram_rd : bram_rd
		port map
		(
			address => ram_rd_addr,
			clock => clk_ram_rd,
			data => fifo_data_out,
			wren => pause_sw,
			q => ram_rd_out
		);
	ram_wr : bram_wr 
		PORT map
		(
			address => ram_wr_addr,
			clken => ram_wr_clken,
			clock	=> clk,
			data => "00000000",
			wren => ram_wr_wren,
			q => ram_wr_out
		);
	fifo : my_fifo
		port map
		(
			aclr => rst,
			data => fifo_data_in,
			rdclk => clk_ram_rd,
			rdreq => fifo_rdreq,
			wrreq => fifo_wrreq,
			wrclk => clk,
			q => fifo_data_out,
			rdempty => fifo_empty,
			rdfull => fifo_full,
			rdusedw => fifo_used_words
		);
	bcd_7seg_10_0 : BCD_7seg
		port map
		(
			en => '1',
			i => ram_rd_out_10_0 (3 downto 0),
			dot => '0',
			o => disp_10_0
		);
	bcd_7seg_10_1 : BCD_7seg
		port map
		(
			en => '1',
			i => ram_rd_out_10_1 (3 downto 0),
			dot => '0',
			o => disp_10_1
		);
	bcd_7seg_10_2 : BCD_7seg
		port map
		(
			en => '1',
			i => ram_rd_out_10_2 (3 downto 0),
			dot => '0',
			o => disp_10_2
		);
		
	-- Clock do lado de read
	process (rst, clk_ram_rd_toggle)
	begin
		if rst = '1' then
			clk_ram_rd <= '0';
		elsif clk_ram_rd_toggle'event and clk_ram_rd_toggle='1' then
			clk_ram_rd <= not clk_ram_rd;
		end if;
	end process;
	
	-- Endereço de read
	-- Quando esta pausado mostra o endereco indicado pelos switches
	-- Quando nao ta pausado, conta 1 por clk
	ram_rd_addr <= rd_addr_ram_rd_sw when pause_sw='1' else ram_rd_addr_cnt;
	process(rst, clk_ram_rd)
	begin
		if rst = '1' then
			ram_rd_addr_cnt <= "0000000000";
		elsif clk_ram_rd'event and clk_ram_rd='1' and ram_rd_wren='1' then
			if ram_rd_addr /= "1111111111" then
				ram_rd_addr_cnt <= std_logic_vector(unsigned(ram_rd_addr) + 1);
			end if;
		end if;
	end process;
	
	-- Endereco de write
	-- Incrementa 1 por clk
	process(clk,rst)
	begin
		if rst='1' then
			ram_wr_addr <= "0000000000";
		elsif clk'event and clk='1' and ram_wr_clken='1' then
			if ram_wr_addr /= "1111111111" then
				ram_wr_addr <= std_logic_vector(unsigned(ram_wr_addr) + 1);
			end if;
		end if;
	end process;
			
	-- Separa os digitos para mostrar no display
	ram_rd_out_10_0 <= unsigned(ram_rd_out) mod 10;
	ram_rd_out_10_1 <= (unsigned(ram_rd_out)/10) mod 10;
	ram_rd_out_10_2 <= (unsigned(ram_rd_out)/100) mod 10;
	
	-- Entrada de dados da fifo
	fifo_data_in <= ram_wr_out;
	
	-- Enable das rams
	ram_rd_wren <= not pause_sw and not fifo_empty;
	ram_wr_wren <= '0';
	ram_wr_clken <= not pause_sw and not fifo_almost_full and not fifo_full;
	
	fifo_almost_full <= '1' when unsigned(fifo_used_words) >= 768 else '0';
	
	-- Fifo requests
	fifo_wrreq <= ram_wr_clken;
	fifo_rdreq <= ram_rd_wren;
	
end architecture;