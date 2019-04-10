library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_7seg_tb is
end entity;

architecture arch_BCD_7seg_tb of BCD_7seg_tb is

	component BCD_7seg is
		port (
		  clk : in std_logic;
			en : in std_logic;
			i : in unsigned (3 downto 0);
			dot: in std_logic;
			o : out unsigned (6 downto 0);
			dp : out std_logic	);
	end component;

	signal en, dot, dp : std_logic;
	signal i : unsigned (3 downto 0);
	signal o : unsigned (6 downto 0);
  signal clk : std_logic;
begin

	uut: BCD_7seg port map (
	  clk => clk,
		en => en,
		i => i,
		dot => dot,
		o => o,
		dp => dp 
	);

	process
	begin
		en <= '0';
		i <= "0000";
		dot <= '0';
		wait for 100 ns;

		en <= '0';
		i <= "0001";
		dot <= '1';
		wait for 100 ns;

		en <= '0';
		i <= "1111";
		dot <= '1';
		wait for 100 ns;

		en <= '1';
		i <= "0000";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "0001";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "0010";
		dot <= '1';
		wait for 100 ns;
		
		en <= '1';
		i <= "0011";
		dot <= '1';
		wait for 100 ns;

		en <= '1';
		i <= "0100";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "0101";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "0110";
		dot <= '1';
		wait for 100 ns;

		en <= '1';
		i <= "0111";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "1000";
		dot <= '1';
		wait for 100 ns;
		
		en <= '1';
		i <= "1001";
		dot <= '1';
		wait for 100 ns;

		en <= '1';
		i <= "1010";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "1011";
		dot <= '0';
		wait for 100 ns;

		en <= '1';
		i <= "1111";
		dot <= '1';
		wait;
	end process;
end architecture;