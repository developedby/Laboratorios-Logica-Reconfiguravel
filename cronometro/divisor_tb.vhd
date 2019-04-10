Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity divisor_tb is
end entity;


Architecture x of divisor_tb is
  component divisor is
    port	(clk: in std_logic;
		 rst: in std_logic;
		 div: out std_logic
		 );
	end component;
signal clk, rst, div : std_logic;
begin
  uut : divisor
  port map 
    (
    clk => clk,
    rst => rst,
    div => div
  );
process
  begin
    clk <= '0';
    rst <= '0';
    wait for 10 ns;
   clk <= '1';
   wait for 10 ns;
end process;
end architecture;

