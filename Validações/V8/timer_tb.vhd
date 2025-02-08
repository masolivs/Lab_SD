-- Testbench para o rel�gio timer.vhd
library ieee;
use ieee.std_logic_1164.all;

entity timer_tb is
end entity;

architecture sim of timer_tb is
    constant clockFreq      :   integer := 10;   -- Entrada de clock do projeto, para simula��o
    constant clkPer         :   time    := 1000 ms / clockFreq; -- Per�odo de clock

    signal clk, nRst        :   std_logic   := '0';

    signal s, m, h          :   integer;

begin
    -- Dispositivo em teste (Device under test):
    -- i_timer:    entity work.timer(rtl)  
    i_timer:    entity work.timer(rtl) 
        generic map(clockFreq)
        port map(clk, nRst, s, m, h);
    -- Gera��o do clock na simula��o
    clk <= not clk after clkPer / 2;
    -- Gera��o do sinal de reset logo no in�cio da simula��o:
    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);

        -- Sair do reset:
        nRst <= '1';
    end process;

end architecture;
