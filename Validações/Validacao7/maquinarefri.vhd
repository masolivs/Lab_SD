-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity maquinarefri is 
	port (
		clk :in std_logic;
		moeda :in std_logic_vector(1 downto 0);
		r, c50 :out std_logic
);
end maquinarefri;	 
-- arquitetura
architecture rtl of maquinarefri is
	type state is (idle,e50c, e1, d50c);
	signal currentstate, nextstate : state;
begin
sync_proc: process(clk)
	begin
		if rising_edge(clk) then 
			currentstate <= nextstate;
		end if;
end process;
comb_proc: process (currentstate, moeda)
begin
	case currentstate is
		when idle =>
			r <= '0';
			c50 <= '0';
			if (moeda = "10") then nextstate <= e50c;
			elsif (moeda = "11") then nextstate <= idle;
			else nextstate  <= idle;
			end if;
		when e50c =>
			r <= '0';
			c50 <= '0';
			if (moeda = "10") then nextstate <= e1;
			elsif (moeda = "11") then nextstate <= d50c;
			else nextstate  <= e50c;
			end if;
		when e1 =>
			r <= '1';
			c50 <= '0';
			if (moeda = "10") then nextstate <= e50c;
			elsif (moeda = "11") then nextstate <= idle;
			else nextstate  <= idle;
			end if;
		when d50c =>
			r <= '0';
			c50 <= '1';
			if (moeda = "10") then nextstate <= e50c;
			elsif (moeda = "11") then nextstate <= idle;
			else nextstate  <= idle;
			end if;
		end case;
	end process;
end rtl;

