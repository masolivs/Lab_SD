-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade
entity maqestados is
	port (
		ligadesliga, clock, sensorA, sensorB, T5, T6, T20, T60 : in std_logic;
		resetcounter : out std_logic;
		semaforoA, semaforoB : out std_logic_vector(2 downto 0)
	);
end maqestados;	
-- arquitetura
architecture maqestados_arch of maqestados is
	type state is (GR, YR, RR1, RG, RY, RR2, YY, NN);
	signal currentstate, nextstate : state;
	begin
		sync_proc : process(clock) begin
			if rising_edge(clock) then
				currentstate <= nextstate;
			end if;
		end process;
	comb_proc : process (ligadesliga, sensorA, sensorB, T5, T6, T20, T60, currentstate, nextstate)
	begin
		case currentstate is
			when GR =>
				resetcounter <= '0';
				semaforoA <= "001";
				semaforoB <= "100";
				if (ligadesliga = '1') then 
					if (T60 = '1') then
						nextstate <= YR;
						resetcounter <= '1';
					elsif ((T20 = '1') and (sensorA = '0') and (sensorB = '1')) then 
						nextstate <= YR;
						resetcounter <= '1';
	  				end if;
				else 
					nextstate <= YY;
					resetcounter <= '1';
				end if;

			when YR =>
				resetcounter <= '0';
				semaforoA <= "010";
				semaforoB <= "100";
				if (ligadesliga = '1') then 
					if (T6 = '1') then
						nextstate <= RR1;
						resetcounter <= '1';
	  				end if;
				else 
					nextstate <= YY;
					resetcounter <= '1';
				end if;

			when RR1 =>
				resetcounter <= '0';
				semaforoA <= "100";
				semaforoB <= "100";
				if (ligadesliga = '1') then 
					if (T5 = '1') then
						nextstate <= RG;
						resetcounter <= '1';
	  				end if;
				else 
					nextstate <= YY;
					resetcounter <= '1';
				end if;

			when RG =>
				resetcounter <= '0';
				semaforoA <= "100";
				semaforoB <= "001";
				if (ligadesliga = '1') then 
					if (T60 = '1') then
						nextstate <= RY;
						resetcounter <= '1';
					elsif ((T20 = '1') and (sensorA = '1') and (sensorB = '0')) then 
						nextstate <= RY;
						resetcounter <= '1';
	  				end if;
				else 
					nextstate <= YY;
					resetcounter <= '1';
				end if;

			when RY =>
				resetcounter <= '0';
				semaforoA <= "100";
				semaforoB <= "010";
				if (ligadesliga = '1') then 
					if (T6 = '1') then
						nextstate <= RR2;
						resetcounter <= '1';
	  				end if;
				else 
					nextstate <= YY;
					resetcounter <= '1';
				end if;

			when RR2 =>
				resetcounter <= '0';
				semaforoA <= "100";
				semaforoB <= "100";
				if (ligadesliga = '1') then 
					if (T5 = '1') then
						nextstate <= GR;
						resetcounter <= '1';
	  				end if;
				else 
					nextstate <= YY;
					resetcounter <= '1';
				end if;

			when YY =>
				resetcounter <= '0';
				semaforoA <= "010";
				semaforoB <= "010";
				if (ligadesliga = '0') then 
					nextstate <= NN;
					resetcounter <= '1';
				else 
					nextstate <= GR;
					resetcounter <= '1';
				end if;

			when NN =>
				resetcounter <= '0';
				semaforoA <= "000";
				semaforoB <= "000";
				
				nextstate <= YY;
				resetcounter <= '1';

			when others =>
				resetcounter <= '0';
				semaforoA <= "010";
				semaforoB <= "010";
				if (ligadesliga = '0') then 
					nextstate <= NN;
					resetcounter <= '1';
				else 
					nextstate <= GR;
					resetcounter <= '1';
				end if;
			end case;
	end process;
end maqestados_arch;
		
			 