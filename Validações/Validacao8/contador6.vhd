-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- entidade do contador de 6 unidades
entity contador6 is
    port (
        clock, reset, enable, rci, load : in std_logic;
        D : in std_logic_vector(2 downto 0);
        Q : out std_logic_vector(2 downto 0);
        rco : out std_logic
    );
end contador6;
-- arquitetura
architecture contador6_arch of contador6 is
    type estado is (ST0, ST1, ST2, ST3, ST4, ST5);
    signal currentstate, nextstate, loadstate : estado;
begin
    with D select
        loadstate <= ST0 when "000",
                     ST1 when "001",
                     ST2 when "010",
                     ST3 when "011",
                     ST4 when "100",
                     ST5 when "101",
                     ST0 when others;
    -- processo de sincronização
    sync_proc: process(clock)
    begin
        if rising_edge(clock) then
            currentstate <= nextstate;
        end if;
    end process sync_proc;
    -- processo combinacional
    comb_proc: process(currentstate, reset, enable, rci, load, loadstate)
    begin
        case currentstate is
            when ST0 =>
                Q <= "000";
                rco <= '1';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST1;
                else
                    nextstate <= ST0;
                end if;
            when ST1 =>
                Q <= "001";
                rco <= '1';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST2;
                else
                    nextstate <= ST1;
                end if;
            when ST2 =>
                Q <= "010";
                rco <= '1';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST3;
                else
                    nextstate <= ST2;
                end if;
            when ST3 =>
                Q <= "011";
                rco <= '1';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST4;
                else
                    nextstate <= ST3;
                end if;
            when ST4 =>
                Q <= "100";
                rco <= '1';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST5;
                else
                    nextstate <= ST4;
                end if;
            when ST5 =>
                Q <= "101";
                rco <= '0';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST0;
                else
                    nextstate <= ST5;
                end if;
            when others =>
                Q <= "000";
                rco <= '1';
                if (reset = '1') then
                    nextstate <= ST0;
                elsif (load = '1') then
                    nextstate <= loadstate;
                elsif ((enable = '0') or (rci = '0')) then
                    nextstate <= ST1;
                else
                    nextstate <= ST0;
                end if;
        end case;
    end process comb_proc;
end contador6_arch;

