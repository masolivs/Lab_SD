 -- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity q1 is port (
	A, B, C : in STD_LOGIC;
	X, Y : out STD_LOGIC);
end q1;
-- arquitetura
architecture rtl of q1 is 
	component ent_mux4 is
   		port (
       			D : in std_logic_vector (3 downto 0);
       		    	S : in std_logic_vector (1 downto 0);
       			Y : out std_logic
   		);
	end component;
	signal aux_dx, aux_dy : std_logic_vector (3 downto 0);
	signal aux_s : std_logic_vector (1 downto 0);
	begin 
	cx : ent_mux4 port map (aux_dx, aux_s, X);
		aux_dx(3) <= '1';
		aux_dx(2) <= not C;
		aux_dx(1) <= C;
		aux_dx(0) <= '0';

		aux_s(1) <= A;
		aux_s(0) <= B;

	cy : ent_mux4 port map (aux_dy, aux_s, Y );
		aux_dy(3) <= C;
		aux_dy(2) <= '0';
		aux_dy(1) <= not C;
		aux_dy(0) <= '1';
end rtl;


