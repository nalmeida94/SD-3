module STAGE_WB(
input wire Clock_in,

//MUX PARA ESCRITA
input wire [31:0] MEM_DATA_OUT,
input wire [31:0] ULA_OUT,
output reg [31:0] B_R_Data_to_write,
input wire CS_UC_MemPara_B_Reg
	);




always @( * ) begin
	if(CS_UC_MemPara_B_Reg) begin
		B_R_Data_to_write <= MEM_DATA_OUT;
	end
	else begin
		B_R_Data_to_write <= ULA_OUT;
	end
end	


endmodule