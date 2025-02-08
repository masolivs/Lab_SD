-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity questao2 is
    port ( 
        reset, clock : in std_logic;
        T5, T6, T20, T60 : out std_logic;
        cont_dezena, cont_unidade : out std_logic_vector(3 downto 0)
    );
end questao2;
-- arquitetura
architecture questao2_arch of questao2 is
    -- declaração dos componentes
    component contador100 is
        port (
            reset, clock, enable, load: in std_logic;
            dezload, uniload : in std_logic_vector(3 downto 0);
            cont_dezena, cont_unidade : out std_logic_vector(3 downto 0)
        );
    end component;
    component timeflags is
        port (
            cont_dezena, cont_unidade : in std_logic_vector(3 downto 0);
            T5, T6, T20, T60 : out std_logic
        );
    end component;
    -- sinais auxiliares
    signal s_dezena, s_unidade : std_logic_vector(3 downto 0);
begin
    uut0 : contador100 port map (reset => reset, clock => clock, enable => '0', load => '0', dezload => "0000", uniload => "0000", cont_dezena => s_dezena, cont_unidade => s_unidade);
    cont_dezena <= s_dezena;
    cont_unidade <= s_unidade;
    uut1 : timeflags port map (cont_dezena => s_dezena, cont_unidade => s_unidade, T5 => T5, T6 => T6, T20 => T20, T60 => T60);
end questao2_arch;

