---- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---- entidade
entity tb_geradorsinais is
end tb_geradorsinais;

---- arquitetura
architecture arch_tb of tb_geradorsinais is

    ---- componente do somador
    component ent_somador
        port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            S    : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    ---- componente do gerador
    component ent_gerador
        port (
            A   : out STD_LOGIC;
            B   : out STD_LOGIC;
            Cin : out STD_LOGIC;
            clk : in  STD_LOGIC
        );
    end component;

    ---- sinais internos
    signal A, B, Cin, S, Cout : STD_LOGIC;
    signal clk                : STD_LOGIC := '0';

begin
    ---- instância do gerador de sinais
    gen_inst: ent_gerador
        port map (
            A   => A,
            B   => B,
            Cin => Cin,
            clk => clk
        );

    ---- instância do somador
    som_inst: ent_somador
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    ---- processo de clock
    clk_process: process 
    begin 
        while true loop 
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

end arch_tb;

