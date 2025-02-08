-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade do Testbench
entity tb_registrador is end;
-- arquitetura
architecture sim of tb_registrador is
    -- Declaração do componente registrador
    component registrador
        port (
            CLK, RST, LOAD, DIR, L, R : in std_logic;
            D : in std_logic_vector(3 downto 0);
            Q : out std_logic_vector(3 downto 0)
        );
    end component;
    signal clk : std_logic := '0';
    signal rst, load, dir, l, r : std_logic := '0';
    signal d : std_logic_vector(3 downto 0) := "0000";
    signal q : std_logic_vector(3 downto 0);
    constant clk_period : time := 10 ns;
begin
    uut: registrador port map (CLK => clk, RST => rst, LOAD => load, DIR => dir, L => l, R => r, D => d, Q => q);  
-- geração do clock
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;
    -- Testes
    est_proc: process
    begin
        -- reset ativo
        report "Teste 1: Reset ativo (RST = '1')";
        rst <= '1';
        wait for clk_period;
        rst <= '0';
        -- load ativo
        load <= '1';
        d <= "1010";
        wait for clk_period;
        load <= '0';
        -- deslocar para a esquerda
        dir <= '0';
        l <= '1';
        wait for clk_period;
        -- deslocar para a direita 
        dir <= '1';
        r <= '1';
        wait for clk_period;
        -- sem alteração nos sinais
        dir <= '0';
        l <= '0';
        r <= '0';
        wait for clk_period;
        wait;
    end process;
end sim;
