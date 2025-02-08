-- biblioteca 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade do topmodel
entity topmodel is end;
-- arquitetura do topmodel
architecture tb_arch of topmodel is
    -- componente questao2
    component questao2 is
        port (
            A, B : in std_logic_vector (7 downto 0);
            S : out std_logic_vector (8 downto 0)
        );
    end component;
    -- declaração de sinais
    signal A_sig, B_sig : std_logic_vector (7 downto 0) := "00000000";
    signal S_sig : std_logic_vector (8 downto 0):= "000000000";

begin
    -- componente questao2
    U_questao2: questao2
        port map (
            A => A_sig,
            B => B_sig,
            S => S_sig
        );

        A_sig(0) <= not A_sig(0) after 1 ns;
        A_sig(1) <= not A_sig(1) after 2 ns;
        A_sig(2) <= not A_sig(2) after 4 ns;
        A_sig(3) <= not A_sig(3) after 8 ns;
        A_sig(4) <= not A_sig(4) after 16 ns;
        A_sig(5) <= not A_sig(5) after 32 ns;
        A_sig(6) <= not A_sig(6) after 64 ns;
        A_sig(7) <= not A_sig(7) after 128 ns;

        B_sig(0) <= not B_sig(0) after 256 ns;
        B_sig(1) <= not B_sig(1) after 512 ns;
        B_sig(2) <= not B_sig(2) after 1024 ns;
        B_sig(3) <= not B_sig(3) after 2048 ns;
        B_sig(4) <= not B_sig(4) after 4096 ns;
        B_sig(5) <= not B_sig(5) after 8192 ns;
        B_sig(6) <= not B_sig(6) after 16384 ns;
        B_sig(7) <= not B_sig(7) after 32768 ns;

end tb_arch;


