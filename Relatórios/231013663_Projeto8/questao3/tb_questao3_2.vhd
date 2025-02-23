-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;
-- entidade 
entity tb_questao3_2 is end;
-- arquitetura
architecture tb_questao3_2_arch of tb_questao3_2 is
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
	clock <= not (clock) after 1 ns;
	
	process 
		begin
			ligadesliga <= '1';
			wait for 4 ns;
			sensorA <= '0'; sensorB <= '1';
			wait for 40 ns;
			sensorA <= '0'; sensorB <= '0';
			wait for 22 ns;
			sensorA <= '1'; sensorB <= '0';
			wait for 40 ns;
			wait;
		end process;
end tb_questao3_2_arch;
