-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity relogio is
    port (
        clock, reset, enable : in std_logic;
        hours, minutes, seconds : out std_logic_vector(6 downto 0)
    );
end relogio;
-- arquitetura
architecture relogio_arch of relogio is
    signal sec_units, min_units, hour_units : std_logic_vector(3 downto 0);
    signal sec_tens, min_tens, hour_tens : std_logic_vector(2 downto 0);
    signal rco_sec_units, rco_sec_tens, rco_min_units, rco_min_tens, rco_hour_units : std_logic; 
    -- componentes dos contadores
    component contador10
        port (
            clock, reset, enable, rci, load : in std_logic;
            D : in std_logic_vector(3 downto 0);
            Q : out std_logic_vector(3 downto 0);
            rco : out std_logic
        );
    end component; 
    component contador6
        port (
            clock, reset, enable, rci, load : in std_logic;
            D : in std_logic_vector(2 downto 0);
            Q : out std_logic_vector(2 downto 0);
            rco : out std_logic
        );
    end component;
begin
    -- contador de segundos (00-59)
    segundos_unidades: contador10 
        port map(clock, reset, enable, '0', '0', "0000", sec_units, rco_sec_units);
    segundos_dezenas: contador6
        port map(clock, reset, rco_sec_units, '0', '0', "000", sec_tens, rco_sec_tens);
    -- contador de minutos (00-59)
    minutos_unidades: contador10 
        port map(clock, reset, rco_sec_tens, '0', '0', "0000", min_units, rco_min_units);
    minutos_dezenas: contador6 
        port map(clock, reset, rco_min_units, '0', '0', "000", min_tens, rco_min_tens);
    -- contador de horas (00-23)
    horas_unidades: contador10 
        port map(clock, reset, rco_min_tens, '0', '0', "0000", hour_units, rco_hour_units);
    horas_dezenas: contador6 
        port map(clock, reset, rco_hour_units, '0', '0', "000", hour_tens, open);   
    -- Concatenando as sa�das
    seconds <= sec_tens & sec_units;  
    minutes <= min_tens & min_units;  
    hours   <= "00" & hour_tens & hour_units(3 downto 2); 
end relogio_arch;

