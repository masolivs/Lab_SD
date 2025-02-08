-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity registrador is 
    port (
        CLK, RST, LOAD, DIR, L, R : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (3 downto 0);
        Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end registrador;
-- arquitetura
architecture rtl of registrador is
    signal reg: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                reg <= "0000";  -- resetar o registrador
            elsif LOAD = '1' then
                reg <= D;  -- carregar valor de entrada
            elsif DIR = '0' and L = '1' then
                reg <= reg(2) & reg(1) & reg(0) & L;  -- deslocar para a esquerda
            elsif DIR = '1' and R = '1' then
                reg <= R & reg(3) & reg(2) & reg(1);  -- deslocar para a direita
            else
                reg <= reg;  -- manter valor atual
            end if;
        end if;
    end process;
    Q <= reg;
end rtl;
