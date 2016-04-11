module STAGE_IF(
	//CLOCK
	input wire Clock_in,
	//SINAIS DE CONTROLE
	input wire CS_Branch,
	//PC
	input wire [31:0] PC_MUX_IN,
	input wire CS_PC_Signal_write,
	input wire CS_PC_Signal_reset,
	output reg [31:0] PC_NEXT_INS,
	//MEMORIA DE INSTRUCAO
	output wire [31:0] MEM_INS_OUT,
	input wire CS_MEM_INS_WE
	);

//PC
reg [31:0] PC_IN;
wire [31:0] PC_OUT;

//MEMÓRIA DE INSTRUÇÃO
wire MEM_INS_read_file, MEM_INS_write_file;
wire [9:0]	MEM_INS_ADDRESS;
wire [31:0]	MEM_INS_DATA, MEM_INS_Q;




//assign MEM_INS_OUT = MEM_INS_DATA;
assign MEM_INS_OUT = MEM_INS_Q;

//Instância do PC
pc PC (PC_IN, CS_PC_Signal_write, CS_PC_Signal_reset,	Clock_in, PC_OUT);

//Instância da MEMORIA_DE_INSTRUCAO
memoria_instrucao MEMORIA_DE_INSTRUCAO(MEM_INS_read_file, MEM_INS_write_file, CS_MEM_INS_WE,
			Clock_in, PC_OUT, MEM_INS_DATA, MEM_INS_Q);


always @( posedge Clock_in ) begin
	PC_NEXT_INS <= PC_OUT + 32'b1;
	if(CS_Branch) begin
		PC_IN <= PC_MUX_IN;
	end
	else begin
		PC_IN <= PC_NEXT_INS;
	end
end	


endmodule