-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity contador100 is
    port (
        reset, clock, enable, load: in std_logic;
        dezload, uniload : in std_logic_vector(3 downto 0);
        cont_dezena, cont_unidade : out std_logic_vector(3 downto 0)
    );
end contador100;
-- arquitetura
architecture contador100_arch of contador100 is
	component contador10 is
		port (
        		clock, reset, enable, rci, load : in std_logic;
        		D : in std_logic_vector(3 downto 0);
        		Q : out std_logic_vector(3 downto 0);
        		rco : out std_logic
    		);
	end component;

 signal s_rco: std_logic;

 begin 
	c_unidade: contador10 port map (reset => reset, clock => clock, enable=> enable, rci => '0', load => load, D => uniload, Q => cont_unidade, rco => s_rco);
	c_dezena: contador10 port map (reset => reset, clock => clock, enable=> enable, rci => s_rco, load => load, D => dezload, Q => cont_dezena, rco => open);

end contador100_arch;


