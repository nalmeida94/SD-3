library verilog;
use verilog.vl_types.all;
entity ula_32_bits is
    generic(
        Opcode_not      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        Opcode_and      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        Opcode_and_not_A: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi0);
        Opcode_and_not_B: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi1);
        Opcode_nand     : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        Opcode_or       : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi1);
        Opcode_or_not_A : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi0);
        Opcode_or_not_B : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi1);
        Opcode_nor      : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        Opcode_xor      : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi1);
        Opcode_xnor     : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi0);
        Opcode_add      : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi1);
        Opcode_add_inc  : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi0);
        Opcode_inc_A    : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi1);
        Opcode_sub      : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi0);
        Opcode_sub_dec  : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi1);
        Opcode_dec_A    : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi0);
        Opcode_lsl      : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi1);
        Opcode_rsl      : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi1, Hi0);
        Opcode_asr      : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi1, Hi1)
    );
    port(
        Selection       : in     vl_logic_vector(4 downto 0);
        Enable          : in     vl_logic;
        Data_A          : in     vl_logic_vector(31 downto 0);
        Data_B          : in     vl_logic_vector(31 downto 0);
        Data_out        : out    vl_logic_vector(31 downto 0);
        \Signal\        : out    vl_logic;
        Overflow        : out    vl_logic;
        Carry_out       : out    vl_logic;
        Zero            : out    vl_logic;
        Ready           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Opcode_not : constant is 1;
    attribute mti_svvh_generic_type of Opcode_and : constant is 1;
    attribute mti_svvh_generic_type of Opcode_and_not_A : constant is 1;
    attribute mti_svvh_generic_type of Opcode_and_not_B : constant is 1;
    attribute mti_svvh_generic_type of Opcode_nand : constant is 1;
    attribute mti_svvh_generic_type of Opcode_or : constant is 1;
    attribute mti_svvh_generic_type of Opcode_or_not_A : constant is 1;
    attribute mti_svvh_generic_type of Opcode_or_not_B : constant is 1;
    attribute mti_svvh_generic_type of Opcode_nor : constant is 1;
    attribute mti_svvh_generic_type of Opcode_xor : constant is 1;
    attribute mti_svvh_generic_type of Opcode_xnor : constant is 1;
    attribute mti_svvh_generic_type of Opcode_add : constant is 1;
    attribute mti_svvh_generic_type of Opcode_add_inc : constant is 1;
    attribute mti_svvh_generic_type of Opcode_inc_A : constant is 1;
    attribute mti_svvh_generic_type of Opcode_sub : constant is 1;
    attribute mti_svvh_generic_type of Opcode_sub_dec : constant is 1;
    attribute mti_svvh_generic_type of Opcode_dec_A : constant is 1;
    attribute mti_svvh_generic_type of Opcode_lsl : constant is 1;
    attribute mti_svvh_generic_type of Opcode_rsl : constant is 1;
    attribute mti_svvh_generic_type of Opcode_asr : constant is 1;
end ula_32_bits;
