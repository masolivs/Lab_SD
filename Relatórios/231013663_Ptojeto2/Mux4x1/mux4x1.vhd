library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entidade do multiplexador
entity ent_mux4x1 is
    port (
        S : in  std_logic_vector(1 downto 0); 
        D : in  std_logic_vector(3 downto 0); 
        Y : out std_logic                    
    );
end ent_mux4x1;

-- arquitetura do multiplexador
architecture arch_mux4x1 of ent_mux4x1 is
begin
    process(S, D)
    begin
        case S is
            when "00" =>
                Y <= D(0); -- seleciona D0
            when "01" =>
                Y <= D(1); -- seleciona D1
            when "10" =>
                Y <= D(2); -- seleciona D2
            when "11" =>
                Y <= D(3); -- seleciona D3
            when others =>
                Y <= '0'; -- estado default (não usado no multiplexador)
        end case;
    end process;
end arch_mux4x1; 
