---- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
---- entidade
entity tb_q2 is 
end tb_q2;
-- arquitetura
architecture rtl of tb_q2 is 
    -- Declaração do componente
    component q2 is 
        port ( 
            A, B, C, D, E, F, G: in STD_LOGIC;
            S: out STD_LOGIC
        );
    end component;
    -- sinais de estímulo
    signal aux: STD_LOGIC_VECTOR(6 downto 0) := "0000000"; 
    signal S: STD_LOGIC; 
begin
    -- instância da UUT 
    cs: q2 
        port map (
            A => aux(6),
            B => aux(5),
            C => aux(4),
            D => aux(3),
            E => aux(2),
            F => aux(1),
            G => aux(0),
            S => S
        );
    -- geração de estímulos 
    estimulo: process
    begin 
        for i in 0 to 127 loop
            wait for 5 ns;
            aux <= std_logic_vector(to_unsigned(i, 7));
        end loop;
        wait;
    end process;
end rtl;

		