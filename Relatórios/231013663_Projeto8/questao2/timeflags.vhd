-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity timeflags is
	port (
		cont_dezena, cont_unidade : in std_logic_vector (3 downto 0);
		T5, T6, T20, T60 : out std_logic
	);
end timeflags;
-- arquitetura 
architecture timeflags_arch of timeflags is 
	signal contador : std_logic_vector(7 downto 0);
	begin
		contador <= cont_dezena & cont_unidade;
		T5 <= '1' when (contador = x"04") else '0';
		T6 <= '1' when (contador = x"05") else '0';		
		T20 <= '1' when (contador = x"19") else '0';
 		T60 <= '1' when (contador = x"59") else '0';
end timeflags_arch;

