-- biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
-- entidade
entity tb_questao3 is
  port (
    A   : out std_logic_vector(3 downto 0);
    B   : out std_logic_vector(3 downto 0);
    dut : in std_logic_vector(4 downto 0);
    gm  : in std_logic_vector(4 downto 0)
  );
end tb_questao3;
-- arquitetura
architecture testbench_arch of tb_questao3 is
  -- sinais para monitorar entradas e saídas
  signal A_reg, B_reg : std_logic_vector(3 downto 0);
  signal S_dut_reg, S_gm_reg : std_logic_vector(4 downto 0);
  -- função auxiliar para conversão de std_logic_vector para string
  function to_string(signal_value: std_logic_vector) return string is
    variable result: string(1 to signal_value'length);
  begin
    for i in signal_value'range loop
      result(i + 1) := character'value(std_ulogic'image(signal_value(i)));
    end loop;
    return result;
  end function;
begin
  -- mapeamento dos sinais
  A <= A_reg;
  B <= B_reg;
  S_dut_reg <= dut;
  S_gm_reg <= gm;
  -- processo de teste
  process
  begin
    report "Iniciando teste..." severity NOTE;
    for i in 0 to 15 loop
      A_reg <= std_logic_vector(to_unsigned(i, 4));
      for j in 0 to 15 loop
        B_reg <= std_logic_vector(to_unsigned(j, 4));
        wait for 500 ns;
        -- comparação dos resultados
        assert (S_dut_reg = S_gm_reg)
          report "Erro: A=" & integer'image(to_integer(unsigned(A_reg))) &
                 " B=" & integer'image(to_integer(unsigned(B_reg))) &
                 " DUT=" & to_string(S_dut_reg) & " GM=" & to_string(S_gm_reg)
          severity ERROR;
      end loop;
    end loop;
    report "Teste finalizado!" severity NOTE;
    wait;
  end process;
end testbench_arch;





