library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- definição da entidade 
entity ent_somador is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end ent_somador;

-- definição da arquitetura
architecture arch_somador of ent_somador is
begin
    -- definindo a soma e o carry-out segundo a fórmula
    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end arch_somador;

