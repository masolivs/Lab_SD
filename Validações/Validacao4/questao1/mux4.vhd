---- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---- entidade 
entity ent_mux4 is
   port (
       D : in std_logic_vector (3 downto 0);
       S : in std_logic_vector (1 downto 0);
       Y : out std_logic
   );
end ent_mux4;

---- arquitetura
architecture arch_mux4 of ent_mux4 is
begin
    process(D,S)
    begin
        if S = "00" then 
	     Y <= D(0);
        elsif S = "01" then 
	     Y <= D(1);
        elsif S = "10" then 
	     Y <= D(2);
        elsif S = "11" then 
	     Y <= D(3);
	end if;        
    end process;
end arch_mux4;

