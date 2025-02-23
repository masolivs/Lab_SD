library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;

-- entidade da testbench
entity testbenchmux is 
end testbenchmux;

-- arquitetura da testbench
architecture tb_mux4x1 of testbenchmux is

    component ent_mux4x1 is
        port(
            S   : in std_logic_vector(1 downto 0); 
            D   : in std_logic_vector(3 downto 0); 
            Y   : out std_logic 
        );
    end component;

    signal D : std_logic_vector(3 downto 0);
    signal S : std_logic_vector(1 downto 0);
    signal Y : std_logic;

begin

    mux4x1_1: ent_mux4x1 PORT MAP (D => D, S => S, Y => Y);

    estimulo: process
    begin  
        wait for 5 ns; D <= "1010"; S <= "00";  
        wait for 5 ns; S <= "01";               
        wait for 5 ns; S <= "10";               
        wait for 5 ns; S <= "11";               
        wait for 5 ns; D <= "0101"; S <= "00";  
        wait for 5 ns; S <= "01";               
        wait for 5 ns; S <= "10";               
        wait for 5 ns; S <= "11";
        wait for 5 ns; D <= "0000"; S <= "00";  
        wait for 5 ns; S <= "01";               
        wait for 5 ns; S <= "10";               
        wait for 5 ns; S <= "11";               
        wait for 5 ns; D <= "1111"; S <= "00";  
        wait for 5 ns; S <= "01";               
        wait for 5 ns; S <= "10";               
        wait for 5 ns; S <= "11";               
        
        wait;  -- finaliza o processo
    end process;

end tb_mux4x1;

