-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- entidade
entity questao2 is
	port (
	    A, B : in std_logic_vector (3 downto 0);
	    S : out std_logic_vector (4 downto 0)
);
end questao2;
-- arquitetura
architecture rtl of questao2 is 
begin 
	S <= unsigned ('0' & A) + unsigned ('0' & B);
end rtl;
