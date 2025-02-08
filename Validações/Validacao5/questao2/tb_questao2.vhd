-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade 
entity tb_questao2 is end;
-- arquitetura
architecture ul of tb_questao2 is 
    component questao2
        Port (
            A, B : in STD_LOGIC_VECTOR (7 downto 0);
            S : out STD_LOGIC_VECTOR (8 downto 0)
        );
    end component;

    signal as, bs : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal s_out : STD_LOGIC_VECTOR(8 downto 0):= "000000000"; 

begin 

    q2 : questao2 port map (A => as, B => bs, S => s_out);

    as(0) <= not as(0) after 1 ns;
    as(1) <= not as(1) after 2 ns;
    as(2) <= not as(2) after 4 ns;
    as(3) <= not as(3) after 8 ns;
    as(4) <= not as(4) after 16 ns;
    as(5) <= not as(5) after 32 ns;
    as(6) <= not as(6) after 64 ns;
    as(7) <= not as(7) after 128 ns;

    bs(0) <= not bs(0) after 256 ns;
    bs(1) <= not bs(1) after 512 ns;
    bs(2) <= not bs(2) after 1024 ns;
    bs(3) <= not bs(3) after 2048 ns;
    bs(4) <= not bs(4) after 4096 ns;
    bs(5) <= not bs(5) after 8192 ns;
    bs(6) <= not bs(6) after 16384 ns;
    bs(7) <= not bs(7) after 32768 ns;

end ul;
