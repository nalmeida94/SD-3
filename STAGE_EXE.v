module STAGE_EXE(
	//CLOCK
	Clock_in,
	//PC
	PC_NEXT_INS_IN,
	PC_NEXT_INS_OUT,
	//BANCO DE REGISTRADORES
	B_R_Out_1, 
	B_R_Out_2,
	B_R_Data_Write,
	//EXTENSOR DE SINAL
	EXTENSOR_DE_SINAL_OUT,
	//ULA
		ULA_Enable,
		ULA_OUT,
		//MUX PARA SELECAO DO 2 OPERANDO DA ULA (B_R OU EXT.SINAL)
		ULA_MUX_Fonte,
		//ENTRADA PARA SELECAO DA ULA
		INSTRUC_R_OPULA,
	//TESTADOR DE SALTOS
	INSTRUC_OPCODE,
	INSTRUC_BRANCH_COND,
	Enable_FontePC,
	INSTRUC_BRANCH_OP,
	//ENTRADA DO MUX DE SALTO DO PC
	Branch
	);

input wire Clock_in;	

//INSTRUÇÃO
input wire [2:0] INSTRUC_OPCODE;
input wire [4:0] INSTRUC_R_OPULA;
input wire [3:0] INSTRUC_BRANCH_COND;
input wire INSTRUC_BRANCH_OP;
//ULA
input wire ULA_MUX_Fonte;
wire [31:0] ULA_IN_A;
reg [31:0] ULA_IN_B;
output wire [31:0] ULA_OUT;
input wire ULA_Enable;
wire [4:0] ULA_Selection;
wire ULA_FLAG_Zero, ULA_FLAG_Carry_out, ULA_FLAG_Signal, ULA_FLAG_Overflow, ULA_OUT_Ready;
//UNIDADE DE CONTROLE ULA
wire [4:0] UNIDADE_CONTR_ULA_OPULA;
wire [4:0] UNIDADE_CONTR_ULA_Selection;
//PC
input wire [31:0] PC_NEXT_INS_IN;
output reg [31:0] PC_NEXT_INS_OUT;
//EXTENSOR DE SINAL
input wire [31:0] EXTENSOR_DE_SINAL_OUT;
//BANCO DE REGISTRADORES
input wire [31:0] B_R_Out_1, B_R_Out_2;
output wire [31:0] B_R_Data_Write;
//TESTADOR DE SALTOS
input wire Enable_FontePC;
wire [2:0] Opcode_Jump, Op;
wire [3:0] Cond_to_jump;
wire Signal_Result, Carry_out, Overflow, Zero;
output wire Branch;

assign ULA_IN_A = B_R_Out_1;
assign B_R_Data_Write = B_R_Out_2;
assign UNIDADE_CONTR_ULA_OPULA = INSTRUC_R_OPULA;
assign ULA_Selection = UNIDADE_CONTR_ULA_Selection;
assign Cond_to_jump = INSTRUC_BRANCH_COND;
assign Opcode_Jump = INSTRUC_OPCODE;
assign Op = INSTRUC_BRANCH_OP;
assign Signal_Result = ULA_FLAG_Signal;
assign Overflow = ULA_FLAG_Overflow;
assign Carry_out = ULA_FLAG_Carry_out;
assign Zero = ULA_FLAG_Zero;


//Instância da UNIDADE_CONTR_ULA
unidade_de_controle_ULA UNIDADE_CONTR_ULA (UNIDADE_CONTR_ULA_OPULA,UNIDADE_CONTR_ULA_Selection);

//Instância da ULA
ula_32_bits ULA ( ULA_Selection, ULA_Enable, ULA_IN_A, ULA_IN_B, ULA_OUT, ULA_FLAG_Signal,
			ULA_FLAG_Overflow, ULA_FLAG_Carry_out,ULA_FLAG_Zero, ULA_OUT_Ready);

//Instância do TESTADOR DE SALTOS
testador_salto TESTADOR_DE_SALTOS (Enable_FontePC, Opcode_Jump, Op, Cond_to_jump,
			Signal_Result, Carry_out, Overflow,	Zero,	Branch);
	
always @( * ) begin
	if (ULA_MUX_Fonte) begin
		ULA_IN_B <= B_R_Out_2;
	end
	else begin
		ULA_IN_B <= EXTENSOR_DE_SINAL_OUT;
	end
	PC_NEXT_INS_OUT <= PC_NEXT_INS_IN + EXTENSOR_DE_SINAL_OUT;
end


endmodule