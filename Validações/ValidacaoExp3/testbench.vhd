-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity testbench is end;
-- arquitetura
architecture Behavioral of testbench is
    signal sel : STD_LOGIC_VECTOR (2 downto 0);
    signal d   : STD_LOGIC_VECTOR (7 downto 0);
    signal y   : STD_LOGIC;
begin
    -- instância 
    uut: entity work.mux8x1
        Port map (
            sel => sel,
            d   => d,
            y   => y
        );
    -- processo de teste
    process
    begin
        d <= "00000001"; sel <= "000"; wait for 1 ns; -- Seleciona d(0)
        d <= "00000010"; sel <= "001"; wait for 2 ns; -- Seleciona d(1)
        d <= "00000100"; sel <= "010"; wait for 4 ns; -- Seleciona d(2)
        d <= "00001000"; sel <= "011"; wait for 8 ns; -- Seleciona d(3)
        d <= "00010000"; sel <= "100"; wait for 16 ns; -- Seleciona d(4)
        d <= "00100000"; sel <= "101"; wait for 32 ns; -- Seleciona d(5)
        d <= "01000000"; sel <= "110"; wait for 64 ns; -- Seleciona d(6)
        d <= "10000000"; sel <= "111"; wait for 128 ns; -- Seleciona d(7)
        wait; 
    end process;
end Behavioral;

