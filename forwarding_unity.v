module forwarding_unity(
	//CLOCK
	input wire clock,
	input wire reset,
	input wire [3:0] B_R_Out_1,
	input wire [3:0] B_R_Out_2,
	input wire [3:0] B_R_Address_to_write,
	output wire by_pass_A,
	output wire by_pass_B
	);

reg control;

assign by_pass_A = (~|(B_R_Out_1 ^ B_R_Address_to_write))&control;
assign by_pass_B = (~|(B_R_Out_2 ^ B_R_Address_to_write))&control;


always @( posedge clock ) begin
	if(reset) begin
		control <= 1'b0;
	end
	else begin
		control <= 1'b1;
	end
end


endmodule