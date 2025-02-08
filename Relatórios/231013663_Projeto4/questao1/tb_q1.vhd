-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity tb_q1 is end;
-- arquitetura
architecture rtl of tb_q1 is
    component q1 is
        port (
            A, B, C : in STD_LOGIC;
            X, Y : out STD_LOGIC
        );
    end component;

    signal aux_a, aux_b, aux_c : STD_LOGIC := '0';
    signal aux_x, aux_y : STD_LOGIC;
begin
    uut: q1 port map (
        A => aux_a,
        B => aux_b,
        C => aux_c,
        X => aux_x,
        Y => aux_y
    );

    stimulus: process
    begin
        -- estímulos de entrada
        aux_c <= '0'; aux_b <= '0'; aux_a <= '0';
        wait for 1 ns;
        aux_c <= '1'; aux_b <= '0'; aux_a <= '0';
        wait for 2 ns;
        aux_c <= '0'; aux_b <= '1'; aux_a <= '0';
        wait for 4 ns;
        aux_c <= '1'; aux_b <= '1'; aux_a <= '0';
        wait for 8 ns;
        aux_c <= '0'; aux_b <= '0'; aux_a <= '1';
        wait for 16 ns;
        aux_c <= '1'; aux_b <= '0'; aux_a <= '1';
        wait for 32 ns;
        aux_c <= '0'; aux_b <= '1'; aux_a <= '1';
        wait for 64 ns;
        aux_c <= '1'; aux_b <= '1'; aux_a <= '1';
        wait for 128 ns;
        wait;
    end process;

end rtl;


	
