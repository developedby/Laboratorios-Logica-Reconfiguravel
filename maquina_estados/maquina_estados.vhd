library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maquina_estados is
	port
	(
		clk, rst : in std_logic;
		btn_comeca : in std_logic;
		display_sem1 : out std_logic_vector(6 downto 0);
		display_sem2 : out std_logic_vector(6 downto 0)
	);
end entity;

architecture semaforo of maquina_estados is
	-- Estados do semaforo
	type states is (desativado, r1_g2, r1_y2, g1_r2, y1_r2);
	signal state_reg, state_next : states;
	-- Sinais de transiçao
	signal comeca, amarela1, amarela2, abre1_fecha2, abre2_fecha1 : std_logic;
	
	-- Saidas
	signal sem1_r, sem1_y, sem1_g : std_logic;
	signal sem2_r, sem2_y, sem2_g : std_logic;
	
	-- Divisor do clock para 1Hz (pulso de duracao T_clk a 1Hz)
	signal div : std_logic;
	
	-- Sinais do piscador do amarelo
	signal blinky : std_logic;
	signal blinky_trigger : std_logic;
	signal count_blinky_out : unsigned(2 downto 0);
	signal count_blinky_clr : std_logic;
	signal count_blinky_en : std_logic;
	
	-- Sinais para mudar o semaforo 2 de verde para amarelo
	signal count_amarela2_out : unsigned(5 downto 0);
	signal count_amarela2_clr : std_logic;
	signal count_amarela2_en : std_logic;
	
	-- Sinais para fechar o semaforo 2 e abrir o semaforo 1
	signal count_abre1_fecha2_out : unsigned(2 downto 0);
	signal count_abre1_fecha2_clr : std_logic;
	signal count_abre1_fecha2_en : std_logic;
	
	-- Sinais para mudar o semaforo 1 de verde para amarelo
	signal count_amarela1_out : unsigned(5 downto 0);
	signal count_amarela1_clr : std_logic;
	signal count_amarela1_en : std_logic;
	
	-- Sinais para fechar o semaforo 1 e abrir o semaforo 2
	signal count_abre2_fecha1_out : unsigned(2 downto 0);
	signal count_abre2_fecha1_clr : std_logic;
	signal count_abre2_fecha1_en : std_logic;
	
	-- Componentes
	component divisor is
		port
		(
			clk: in std_logic;
			rst: in std_logic;
			div: out std_logic
		);
	end component;
	component count8 is
		port
		(
			clk, rst, en, clr : in std_logic;
			saida : out unsigned(2 downto 0)
		);
	end component;
	component count64 is
		port
		(
			clk, rst, en, clr : in std_logic;
			saida : out unsigned(5 downto 0)
		);
	end component;
begin
	-- Liga as saidas nos displays
	-- 'not' porque os displays funcionam por logica negativa
	display_sem1 <= (0 => not sem1_r, 3 => not sem1_g, 6 => not sem1_y, others => '1');
	display_sem2 <= (0 => not sem2_r, 3 => not sem2_g, 6 => not sem2_y, others => '1');
-- display_sem1 <= (others => '1');
-- display_sem2 <= (others => '1');
--	display_sem1(0) <= not sem1_r;
--	display_sem1(6) <= not sem1_y;
--	display_sem1(3) <= not sem1_g;
--	display_sem2(0) <= not sem2_r;
--	display_sem2(6) <= not sem2_y;
--	display_sem2(3) <= not sem2_g;

	-- Atualiza o estado
	process(clk, rst)
	begin
		if rst = '1' then
			state_reg <= desativado;
		elsif clk'event and clk='1' then
			state_reg <= state_next;
		end if;
	end process;
	
	-- Seleciona o proximo estado
	process(state_reg, comeca, amarela1, amarela2, abre1_fecha2, abre2_fecha1)
	begin
		state_next <= state_reg;
		case state_reg is
			when desativado =>
				if comeca = '1' then
					state_next <= r1_g2;
				end if;
			when r1_g2 =>
				if amarela2 = '1' then
					state_next <= r1_y2;
				end if;
			when r1_y2 =>
				if abre1_fecha2 = '1' then
					state_next <= g1_r2;
				end if;
			when g1_r2 =>
				if amarela1 = '1' then
					state_next <= y1_r2;
				end if;
			when y1_r2 =>
				if abre2_fecha1 = '1' then
					state_next <= r1_g2;
				end if;
		end case;
	end process;
	
	-- Ativa as saidas conforme o estado
	process(state_reg, blinky)
	begin
		sem1_r <= '0';
		sem1_y <= '0';
		sem1_g <= '0';
		sem2_r <= '0';
		sem2_y <= '0';
		sem2_g <= '0';
		case state_reg is
			when desativado =>
				sem1_y <= blinky;
				sem2_y <= blinky;
			when r1_g2 =>
				sem1_r <= '1';
				sem2_g <= '1';
			when r1_y2 =>
				sem1_r <= '1';
				sem2_y <= '1';
			when g1_r2 =>
				sem1_g <= '1';
				sem2_r <= '1';
			when y1_r2 =>
				sem1_y <= '1';
				sem2_r <= '1';
		end case;
	end process;
		
	-- Gerador de pulsos a 1Hz
	divisor_clk: divisor
		port map
		(
			clk => clk,
			rst => rst,
			div => div
		);
	
	-- Sinal que comeca o funcionamento normal do semaforo
	comeca <= '1' when btn_comeca = '0' and rst = '0' else -- botao tem logica negativa
				'0' when rst = '1' else
				'0';
	
	-- Piscador do amarelo
	count_blinky: count8
		port map
		(
			clk => clk,
			rst => rst,
			en => count_blinky_en,
			clr => count_blinky_clr,
			saida => count_blinky_out
		);
	count_blinky_en <= '1' when div = '1' and state_reg = desativado else '0';
	blinky_trigger <= '1' when count_blinky_out = "100" and count_blinky_en = '1' else '0';
	count_blinky_clr <= blinky_trigger;
	process(clk, rst)
	begin
		if rst = '1' then
			blinky <= '0';
		elsif clk = '1' and clk'event then
			if blinky_trigger = '1' then
				blinky <= not blinky;
			end if;
		end if;
	end process;
	
	-- Sinal que torna o semaforo 2 amarelo
	count_amarela2: count64
		port map
		(
			clk => clk,
			rst => rst,
			en => count_amarela2_en,
			clr => count_amarela2_clr,
			saida => count_amarela2_out
		);
	count_amarela2_en <= '1' when div = '1' and state_reg = r1_g2 else '0';
	process(clk, rst)
	begin
		if rst = '1' then
			amarela2 <= '0';
		elsif clk'event and clk = '1' then
			if count_amarela2_out = "100111" and count_amarela2_en = '1' then
				count_amarela2_clr <= '1';
				amarela2 <= '1';
			else
				count_amarela2_clr <= '0';
				amarela2 <= '0';
			end if;
		end if;
	end process;
		
	-- Sinal que abre o semaforo 1 e fecha o semaforo 2
	count_abre1_fecha2: count8
		port map
		(
			clk => clk,
			rst => rst,
			en => count_abre1_fecha2_en,
			clr => count_abre1_fecha2_clr,
			saida => count_abre1_fecha2_out
		);
	count_abre1_fecha2_en <= '1' when div = '1' and state_reg = r1_y2 else '0';
	process(clk, rst)
	begin
		if rst = '1' then
			abre1_fecha2 <= '0';
		elsif clk'event and clk = '1' then
			if count_abre1_fecha2_out = "100" and count_abre1_fecha2_en = '1' then
				count_abre1_fecha2_clr <= '1';
				abre1_fecha2 <= '1';
			else
				count_abre1_fecha2_clr <= '0';
				abre1_fecha2 <= '0';
			end if;
		end if;
	end process;
		
	-- Sinal que torna o semaforo 1 amarelo
	count_amarela1: count64
		port map
		(
			clk => clk,
			rst => rst,
			en => count_amarela1_en,
			clr => count_amarela1_clr,
			saida => count_amarela1_out
		);
	count_amarela1_en <= '1' when div = '1' and state_reg = g1_r2 else '0';
	process(clk, rst)
	begin
		if rst = '1' then
			amarela1 <= '0';
		elsif clk'event and clk = '1' then
			if count_amarela1_out = "100111" and count_amarela1_en = '1' then
				count_amarela1_clr <= '1';
				amarela1 <= '1';
			else
				count_amarela1_clr <= '0';
				amarela1 <= '0';
			end if;
		end if;
	end process;
		
	-- Sinal que abre o semaforo 2 e fecha o semaforo 1
	count_abre2_fecha1: count8
		port map
		(
			clk => clk,
			rst => rst,
			en => count_abre2_fecha1_en,
			clr => count_abre2_fecha1_clr,
			saida => count_abre2_fecha1_out
		);
	count_abre2_fecha1_en <= '1' when div = '1' and state_reg = y1_r2 else '0';
	process(clk, rst)
	begin
		if rst = '1' then
			abre2_fecha1 <= '1';
		elsif clk'event and clk = '1' then
			if count_abre2_fecha1_out = "100" and count_abre2_fecha1_en = '1' then
				count_abre2_fecha1_clr <= '1';
				abre2_fecha1 <= '1';
			else
				count_abre2_fecha1_clr <= '0';
				abre2_fecha1 <= '0';
			end if;
		end if;
	end process;
end architecture;