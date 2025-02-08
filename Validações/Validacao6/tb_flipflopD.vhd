-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade 
entity tb_flipflopD is
end;
-- arquitetura
architecture behavior of tb_flipflopD is
    -- componentes
    component flipflopD
        port (
            D, clk, clr : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;
    -- sinais de entrada e saída
    signal D, clk, clr, Q : STD_LOGIC;
begin
    -- Instância do Top Model
    uut: flipflopD
        port map (
            D => D,
            clk => clk,
            clr => clr,
            Q => Q
        );
    -- geração do clock
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;
    -- geração de estímulos
    stim_process: process
    begin
        -- inicializar sinais
        D <= '0';
        clr <= '0';
        -- reset ativo
        clr <= '1';
        wait for 20 ns;
        clr <= '0';
        -- alternar valores de D
        D <= '1';
        wait for 30 ns;
        D <= '0';
        wait for 30 ns;
        -- teste adicional
        D <= '1';
        wait for 40 ns;
        wait;
    end process;
end behavior;
