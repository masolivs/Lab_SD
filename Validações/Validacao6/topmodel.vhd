-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity topmodel is
end;
-- arquitetura
architecture topmodel_arch of topmodel is
    component flipflopD
        port (
            D, clk, clr : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    -- sinais auxiliares
    signal D_aux, clk_aux, clr_aux, Q_aux : STD_LOGIC := '0';
begin
    uut: flipflopD
        port map (
            D => D_aux,
            clk => clk_aux,
            clr => clr_aux,
            Q => Q_aux
        );
    -- geração do clock
    clk_process: process
    begin
        while true loop
            clk_aux <= '0';
            wait for 10 ns;
            clk_aux <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- geração de estímulos
    stim_process: process
    begin
        -- inicializar sinais
        clr_aux <= '0';
        D_aux <= '0';
        -- reset ativo
        clr_aux <= '1';
        wait for 20 ns;
        clr_aux <= '0';
        -- alternar valores de D
        D_aux <= '1';
        wait for 30 ns;
        D_aux <= '0';
        wait for 30 ns;
        -- teste adicional
        D_aux <= '1';
        wait for 40 ns;
        wait;
    end process;
end topmodel_arch;


