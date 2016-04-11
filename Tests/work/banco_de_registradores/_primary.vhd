library verilog;
use verilog.vl_types.all;
entity banco_de_registradores is
    port(
        Read_1          : in     vl_logic_vector(3 downto 0);
        Read_2          : in     vl_logic_vector(3 downto 0);
        Data_to_write   : in     vl_logic_vector(31 downto 0);
        Address_to_write: in     vl_logic_vector(3 downto 0);
        Signal_write    : in     vl_logic;
        Signal_read     : in     vl_logic;
        Signal_reset    : in     vl_logic;
        Clock_in        : in     vl_logic;
        Out_1           : out    vl_logic_vector(31 downto 0);
        Out_2           : out    vl_logic_vector(31 downto 0)
    );
end banco_de_registradores;
