library verilog;
use verilog.vl_types.all;
entity extensor_de_sinal is
    port(
        \In\            : in     vl_logic_vector(15 downto 0);
        \Out\           : out    vl_logic_vector(31 downto 0)
    );
end extensor_de_sinal;
