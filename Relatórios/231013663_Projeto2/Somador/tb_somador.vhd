entity testbench1 is 
end testbench1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;

-- arquitetura da testbench
architecture tb_somador of testbench1 is

    component ent_somador is
        port(
            A      : in std_logic;
            B      : in std_logic;
            Cin    : in std_logic;
            S      : out std_logic;
            Cout   : out std_logic
        );
    end component;

    signal A     : std_logic;
    signal B     : std_logic;
    signal Cin   : std_logic;
    signal S     : std_logic;
    signal Cout  : std_logic;

-- inst�ncia do componente ent_somador e mapeamento dos sinais
begin
    somador1: ent_somador port map (A => A, B => B, Cin => Cin, S => S, Cout => Cout);

    -- processo de est�mulo para testar o somador
    estimulo: process
    begin
        wait for 5 ns; A <= '0'; B <= '0'; Cin <= '0'; -- Teste 1: S=0, Cout=0
        wait for 5 ns; Cin <= '1';                     -- Teste 2: S=1, Cout=0
        wait for 5 ns; B <= '1';                       -- Teste 3: S=0, Cout=1
        wait for 5 ns; Cin <= '0';                     -- Teste 4: S=1, Cout=0
        wait for 5 ns; A <= '1';                       -- Teste 5: S=0, Cout=1
        wait for 5 ns; Cin <= '1';                     -- Teste 6: S=1, Cout=1
        wait for 5 ns; B <= '0';                       -- Teste 7: S=0, Cout=1
        wait for 5 ns; Cin <= '0';                     -- Teste 8: S=1, Cout=0
        wait;
    end process;
end tb_somador;

