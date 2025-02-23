---- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---- entidade
entity q2 is port ( 
A, B, C, D, E, F, G: in STD_LOGIC;
S: out STD_LOGIC);
end q2;
---- arquitetura
architecture rtl of q2 is
--- declaração do mux8x1 (q1 exp 3)
component ent_mux8x1 is port (
D: in STD_LOGIC_VECTOR (7 downto 0);
S: in STD_LOGIC_VECTOR (2 downto 0);
Y: out STD_LOGIC );
end component;
--- declaração do decodificador (q2 exp 3)
component ent_deco4x16 is 
   port ( 
       A: in STD_LOGIC_VECTOR (3 downto 0);
       Y: out STD_LOGIC_VECTOR (15 downto 0)
   );
end component;
signal aux_d : std_logic_vector (7 downto 0) := "00000000";
signal aux_a : std_logic_vector (3 downto 0) := "0000";
signal aux_y : std_logic_vector (15 downto 0) := x"0000";
signal aux_s : std_logic_vector (2 downto 0) := "000";

begin

u0 : ent_deco4x16 port map (A => aux_a, Y => aux_y);
u1 : ent_mux8x1 port map (D => aux_d, S => aux_s, Y => S);

aux_a(3) <= A;
aux_a(2) <= B;
aux_a(1) <= C;
aux_a(0) <= D;

aux_d(7) <= '1';
aux_d(6) <= aux_y(11) or aux_y(10);
aux_d(5) <= '0';
aux_d(4) <= aux_y(15) or aux_y(9);
aux_d(3) <= '1';
aux_d(2) <= aux_y(7);
aux_d(1) <= aux_y(15) or aux_y(0);
aux_d(0) <= '0';

aux_s(2) <= E;
aux_s(1) <= F;
aux_s(0) <= G;

end rtl;



