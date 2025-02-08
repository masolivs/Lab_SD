-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade 
entity questao1 is 
	Port (
	    A : in STD_LOGIC_VECTOR (3 downto 0);
	    B : in STD_LOGIC_VECTOR (3 downto 0);
	    S : out STD_LOGIC_VECTOR (4 downto 0)
);
end questao1;
-- arquitetura
architecture rtl of questao1 is
   component ent_somador 
	Port (
	    A, B, Cin : in STD_LOGIC;
	    S, Cout : out STD_LOGIC);
   end component;
signal aux : STD_LOGIC_VECTOR (2 downto 0):= "000";
	begin
		sc1: ent_somador port map (A => A(0), B => B(0), Cin => '0', S => S(0), Cout => aux(0));
		sc2: ent_somador port map (A => A(1), B => B(1), Cin => aux(0), S => S(1), Cout => aux(1));
		sc3: ent_somador port map (A => A(2), B => B(2), Cin => aux(1), S => S(2), Cout => aux(2));
		sc4: ent_somador port map (A => A(3), B => B(3), Cin => aux(2), S => S(3), Cout => S(4));
end rtl;