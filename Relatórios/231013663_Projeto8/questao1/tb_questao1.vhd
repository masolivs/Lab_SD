-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity tb_questao1 is end;
-- arquiteture 
architecture tb_questao1_arch of tb_questao1 is
	component contador100 is 
    		port (
        		reset, clock, enable, load: in std_logic;
        		dezload, uniload : in std_logic_vector(3 downto 0);
        		cont_dezena, cont_unidade : out std_logic_vector(3 downto 0)
    		);
	end component;

	signal clock : std_logic := '1';
	signal reset, enable, load: std_logic := '0';
	signal dezload, uniload: std_logic_vector(3 downto 0) := "1001";
begin
	uut: contador100 port map (reset=>reset, clock=>clock, enable=>enable, load=> load, dezload=>dezload, uniload=> uniload, cont_dezena=> open, cont_unidade=> open);
    	
	clock <= not (clock) after 1 ns;

end tb_questao1_arch;
