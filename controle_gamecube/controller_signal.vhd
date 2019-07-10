library ieee;
use ieee.std_logic_1164.all;

entity controller_signal is
    port
    (
        data_in : in std_logic; -- input data
        data_out : out std_logic; -- Output data
        to_controller : inout std_logic; -- Bidirectional Data Pin
        oe : in std_logic -- Output Enable
    ); 
end entity;

architecture arch of controller_signal is
   to_controller <= data_in when oe = '1' else 'Z';
   data_out <= to_controller when oe = '0' else 'Z';
end architecture;