---- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

---- entidade
entity ent_gerador is 
    port (
        A : out STD_LOGIC;
        B : out STD_LOGIC;
        Cin : out STD_LOGIC;
        clk : in STD_LOGIC
    );
end ent_gerador;

---- arquitetura
architecture arch_gerador of ent_gerador is
    signal counter : STD_LOGIC_VECTOR(2 downto 0) := "000"; -- contador como vetor de 3 bits
begin
    process (clk)
    begin
        if rising_edge(clk) then
            A <= counter(2);
            B <= counter(1);
            Cin <= counter(0);

            if counter = "111" then
                counter <= "000";
            else 
                counter <= STD_LOGIC_VECTOR(unsigned(counter) + 1); 
            end if;
        end if;
    end process;
end arch_gerador;

   

