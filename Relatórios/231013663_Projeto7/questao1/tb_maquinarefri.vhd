-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- entidade
entity tb_maquinarefri is
end tb_maquinarefri;
-- arquitetura
architecture testbench of tb_maquinarefri is
    -- sinais do testbench
    signal clk : std_logic := '0';
    signal moeda : std_logic_vector(1 downto 0) := "00";
    signal r : std_logic;
    signal c25 : std_logic;
    signal c50 : std_logic;
    constant clk_period : time := 10 ns;
    -- componente maquinarefri
    component maquinarefri is
        port (
            clk : in std_logic;
            moeda : in std_logic_vector(1 downto 0);
            r : out std_logic;
            c25 : out std_logic;
            c50 : out std_logic
        );
    end component;
begin
    -- instancia
    uut: maquinarefri
    port map (
        clk => clk,
        moeda => moeda,
        r => r,
        c25 => c25,
        c50 => c50
    );
    -- processo para gerar o clock
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    stim_proc: process
        type input_array is array (0 to 3) of std_logic_vector(1 downto 0);
        constant inputs : input_array := ("00", "01", "10", "11");
    begin

        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "01"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "10"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "01"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "01"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "01"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "11"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "11"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "11"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "01"; wait for clk_period;
        moeda <= "11"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;

        moeda <= "10"; wait for clk_period;
        moeda <= "11"; wait for clk_period;
        for i in inputs'range loop
            moeda <= inputs(i); wait for clk_period;
        end loop;
        wait;
    end process;

end testbench;
