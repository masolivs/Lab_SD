-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity topmodule is
end;
-- arquitetura
architecture tp_maquinarefri of topmodule is
    -- sinais do topmodule
    signal clk     : std_logic := '0';
    signal moeda   : std_logic_vector(1 downto 0) := "00";
    signal r, c50  : std_logic;
    constant clk_period : time := 10 ns;
    -- componente maquinarefri
    component maquinarefri is
        port (
            clk   : in  std_logic;
            moeda : in  std_logic_vector(1 downto 0);
            r, c50 : out std_logic
        );
    end component;

begin
    -- instancia maquinarefri
    uut: maquinarefri
        port map (
            clk   => clk,
            moeda => moeda,
            r     => r,
            c50   => c50
        );
    -- clock
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;
    --  estímulos
    stim_proc: process
    begin
        -- Estado IDLE
        report "Teste iniciado - Estado inicial" severity note;
        moeda <= "00"; wait for clk_period;
        -- Adicionar 50 centavos
        moeda <= "10"; wait for clk_period; -- Estado e50c
        -- Cancelar a compra
        moeda <= "11"; wait for clk_period; -- Estado d50c
        -- Retornar ao estado inicial
        moeda <= "00"; wait for clk_period; -- Estado idle
        -- Inserir moedas até liberar o refrigerante
        moeda <= "10"; wait for clk_period; -- Estado e50c
        moeda <= "10"; wait for clk_period; -- Estado e1 (liberação do refrigerante)
        -- Inserir moeda extra após liberação
        moeda <= "10"; wait for clk_period; -- Estado e50c
        -- Transição inválida no estado e50c
        moeda <= "11"; wait for clk_period; -- Estado d50c
        report "Fim do teste - Todos os estados foram verificados" severity note;
        wait;
    end process;

end tp_maquinarefri;

