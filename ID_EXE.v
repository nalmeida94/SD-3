module ID_EXE(
input clock,
input reset,
input stall,
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

always @(posedge clock) begin
	EXE_UC_PC_Signal_Write	<= (reset) ? 1'b0 : ((stall) ? EXE_UC_PC_Signal_Write : ID_UC_PC_Signal_Write);
	EXE_UC_MEM_INST_WE		<= (reset) ? 1'b0 : ((stall) ? EXE_UC_MEM_INST_WE : ID_UC_MEM_INST_WE);
	EXE_UC_B_R_RegDst			<= (reset) ? 1'b0 : ((stall) ? EXE_UC_B_R_RegDst : ID_UC_B_R_RegDst);
	EXE_UC_B_R_Signal_Read	<= (reset) ? 1'b0 : ((stall) ? EXE_UC_B_R_Signal_Read : ID_UC_B_R_Signal_Read);
	EXE_UC_B_R_Signal_Write	<= (reset) ? 1'b0 : ((stall) ? EXE_UC_B_R_Signal_Write : ID_UC_B_R_Signal_Write);
	EXE_UC_ULA_Fonte			<= (reset) ? 1'b0 : ((stall) ? EXE_UC_ULA_Fonte : ID_UC_ULA_Fonte);
	EXE_UC_Enable_Ula			<= (reset) ? 1'b0 : ((stall) ? EXE_UC_Enable_Ula : ID_UC_Enable_Ula);
	EXE_UC_MEM_DADO_WE		<= (reset) ? 1'b0 : ((stall) ? EXE_UC_MEM_DADO_WE : ID_UC_MEM_DADO_WE);
	EXE_UC_PC_FontePC			<= (reset) ? 1'b0 : ((stall) ? EXE_UC_PC_FontePC : ID_UC_PC_FontePC);
	EXE_UC_MemPara_B_Reg		<= (reset) ? 1'b0 : ((stall) ? EXE_UC_MemPara_B_Reg : ID_UC_MemPara_B_Reg);
	EXE_INSTRUC_OPCODE		<= (reset) ? 3'b0 : ((stall) ? EXE_INSTRUC_OPCODE : ID_INSTRUC_OPCODE);
	EXE_INSTRUC_R_OPULA		<= (reset) ? 5'b0 : ((stall) ? EXE_INSTRUC_R_OPULA : ID_INSTRUC_R_OPULA);
	EXE_INSTRUC_BRANCH_OP	<= (reset) ? 1'b0 : ((stall) ? EXE_INSTRUC_BRANCH_OP : ID_INSTRUC_BRANCH_OP);
	EXE_INSTRUC_BRANCH_COND	<= (reset) ? 4'b0 : ((stall) ? EXE_INSTRUC_BRANCH_COND : ID_INSTRUC_BRANCH_COND);
	EXE_PC_NEXT_INS_OUT		<= (reset) ? 32'b0 : ((stall) ? EXE_PC_NEXT_INS_OUT : ID_PC_NEXT_INS_OUT);
	EXE_EXTENSOR_DE_SINAL_OUT<= (reset) ? 32'b0 : ((stall) ? EXE_EXTENSOR_DE_SINAL_OUT : ID_EXTENSOR_DE_SINAL_OUT);
	EXE_B_R_Out_1				<= (reset) ? 32'b0 : ((stall) ? EXE_B_R_Out_1 : ID_B_R_Out_1);
	EXE_B_R_Out_2				<= (reset) ? 32'b0 : ((stall) ? EXE_B_R_Out_2 : ID_B_R_Out_2);
	EXE_ULA_MUX_Fonte			<= (reset) ? 1'b0 : ((stall) ? EXE_ULA_MUX_Fonte : ID_ULA_MUX_Fonte);
	EXE_ULA_Enable				<= (reset) ? 1'b0 : ((stall) ? EXE_ULA_Enable : ID_ULA_Enable);
	EXE_PC_NEXT_INS_IN		<= (reset) ? 32'b0 : ((stall) ? EXE_PC_NEXT_INS_IN : ID_PC_NEXT_INS_IN);

end

endmodule
