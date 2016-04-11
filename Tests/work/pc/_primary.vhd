library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        \In\            : in     vl_logic_vector(31 downto 0);
        Signal_write    : in     vl_logic;
        Signal_reset    : in     vl_logic;
        Clock_in        : in     vl_logic;
        Data            : out    vl_logic_vector(31 downto 0)
    );
end pc;
