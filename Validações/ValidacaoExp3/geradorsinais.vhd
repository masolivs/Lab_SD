-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
-- entidade
entity geradorsinais is
    Port (
        clk : in STD_LOGIC;          -- clock
        sel : out STD_LOGIC_VECTOR (2 downto 0);
        d   : out STD_LOGIC_VECTOR (7 downto 0)
    );
end geradorsinais;
-- arquitetura
architecture Behavioral of geradorsinais is
    signal counter : integer := 0; -- contador interno
begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= (counter + 1) mod 8; 
            sel <= std_logic_vector(to_unsigned(counter, 3));
            d <= (others => '0'); 
            d(counter) <= '1';   
        end if;
    end process;
end Behavioral;

