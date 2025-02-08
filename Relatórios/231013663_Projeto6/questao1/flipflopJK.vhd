-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity flipflopJK is
    port (
        PR, CLR, CLK, J, K : in std_logic; 
        Q : out std_logic 
    );
end flipflopJK;
-- arquitetura
architecture arch_flipflopJK of flipflopJK is
    signal Q_int : std_logic := '0'; 
    signal JK_comb : std_logic_vector(1 downto 0); 
begin
    -- combina J e K em um vetor de dois bits
    JK_comb <= J & K;
    process(PR, CLR, CLK)
    begin
        if PR = '1' then
            Q_int <= '1'; -- set
        elsif CLR = '1' then
            Q_int <= '0'; -- reset
        elsif rising_edge(CLK) then
            -- comportamento com PR = 0 e CLR = 0
            case JK_comb is
                when "00" =>
                    Q_int <= Q_int; -- mantem o estado atual
                when "01" =>
                    Q_int <= '0'; -- Q = 0
                when "10" =>
                    Q_int <= '1'; -- Q = 1
                when "11" =>
                    Q_int <= not Q_int; -- inverte o estado atual
                when others =>
                    Q_int <= Q_int; -- mantem o estado atual
            end case;
        end if;
    end process;
    Q <= Q_int; 
end arch_flipflopJK;


