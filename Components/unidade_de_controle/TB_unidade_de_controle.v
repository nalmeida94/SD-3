xmodule TB_unidade_de_controle();

	reg Clock, Reset;
	reg [2:0] Opcode;
	wire UC_PC_Signal_Write, UC_MEM_INST_WE,
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
	integer error, qtdTestes;
	
unidade_de_controle dut(input wire Clock,
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

//CLOCK DE 5 EM 5
always  begin
	#5  Clock_in_tb =  !Clock_in_tb;
	end

	
initial begin
	error = 0;
	qtdTestes = 0;
	Clock_in_tb = 0;

	//SINAL DE RESET COM CLOCK
	qtdTestes = qtdTestes + 1;
	Read_1_tb = 4'b0; Read_2_tb = 4'b1; Data_to_write_tb = 32'b0; Address_to_write_tb = 4'b0;
	Signal_write_tb = 1'b0; Signal_read_tb = 1'b0; Signal_reset_tb = 1'b1;  #6
	Signal_reset_tb = 1'b0; #4
	if(Out_1_tb == 32'b0 && Out_2_tb == 32'b0)begin
	end
	else begin
		$display("Read_1_tb = %x, Read_2_tb = %x, Data_to_write_tb = %x, Address_to_write_tb = %x",
				Read_1_tb, Read_2_tb, Data_to_write_tb, Address_to_write_tb);
		$display("Signal_write_tb = %x, Signal_read_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Out_1_tb = %x, Out_2_tb = %x\n",
				Signal_write_tb, Signal_read_tb, Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);
		error = error+1;
	end
	
	
	
	//ERROR MENSAGE
	$display("\nTESTE DO BANCO DE REGISTRADORES:\n");
	if(error != 0) begin
		$display("%x erros no teste", error);
	end
	else begin
		$display("Testes executados %x.\nSem erro no teste", qtdTestes);
	end
	
end
endmodule