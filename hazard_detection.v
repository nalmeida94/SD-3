module hazard_detection(
	//CLOCK
	input wire clock,
	input wire reset,
	input wire [2:0] INSTRUC_OPCODE,
	input wire [3:0] B_R_Address_to_write,
	input wire [3:0] B_R_Out_2,
	output wire stall
	);

reg [3:0] A;

reg control;
wire jump_r;


assign jump_r = &INSTRUC_OPCODE;

assign stall = ((~|(A^B_R_Out_2))&jump_r)&control;

always @( posedge clock ) begin
	if(reset) begin
		A <= 32'b0;
		control <= 1'b0;
	end
	else begin
		control <= 1'b1;
		A <= B_R_Address_to_write;
	end
end


endmodule