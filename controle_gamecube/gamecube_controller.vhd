library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gamecube_controller is
    port
    (
        clk, rst: in std_logic;
        readdata: out std_logic_vector[63 downto 0];
        to_controller: inout std_logic;
    )
end entity;

architecture arch of gamecube_controller is
    component controller_signal
        port
        (
            data_in : in std_logic; -- input data
            data_out : out std_logic; -- Output data
            to_controller : inout std_logic; -- Bidirectional Data Pin
            oe : in std_logic -- Output Enable
        ); 
    end component;

    component counter
        port
        (
            clk, rst: in std_logic;
            clr, en: in std_logic;
            saida : out unsigned(7 downto 0)
        );
    end component;

    type states is (idle, writing, waiting, reading);
    signal crnt_state, next_state: states;

    signal controller_bit_counter_clr, controller_bit_counter_en: std_logic;
    signal controller_bit_counter_out: unsigned(7 downto 0);
    signal controller_bit: std_logic;
    signal controller_cmd: std_logic_vector(63 downto 0);
begin

    controller_signal: controller_signal
    port map
    (
        data_in =>,
        data_out =>,
        to_controller => to_controller,
        oe =>
    );

    controller_bit_counter : counter
    port map
    (
        clk => clk,
        rst => rst,
        clr => controller_bit_counter_clr,
        en => controller_bit_counter_en,
        saida => controller_bit_counter_out
    );

    process(clk, rst)
    begin
        if rst = '1' then
            crnt_state <= idle;
        elsif rising_edge(clk) then
            crnt_state <= next_state;
        end if;
    end process;

    process(clk, rst)
    begin
        if rst = '1' then
            next_state <= idle;
        elsif rising_edge(clk) then
            -- Logica dos estados
        end if;
    end process;

    controller_bit <= '1' when controller_bit_counter_out > 100 else '0';

end architecture;