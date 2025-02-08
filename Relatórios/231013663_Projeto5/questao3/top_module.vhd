-- biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- entidade
entity top_module is end;
-- arquitetura
architecture tp_arch of top_module is
  -- componentes
  component questao1 is
    port (
        A   : in std_logic_vector(3 downto 0);
        B   : in std_logic_vector(3 downto 0);
        S   : out std_logic_vector(4 downto 0)
    );
  end component;
  component questao2 is
    port (
        A   : in std_logic_vector(3 downto 0);
        B   : in std_logic_vector(3 downto 0);
        S   : out std_logic_vector(4 downto 0)
    );
  end component;
  component tb_questao3 is 
    port (
       A   : out std_logic_vector(3 downto 0);
       B   : out std_logic_vector(3 downto 0);
       dut : in std_logic_vector(4 downto 0);
       gm  : in std_logic_vector(4 downto 0)
  );
  end component;
  -- sinais auxiliares
  signal A, B :std_logic_vector(3 downto 0);
  signal S_dut, S_gm :std_logic_vector(4 downto 0);
begin
    U0: questao1 PORT MAP(A, B, S_dut);
    U1: questao2 PORT MAP(A, B, S_gm);
    U3: tb_questao3 PORT MAP(A, B, S_dut, S_gm);
end tp_arch;

