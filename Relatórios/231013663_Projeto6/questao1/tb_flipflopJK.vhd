-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- entidade 
entity tb_flipflopJK is end;
-- arquitetura 
architecture tb_flipflopJK_arch of tb_flipflopJK is
    -- declaração de flipflopJK
    component flipflopJK is
        port (
            PR, CLR, CLK, J, K : in std_logic;
            Q : out std_logic
        );
    end component;
    -- sinais auxiliares 
    signal s  : std_logic_vector(1 downto 0) := "00";
    signal clk : std_logic := '0';
    signal jk : std_logic_vector(1 downto 0) := "00";
begin
    -- instância do flipflopJK
    u1: flipflopJK
        port map (
            pr => s(1), 
            clr => s(0), 
            J => jk(1), 
            K => jk(0), 
            clk => clk, 
            Q => open 
        );
    -- geração do clock
    clk <= not clk after 5 ns;
    -- processo de estímulo
    estimulo: process
    begin
        for i in 0 to 4 loop
            s <= std_logic_vector(to_unsigned(i, 2)); -- altera PR e CLR
            jk <= "00"; -- mantém o estado
            wait for 10 ns;
            jk <= "01"; -- reseta o estado
            wait for 10 ns;
            jk <= "11"; -- inverte o estado
            wait for 10 ns;
            jk <= "10"; -- define o estado
            wait for 10 ns;
        end loop;
        wait; 
    end process;
end tb_flipflopJK_arch;


