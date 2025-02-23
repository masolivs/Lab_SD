library IEEE;
use IEEE.STD_LOGIC_1164.all;
---- entidade
entity testbench1 is
end;
---- arquitetura
architecture tb_mux8x1 of testbench1 is
    component ent_mux8x1 is
        port (
            D: in STD_LOGIC_vector (7 downto 0);
            S: in STD_LOGIC_vector (2 downto 0);
            Y: out STD_LOGIC
        );
    end component;
    -- sinais para teste
    signal D : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal S : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal Y : STD_LOGIC; 

begin
    ---- inst�ncia do multiplexador 8x1
    mux8x1 : ent_mux8x1
        port map (
            D => D,
            S => S,
            Y => Y
        );
    ---- gera��o de est�mulos
    D(0) <= not D(0) after 1 ns;
    D(1) <= not D(1) after 2 ns;
    D(2) <= not D(2) after 4 ns;
    D(3) <= not D(3) after 8 ns;
    D(4) <= not D(4) after 16 ns;
    D(5) <= not D(5) after 32 ns;
    D(6) <= not D(6) after 64 ns;
    D(7) <= not D(7) after 128 ns;
    S(0) <= not S(0) after 256 ns;
    S(1) <= not S(1) after 512 ns;
    S(2) <= not S(2) after 1024 ns;
end tb_mux8x1;

