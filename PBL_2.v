module PBL_2(
	input wire Clock_in,
	input wire Reset_in
	);

wire [1:0] INSTRUC_CONST_OPES;
wire INSTRUC_MEM_OPM;
wire INSTRUC_BRANCH_OP;
wire [3:0] INSTRUC_BRANCH_COND;
wire INSTRUC_BRANCH_REGISTER_OPD;

//UNIDADE DE CONTROLE
wire CS_Reset_all;	
wire CS_PC_Signal_Write;
wire CS_MEM_INST_WE;
wire CS_B_R_RegDst;
wire CS_B_R_Signal_Read;
wire CS_B_R_Signal_Write;
wire CS_ULA_Fonte;
wire CS_Enable_Ula;
wire CS_MEM_DADO_WE;
wire CS_PC_FontePC;
wire CS_MemPara_B_Reg;


//ESTAGIO IF
wire [31:0] MEM_INS_OUT;
wire [31:0] PC_MUX_IN;
wire [31:0] PC_NEXT_INS;

//ESTAGIO ID
wire [31:0] PC_NEXT_INS_OUT;
wire [31:0] B_R_Data_to_write;
wire [3:0] B_R_Read_1, B_R_Read_2, B_R_Address_to_write;
wire [31:0] B_R_Out_1, B_R_Out_2;
wire [31:0] EXTENSOR_DE_SINAL_OUT;
wire [2:0] INSTRUC_OPCODE;
wire by_pass_A;
wire by_pass_B;

//ESTAGIO EXE
wire CS_B_R_Signal_write_EXE;
wire [31:0] PC_NEXT_INS_OUT_EXE;
wire [31:0] ULA_OUT;
wire Branch;
reg [31:0] REG_B_R_Out_1;
reg [31:0] REG_B_R_Out_2;

//ESTAGIO MEM
wire [31:0] PC_NEXT_INS_OUT_MEM;

//	ESTAGIO WB
wire CS_B_R_Signal_write_WB;
wire [31:0] B_R_Data_to_write_IN;
wire [31:0] B_R_Data_Write;
wire [31:0] MEM_DATA_OUT;


//ASSIGNS
assign CS_B_R_Signal_write_EXE = CS_B_R_Signal_Write;
assign CS_B_R_Signal_write_WB = CS_B_R_Signal_write_EXE;
assign B_R_Address_to_write = MEM_INS_OUT[23:20];


//Instância da UNIDADE DE CONTROLE
unidade_de_controle unidade_controle (	Clock_in,	Reset_in, INSTRUC_OPCODE,	CS_PC_Signal_Write,
	CS_MEM_INST_WE, CS_B_R_RegDst, CS_B_R_Signal_Read,	CS_B_R_Signal_Write,
	CS_ULA_Fonte,	CS_Enable_Ula,	CS_MEM_DADO_WE,	CS_PC_FontePC,	CS_MemPara_B_Reg,  CS_Reset_all);


//Instância do IF
STAGE_IF stage_if( Clock_in, CS_Branch, PC_MUX_IN,	CS_PC_Signal_write, CS_Reset_all,
	PC_NEXT_INS, MEM_INS_OUT, CS_MEM_INST_WE);

//Instância do ID
STAGE_ID stage_id(Clock_in,	PC_NEXT_INS,	PC_NEXT_INS_OUT,	MEM_INS_OUT,
	CS_B_R_Signal_write_WB,	CS_B_R_Signal_Read,	CS_Reset_all,	B_R_Data_to_write_IN,
	B_R_Out_1, 	B_R_Out_2,	EXTENSOR_DE_SINAL_OUT,
	INSTRUC_OPCODE,	INSTRUC_R_OPULA,	INSTRUC_BRANCH_COND,	INSTRUC_BRANCH_OP	);
	


//Instância da unidade BY_PASS
forwarding_unity forwarding(Clock_in, CS_Reset_all, B_R_Out_1, B_R_Out_2, B_R_Address_to_write,
	by_pass_A, by_pass_B	);
	
//Instância da unidade de detecção de hazards
hazard_detection hazard(Clock_in,CS_Reset_all, INSTRUC_OPCODE, B_R_Address_to_write,
	B_R_Out_2,stall	);

/*
ID_EXE id_exe(Clock_in,CS_Reset_all,input stall,
//CS
input ID_UC_PC_Signal_Write,
input ID_UC_MEM_INST_WE,
input ID_UC_B_R_RegDst,
input ID_UC_B_R_Signal_Read,
input ID_UC_B_R_Signal_Write,
input ID_UC_ULA_Fonte,
input ID_UC_Enable_Ula,
input ID_UC_MEM_DADO_WE,
input ID_UC_PC_FontePC,
input ID_UC_MemPara_B_Reg,
//ID
input [2:0] ID_INSTRUC_OPCODE,
input [4:0] ID_INSTRUC_R_OPULA,
input ID_INSTRUC_BRANCH_OP,
input [3:0] ID_INSTRUC_BRANCH_COND,
input [31:0] ID_PC_NEXT_INS_OUT,
input [31:0] ID_EXTENSOR_DE_SINAL_OUT,
input [31:0] ID_B_R_Out_1,
input [31:0] ID_B_R_Out_2,
//EXE
input ID_ULA_MUX_Fonte,
input ID_ULA_Enable,
input [31:0] ID_PC_NEXT_INS_IN,
//---------------------------------------------------//
output reg EXE_UC_PC_Signal_Write,
output reg EXE_UC_MEM_INST_WE,
output reg EXE_UC_B_R_RegDst,
output reg EXE_UC_B_R_Signal_Read,
output reg EXE_UC_B_R_Signal_Write,
output reg EXE_UC_ULA_Fonte,
output reg EXE_UC_Enable_Ula,
output reg EXE_UC_MEM_DADO_WE,
output reg EXE_UC_PC_FontePC,
output reg EXE_UC_MemPara_B_Reg,
//ID
output reg [2:0] EXE_INSTRUC_OPCODE,
output reg [4:0] EXE_INSTRUC_R_OPULA,
output reg EXE_INSTRUC_BRANCH_OP,
output reg [3:0] EXE_INSTRUC_BRANCH_COND,
output reg [31:0] EXE_PC_NEXT_INS_OUT,
output reg [31:0] EXE_EXTENSOR_DE_SINAL_OUT,
output reg [31:0] EXE_B_R_Out_1,
output reg [31:0] EXE_B_R_Out_2,
//EXE
output reg EXE_ULA_MUX_Fonte,
output reg EXE_ULA_Enable,
output reg [31:0] EXE_PC_NEXT_INS_IN
	);	
*/

//Instancia do EXE
STAGE_EXE stage_exe(	Clock_in,	PC_NEXT_INS_OUT,	PC_NEXT_INS_OUT_EXE,	REG_B_R_Out_1, 
	REG_B_R_Out_2,	B_R_Data_Write,	EXTENSOR_DE_SINAL_OUT, CS_Enable_Ula,		ULA_OUT,
	CS_ULA_Fonte,	INSTRUC_R_OPULA,	INSTRUC_OPCODE,	INSTRUC_BRANCH_COND,
	CS_PC_FontePC,	INSTRUC_BRANCH_OP,	Branch);

//Instancia do MEM
STAGE_MEM stage_mem( Clock_in, REG_B_R_Out_1, REG_B_R_Out_2, PC_NEXT_INS_OUT_EXE,
	PC_NEXT_INS_OUT_MEM, CS_MEM_DADO_WE, MEM_DATA_OUT	);

//Instancia do WB
STAGE_WB stage_wb(Clock_in, MEM_DATA_OUT, ULA_OUT, B_R_Data_to_write_IN,
	CS_MemPara_B_Reg	);


always @( posedge Clock_in ) begin
	if(by_pass_A) begin
		REG_B_R_Out_1 <= B_R_Data_to_write_IN;
	end
	else begin
		REG_B_R_Out_1 <= B_R_Out_1;
	end
	if(by_pass_B) begin
		REG_B_R_Out_2 <= B_R_Data_to_write_IN;
	end
	else begin
		REG_B_R_Out_2 <= B_R_Out_2;
	end
end
endmodule