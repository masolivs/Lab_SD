-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;
-- entidade 
entity tb_questao3 is end;
-- arquitetura
architecture tb_questao3_arch of tb_questao3 is
	component questao3 is
			port (
				ligadesliga, sensorA, sensorB, clock : in std_logic;
				cont_dezena, cont_unidade : out std_logic_vector (3 downto 0);
				semaforoA, semaforoB : out std_logic_vector (2 downto 0)
			);
	end component;

	signal clock : std_logic := '1';
	signal ligadesliga, sensorA, sensorB : std_logic := '0';

	begin
		uut0: questao3 port map (clock=> clock, ligadesliga=>ligadesliga, sensorA=>sensorA, sensorB=>sensorB, cont_dezena => open, cont_unidade => open, semaforoA => open, semaforoB=> open);
	ligadesliga <= '1' after 20 ns;
	clock <= not (clock) after 1 ns;
end tb_questao3_arch;
