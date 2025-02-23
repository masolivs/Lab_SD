-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity questao3 is
	port (
		ligadesliga, sensorA, sensorB, clock : in std_logic;
		cont_dezena, cont_unidade : out std_logic_vector (3 downto 0);
		semaforoA, semaforoB : out std_logic_vector (2 downto 0)
	);
end questao3;
-- arquitetura
architecture questao3_arch of questao3 is
	component questao2 is
    		port ( 
        		reset, clock : in std_logic;
        		T5, T6, T20, T60 : out std_logic;
        		cont_dezena, cont_unidade : out std_logic_vector(3 downto 0)
    		);
	end component;
	component maqestados is
		port (
			ligadesliga, clock, sensorA, sensorB, T5, T6, T20, T60 : in std_logic;
			resetcounter : out std_logic;
			semaforoA, semaforoB : out std_logic_vector(2 downto 0)
		);
	end component;
	signal resetcounter, T5, T6, T20, T60 : std_logic := '0';
	begin
		uut0 : questao2 port map (reset => resetcounter, clock => clock, T5 => T5, T6 => T6, T20 => T20, T60 => T60, cont_dezena => cont_dezena, cont_unidade => cont_unidade);
		uut1 : maqestados port map ( clock => clock, ligadesliga => ligadesliga, sensorA => sensorA, sensorB => sensorB, T5 => T5, T6=>T6, T20=> T20, T60=> T60, resetcounter => resetcounter, 
                semaforoA => semaforoA, semaforoB => semaforoB);
end questao3_arch;

