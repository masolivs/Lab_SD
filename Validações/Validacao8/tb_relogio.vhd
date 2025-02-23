-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.all;
use std.textio.all;
-- entidade
entity tb_relogio is
end;
-- arquitetura
architecture test of tb_relogio is
    component relogio
        port (
            clock, reset, enable : in std_logic;
            hours, minutes, seconds : out std_logic_vector(6 downto 0)
        );
    end component;
    signal clock, reset, enable : std_logic := '0';
    signal hours, minutes, seconds : std_logic_vector(6 downto 0);
begin
    -- inst�ncia do rel�gio
    uut: relogio port map(clock, reset, enable, hours, minutes, seconds);
    -- clock process
    process
    begin
        while now < 1 ms loop
            clock <= '0';
            wait for 10 ns;
            clock <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;
    -- est�mulos
    process
    begin
        reset <= '1';           
        wait for 50 ns;         
        reset <= '0';           
        enable <= '1';          
        wait for 5 ms;          
        enable <= '0';          
        wait for 1 ms;          
        wait;
    end process;
end test;

