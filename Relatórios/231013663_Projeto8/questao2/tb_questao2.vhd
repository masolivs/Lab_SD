-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity tb_questao2 is end;
-- architecture
architecture tb_questao2_arch of tb_questao2 is
	component questao2 is
		port ( 
			reset, clock : in std_logic;
			T5, T6, T20, T60 : out std_logic;
			cont_dezena, cont_unidade : out std_logic_vector(3 downto 0)
		);
	end component;
	signal reset : std_logic := '0';
	signal clock : std_logic := '1';
	signal cont_dezena, cont_unidade : std_logic_vector(3 downto 0);
 begin

	uut1 : questao2 port map (reset=> reset, clock=> clock, cont_dezena=> cont_dezena, cont_unidade=> cont_unidade, T5=> open, T6=> open, T20=>open);
	clock <= not(clock) after 1ns;
end tb_questao2_arch;
