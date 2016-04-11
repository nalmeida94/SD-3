library verilog;
use verilog.vl_types.all;
entity detector_de_flags is
    port(
        Enable          : in     vl_logic;
        Data            : in     vl_logic_vector(31 downto 0);
        Signal_A        : in     vl_logic;
        Signal_B        : in     vl_logic;
        Signal_Result   : in     vl_logic;
        Seletion_Sum_Sub: in     vl_logic;
        Overflow        : out    vl_logic;
        Zero            : out    vl_logic
    );
end detector_de_flags;
