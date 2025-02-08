-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity mux4x1 is
    Port (
        sel : in STD_LOGIC_VECTOR (1 downto 0); 
        d   : in STD_LOGIC_VECTOR (3 downto 0); 
        y   : out STD_LOGIC                  
    );
end mux4x1;
-- arquitetura
architecture Behavioral of mux4x1 is
begin
    process(sel, d)
    begin
        case sel is
            when "00" => y <= d(0);
            when "01" => y <= d(1);
            when "10" => y <= d(2);
            when "11" => y <= d(3);
            when others => y <= '0'; 
        end case;
    end process;
end Behavioral;

