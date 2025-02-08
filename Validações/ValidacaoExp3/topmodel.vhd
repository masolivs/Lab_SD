-- biblioteca
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- entidade
entity mux8x1 is
    Port (
        sel : in STD_LOGIC_VECTOR (2 downto 0); 
        d   : in STD_LOGIC_VECTOR (7 downto 0); 
        y   : out STD_LOGIC                  
    );
end mux8x1;
-- arquitetura
architecture Behavioral of mux8x1 is
    -- sinais para armazenar saídas temporárias e divisões
    signal temp_lower : STD_LOGIC_VECTOR(3 downto 0) := "0000";  
    signal temp_upper : STD_LOGIC_VECTOR(3 downto 0) := "0000";  
    signal sel_lower : STD_LOGIC_VECTOR(1 downto 0);  -- seletor 2 primeiros muxS
    signal sel_upper : STD_LOGIC_VECTOR(1 downto 0);  -- seletor último mux
    signal d_lower : STD_LOGIC_VECTOR(3 downto 0);  -- mux inferior
    signal d_upper : STD_LOGIC_VECTOR(3 downto 0);  --  mux superior
    -- sinais para armazenar as combinações
    signal final_lower : STD_LOGIC_VECTOR(3 downto 0);  -- sinal de 4 bits para o mux inicial
    signal final_upper : STD_LOGIC_VECTOR(3 downto 0);  -- sinal de 4 bits para o mux final
begin
    -- divisão do seletor para os dois primeiros muxs
    sel_lower <= sel(1 downto 0);  -- seletor primeiros dois muxes
    sel_upper <= sel(2) & '0';  -- seletor último mux (adiciona 0 à esquerda)
    -- Divisão das entradas para os dois muxs
    d_lower <= d(3 downto 0);  -- d(0) até d(3)
    d_upper <= d(7 downto 4);  -- d(4) até d(7)
    -- instâncias
    mux4x1_1: entity work.mux4x1
        Port map (
            sel => sel_lower, 
            d   => d_lower,   
            y   => temp_lower(0) -- saida temporaria primeiro mux
        );
    mux4x1_2: entity work.mux4x1
        Port map (
            sel => sel_lower, 
            d   => d_upper,   
            y   => temp_upper(0)  -- Saída temporária segundo mux
        );
    final_lower <= temp_lower;  
    final_upper <= temp_upper;  

    mux4x1_3: entity work.mux4x1
        Port map (
            sel => sel_upper,  
            d   => final_lower,  
            y   => y  
        );
end Behavioral;


