library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cronometro_digital is
	port
	(
		clk, hard_rst, btn1, btn2 : in std_logic;
		d10e_m2 : out unsigned(6 downto 0); -- display de 10^-2 s
		d10e_m1 : out unsigned(6 downto 0); -- display de 10^-1 s
		d10e_0 : out unsigned(6 downto 0); -- display de 10^0 s
		d10e_1 : out unsigned(6 downto 0); -- display de 10^1 s
		display_en : in std_logic
	);
end entity;

architecture arq of cronometro_digital is

	component cont16 is
		port
		(
			clk, rst, en, clr : in std_logic;
			saida : out unsigned(3 downto 0)
		);
	end component;

	component bcd_7seg is
		port
		(
			en : in std_logic;
			i : in unsigned (3 downto 0);
			dot: in std_logic;
			o : out unsigned (6 downto 0);
			dp : out std_logic; 
			clk : in std_logic
		);
	end component;
	
	component divisor is
		port
		(
			clk: in std_logic;
			rst: in std_logic;
			div: out std_logic
		 );		 
	end component;
	
	signal soft_rst : std_logic := '1';
	signal rst : std_logic;
	
	signal div : std_logic;
	
	signal cont_d10e_m2_en : std_logic;
	signal cont_d10e_m1_en : std_logic;
	signal cont_d10e_0_en : std_logic;
	signal cont_d10e_1_en : std_logic;
	
	signal saida_cont_d10e_m2 : unsigned(3 downto 0);
	signal saida_cont_d10e_m1 : unsigned(3 downto 0);
	signal saida_cont_d10e_0 : unsigned(3 downto 0);
	signal saida_cont_d10e_1 : unsigned(3 downto 0);
	
	signal cont_d10e_m2_clr : std_logic;
	signal cont_d10e_m1_clr : std_logic;
	signal cont_d10e_0_clr : std_logic;
	signal cont_d10e_1_clr : std_logic;
	
	signal btn_en : std_logic := '0';
	
	signal btn1_last_state : std_logic := '1';
	
	begin
	
	cont_d10e_m2:
		cont16 port map
		(
			clk => clk,
			rst => rst,
			en => cont_d10e_m2_en,
			clr => cont_d10e_m2_clr,
			saida => saida_cont_d10e_m2
		);
	cont_d10e_m1:
		cont16 port map
		(
			clk => clk,
			rst => rst,
			en => cont_d10e_m1_en,
			clr => cont_d10e_m1_clr,
			saida => saida_cont_d10e_m1
		);
	cont_d10e_0:
		cont16 port map
		(
			clk => clk,
			rst => rst,
			en => cont_d10e_0_en,
			clr => cont_d10e_0_clr,
			saida => saida_cont_d10e_0
		);
	cont_d10e_1:
		cont16 port map
		(
			clk => clk,
			rst => rst,
			en => cont_d10e_1_en,
			clr => cont_d10e_1_clr,
			saida => saida_cont_d10e_1
		);
		
	bcd_7seg_d10e_m2:
		bcd_7seg port map
		(
			en => display_en,
			i => saida_cont_d10e_m2,
			o => d10e_m2,
			dot => '0',
			clk => clk
		);
	bcd_7seg_d10e_m1:
		bcd_7seg port map
		(
			en => display_en,
			i => saida_cont_d10e_m1,
			o => d10e_m1,
			dot => '0',
			clk => clk
		);
	bcd_7seg_d10e_0:
		bcd_7seg port map
		(
			en => display_en,
			i => saida_cont_d10e_0,
			o => d10e_0,
			dot => '0',
			clk => clk
		);
	bcd_7seg_d10e_1:
		bcd_7seg port map
		(
			en => display_en,
			i => saida_cont_d10e_1,
			o => d10e_1,
			dot => '0',
			clk => clk
		);
	clk_divisor:
		divisor port map
		(
			clk => clk,
			rst => rst,
			div => div
		);
		
	rst <= soft_rst or hard_rst;
		
	cont_d10e_m2_en <= '1' when div = '1' and btn_en = '1' else '0';
	cont_d10e_m1_en <= '1' when cont_d10e_m2_en = '1' and saida_cont_d10e_m2 = "1001" else '0';
	cont_d10e_0_en <= '1' when cont_d10e_m1_en = '1' and saida_cont_d10e_m1 = "1001" else '0';
	cont_d10e_1_en <= '1' when cont_d10e_0_en = '1' and saida_cont_d10e_0 = "1001" else '0';
	
	cont_d10e_m2_clr <= '1' when cont_d10e_m2_en = '1' and saida_cont_d10e_m2 = "1001" else '0';
	cont_d10e_m1_clr <= '1' when cont_d10e_m1_en = '1' and saida_cont_d10e_m1 = "1001" else '0';
	cont_d10e_0_clr <= '1' when cont_d10e_0_en = '1' and saida_cont_d10e_0 = "1001" else '0';
	cont_d10e_1_clr <= '1' when cont_d10e_1_en = '1' and saida_cont_d10e_1 = "0101" else '0';
	
	process(clk)
	begin
		if clk'event and clk = '1' then
		
			if btn1_last_state = '1' and btn1 = '0' then -- logica negativa, apertar o botao
				btn_en <= not btn_en;
				btn1_last_state <= '0';
			elsif btn1_last_state = '0' and btn1 = '1' then -- logica negativa, soltar o botao
				btn1_last_state <= '1';
			end if;
			
			if btn2 = '0' and btn_en = '0' then -- logica negativa, apertar o botao
				soft_rst <= '1';
			else
				soft_rst <= '0';
			end if;
			
		end if;
	end process;
	
end architecture;