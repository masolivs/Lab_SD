-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity flipflopD is
	port ( D,clk, clr :in STD_LOGIC;
		Q : out STD_LOGIC);
end flipflopD;
-- arquitetura
architecture flipflopD_arch of flipflopD is
begin 
	process(clr, clk)
	begin
		if clr = '1' then Q <= '0';
		elsif rising_edge(clk) then Q <= D;
		end if;
	end process;
end flipflopD_arch;
