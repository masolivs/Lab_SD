---- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity testbench2 is
end;
-- arquitetura
architecture tb_deco4x16 of testbench2 is
    component ent_deco4x16 is
        port (
            A: in STD_LOGIC_VECTOR (3 downto 0);
            Y: out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    -- sinais para teste
    signal A : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Y : STD_LOGIC_VECTOR (15 downto 0);
begin
    -- inst�ncia do decodificador 4x16
    deco4x16 : ent_deco4x16
        port map (
            A => A,
            Y => Y
        );
    -- gera��o de est�mulos
    A(0) <= not A(0) after 3 ns;
    A(1) <= not A(1) after 6 ns;
    A(2) <= not A(2) after 12 ns;
    A(3) <= not A(3) after 24 ns;
end tb_deco4x16;

