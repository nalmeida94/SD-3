module unidade_de_controle (
	//Inputs
	input wire Clock,
	input wire Reset,
	input wire [2:0] Opcode,
	
	//Outputs
		//PC
		output reg UC_PC_Signal_Write,
		//MEMMORIA DE INSTRUCAO
		output reg UC_MEM_INST_WE,
		//BANCO DE REGISTRADORES
		output reg UC_B_R_RegDst,
		output reg UC_B_R_Signal_Read,
		output reg UC_B_R_Signal_Write,
		//ULA
		output reg UC_ULA_Fonte,
		output reg UC_Enable_Ula,
		//MEMORIA DADOS
		output reg UC_MEM_DADO_WE,
		//MUX DO PC
		output reg UC_PC_FontePC,
		//MUX DO BANCO DE REGISTRADORES
		output reg UC_MemPara_B_Reg,
		//RESET
		output reg UC_Reset_All
);

localparam 
			Opcode_NOP					= 3'b000,
			Opcode_LOGICAL				= 3'b001,
			Opcode_CONSTANT			= 3'b010,
			Opcode_MEM_LOAD			= 3'b011,
			Opcode_MEM_STORE			= 3'b100,
			Opcode_BRANCH				= 3'b101,
			Opcode_JUMP					= 3'b110,
			Opcode_JUMP_R				= 3'b111		
			;



always@ ( Opcode ) begin
	if(Reset) begin
		UC_Reset_All <= 1'b1;
	end
	else begin
		UC_Reset_All 			<= 1'b0;
		case ( Opcode )
			Opcode_NOP: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b0;
				UC_B_R_Signal_Read	<= 1'b0;
				UC_B_R_Signal_Write	<= 1'b0;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b0;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b0;
				UC_MemPara_B_Reg		<= 1'b0;
			end
			Opcode_LOGICAL: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b1;
				UC_B_R_Signal_Read	<= 1'b1;
				UC_B_R_Signal_Write	<= 1'b1;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b1;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b0;
				UC_MemPara_B_Reg		<= 1'b0;
			end
			Opcode_CONSTANT: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b1;
				UC_B_R_Signal_Read	<= 1'b1;
				UC_B_R_Signal_Write	<= 1'b1;
				UC_ULA_Fonte			<= 1'b1;
				UC_Enable_Ula			<= 1'b1;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b0;
				UC_MemPara_B_Reg		<= 1'b0;
			end
			Opcode_MEM_LOAD: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b0;
				UC_B_R_Signal_Read	<= 1'b1;
				UC_B_R_Signal_Write	<= 1'b1;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b0;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b0;
				UC_MemPara_B_Reg		<= 1'b1;
			end
			Opcode_MEM_STORE: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b0;
				UC_B_R_Signal_Read	<= 1'b1;
				UC_B_R_Signal_Write	<= 1'b0;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b0;
				UC_MEM_DADO_WE			<= 1'b1;
				UC_PC_FontePC			<= 1'b0;
				UC_MemPara_B_Reg		<= 1'b0;
			end
			Opcode_BRANCH: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b0;
				UC_B_R_Signal_Read	<= 1'b0;
				UC_B_R_Signal_Write	<= 1'b0;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b0;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b1;
				UC_MemPara_B_Reg		<= 1'b0;
			end
			Opcode_JUMP: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b0;
				UC_B_R_Signal_Read	<= 1'b0;
				UC_B_R_Signal_Write	<= 1'b0;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b1;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b1;
				UC_MemPara_B_Reg		<= 1'b0;
			end
			Opcode_JUMP_R: begin
				UC_PC_Signal_Write 	<= 1'b1;
				UC_MEM_INST_WE			<= 1'b0;
				UC_B_R_RegDst			<= 1'b0;
				UC_B_R_Signal_Read	<= 1'b1;
				UC_B_R_Signal_Write	<= 1'b0;
				UC_ULA_Fonte			<= 1'b0;
				UC_Enable_Ula			<= 1'b1;
				UC_MEM_DADO_WE			<= 1'b0;
				UC_PC_FontePC			<= 1'b1;
				UC_MemPara_B_Reg		<= 1'b0;
			end
		endcase
	end
end

endmodule

/*
// State Encoding
localparam 
			STATE_Initial_Reset 		= 3'b000,
			STATE_1_IF 					= 3'b001,
			STATE_2_ID 					= 3'b010,
			STATE_3_EXE 				= 3'b011,
			STATE_4_MEM 				= 3'b100,
			STATE_5_WB 					= 3'b101
			;

localparam 
			Opcode_NOP					= 3'b000,
			Opcode_LOGICAL				= 3'b001,
			Opcode_CONSTANT			= 3'b010,
			Opcode_MEM_LOAD			= 3'b011,
			Opcode_MEM_STORE			= 3'b100,
			Opcode_BRANCH				= 3'b101,
			Opcode_JUMP					= 3'b110,
			Opcode_JUMP_R				= 3'b111		
			;


// State reg Declarations
reg [2:0] State;

//OUTPUTS
always@ ( posedge Clock ) begin
	case ( State )
		STATE_Initial_Reset : begin
			State <= STATE_1_IF;
		end
		STATE_1_IF: begin
			State <= STATE_2_ID;
		end
		STATE_2_ID: begin
			State <= STATE_3_EXE;
		end
		STATE_3_EXE : begin
			State <= STATE_4_MEM;
		end
		STATE_4_MEM : begin
			State <= STATE_5_WB;
		end
		STATE_5_WB: begin
			State <= STATE_1_IF;
		end		
	endcase
end


always@ ( State ) begin
	case ( State )
		//RESET
		STATE_Initial_Reset : begin			
			UC_Reset_All 			<= 1'b1;
			UC_PC_Signal_Write 	<= 1'b0;
			UC_MEM_INST_WE			<= 1'b0;
			UC_B_R_RegDst			<= 1'b0;
			UC_B_R_Signal_Read	<= 1'b0;
			UC_B_R_Signal_Write	<= 1'b0;
			UC_ULA_Fonte			<= 1'b0;
			UC_Enable_Ula			<= 1'b0;
			UC_MEM_DADO_WE			<= 1'b0;
			UC_PC_FontePC			<= 1'b0;
			UC_MemPara_B_Reg		<= 1'b0;
		end
		STATE_1_IF : begin
			case ( Opcode )
				Opcode_NOP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_LOGICAL: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_CONSTANT: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_LOAD: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_STORE: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_BRANCH: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP_R: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				
			endcase
		end
		STATE_2_ID: begin
			case ( Opcode )
				Opcode_NOP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_LOGICAL: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b1;
					UC_B_R_Signal_Read	<= 1'b1;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_CONSTANT: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b1;
					UC_B_R_Signal_Read	<= 1'b1;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b1;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_LOAD: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b1;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b1;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_STORE: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b1;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b1;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_BRANCH: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP_R: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b1;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				
			endcase
		end
		STATE_3_EXE : begin
			case ( Opcode )
				Opcode_NOP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_LOGICAL: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b1;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_CONSTANT: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b1;
					UC_Enable_Ula			<= 1'b1;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_LOAD: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b1;
					UC_Enable_Ula			<= 1'b1;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_STORE: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b1;
					UC_Enable_Ula			<= 1'b1;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_BRANCH: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b1;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b1;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b1;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP_R: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b1;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b1;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				
			endcase
		end
		STATE_4_MEM : begin
			case ( Opcode )
				Opcode_NOP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_LOGICAL: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_CONSTANT: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_LOAD: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b1;
				end
				Opcode_MEM_STORE: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b1;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_BRANCH: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b1;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b1;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP_R: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b1;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				
			endcase
		end
		STATE_5_WB: begin
			case ( Opcode )
				Opcode_NOP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_LOGICAL: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b1;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b1;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_CONSTANT: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b1;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b1;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_LOAD: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b1;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b1;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_MEM_STORE: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b1;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_BRANCH: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				Opcode_JUMP_R: begin
					UC_Reset_All 			<= 1'b0;
					UC_PC_Signal_Write 	<= 1'b0;
					UC_MEM_INST_WE			<= 1'b0;
					UC_B_R_RegDst			<= 1'b0;
					UC_B_R_Signal_Read	<= 1'b0;
					UC_B_R_Signal_Write	<= 1'b0;
					UC_ULA_Fonte			<= 1'b0;
					UC_Enable_Ula			<= 1'b0;
					UC_MEM_DADO_WE			<= 1'b0;
					UC_PC_FontePC			<= 1'b0;
					UC_MemPara_B_Reg		<= 1'b0;
				end
				
			endcase
		end		
	endcase
end

endmodule
*/