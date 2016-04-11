module ula_32_bits(
			Selection,
			Enable,
			Data_A,
			Data_B,
			Data_out,
			Signal,
			Overflow,
			Carry_out,
			Zero,
			Ready,
			);

parameter 
				//LOGICAL
				Opcode_not 				= 5'd0,
				Opcode_and 				= 5'd1,
				Opcode_and_not_A 		= 5'd2,
				Opcode_and_not_B 		= 5'd3,
				Opcode_nand 			= 5'd4,
				Opcode_or 				= 5'd5,
				Opcode_or_not_A 		= 5'd6,
				Opcode_or_not_B 		= 5'd7,
				Opcode_nor 				= 5'd8,
				Opcode_xor 				= 5'd9,
				Opcode_xnor 			= 5'd10,
				//ARITHMETICS
				Opcode_add 				= 5'd11,
				Opcode_add_inc 		= 5'd12,
				Opcode_inc_A 			= 5'd13,
				Opcode_sub 				= 5'd14,
				Opcode_sub_dec 		= 5'd15,
				Opcode_dec_A 			= 5'd16,
				//SHIFTERS
				Opcode_lsl 				= 5'd17,
				Opcode_rsl 				= 5'd18,
				Opcode_asr 				= 5'd19
				;
	
input [31:0] Data_A, Data_B;
input [4:0] Selection;
input Enable;

reg [32:0] S;

reg Seletion_Sum_Sub_reg, Enable_overflow_reg;
wire Seletion_Sum_Sub, Enable_overflow, Overflow_wire, Zero_wire, Signal_A, Signal_B, Signal_Result;

output reg [31:0] Data_out;
output reg Overflow, Signal, Carry_out, Zero, Ready;


initial begin
	Ready = 1'b0;
	Overflow = 1'b0;
	Signal = 1'b0;
	Carry_out = 1'b0;
	Zero = 1'b0;
end

always @(*) begin
	//ENABLE THE VERIFICATION TO OVERFLOW IF IS AN ARITHMETIC OPERATION
	if(Selection == Opcode_add | Selection == Opcode_add_inc | Selection == Opcode_inc_A | 
		Selection == Opcode_sub | Selection == Opcode_sub_dec |Selection == Opcode_dec_A) begin
		Enable_overflow_reg = 1'b1;
	end
	else begin
		Enable_overflow_reg = 1'b0;
	end
	//DISCOVER IF IS A SUM OR SUB
	if(Selection == Opcode_add | Selection == Opcode_add_inc | Selection == Opcode_inc_A) begin
		Seletion_Sum_Sub_reg = 1'b0;
	end
	else begin
		Seletion_Sum_Sub_reg = 1'b1;
	end
end

assign Enable_overflow = Enable_overflow_reg;
assign Seletion_Sum_Sub = Seletion_Sum_Sub_reg;
assign Signal_A = Data_A[31];
assign Signal_B = Data_B[31];
assign Signal_Result = Data_out[31];

detector_de_flags U1 (Enable_overflow, Data_out, Signal_A, Signal_B, Signal_Result, Seletion_Sum_Sub, 
				Overflow_wire, Zero_wire);



always @( * ) begin
	Overflow = Overflow_wire;
	Zero = Zero_wire;
//always @( Data_A or Data_B or Selection ) begin
	if(Enable)begin
		case (Selection)
			//logicals
			Opcode_not: begin
				Data_out = ~Data_A;
			end
			Opcode_and: begin
				Data_out = Data_A & Data_B;
			end
			Opcode_and_not_A: begin
				Data_out = ~Data_A & Data_B;
			end
			Opcode_and_not_B: begin
				Data_out = Data_A & ~Data_B;
			end
			Opcode_nand: begin
				Data_out = ~(Data_A & Data_B);
			end
			Opcode_or: begin
				Data_out = Data_A | Data_B;
			end
			Opcode_or_not_A: begin
				Data_out = ~Data_A | Data_B;
			end
			Opcode_or_not_B: begin
				Data_out = Data_A | ~Data_B;
			end
			Opcode_nor: begin
				Data_out = ~(Data_A | Data_B);			
			end
			Opcode_xor: begin
				Data_out = Data_A ^ Data_B;
			end
			Opcode_xnor: begin
				Data_out = ~(Data_A ^ Data_B);
			end
			
			//Arithmetics
			Opcode_add: begin
				S[32:0] = Data_A[31:0] + Data_B[31:0];
				Carry_out = S[32];
				Signal = S[31];
				Data_out[31:0] = S[31:0];
			end
			Opcode_add_inc: begin
				S[32:0] = Data_A[31:0] + Data_B[31:0] + 31'd1;
				Carry_out = S[32];		
				Signal = S[31];
				Data_out[31:0] = S[31:0];
			end
			Opcode_inc_A: begin
				S[32:0] = Data_A[31:0] + 31'd1;
				Carry_out = S[32];
				Signal = S[31];
				Data_out[31:0] = S[31:0];
				
				if(Data_A[31] == 0 && Data_out[31] == 1) begin
					Overflow = 1'b1;
				end
			end
			Opcode_sub: begin
				S[32:0] = Data_A[31:0] - Data_B[31:0];
				Carry_out = S[32];
				Signal = S[31];
				Data_out[31:0] = S[31:0];
			end
			Opcode_sub_dec: begin
				S[32:0] = Data_A[31:0] - Data_B[31:0] - 31'd1;
				Carry_out = S[32];		
				Signal = S[31];
				Data_out[31:0] = S[31:0];
			end
			Opcode_dec_A: begin
				S[32:0] = Data_A[31:0] - 31'd1;
				Carry_out = S[32];
				Signal = S[31];
				Data_out[31:0] = S[31:0];
				
				if(Data_A[31] == 1 && Data_out[31] == 0) begin
					Overflow = 1'b1;
				end
			end
			
			//Shifters
			Opcode_lsl: begin
				Data_out[31:0] = Data_A[31:0] << Data_B[31:0];
			end
			Opcode_rsl: begin
				Data_out[31:0] = Data_A[31:0] >> Data_B[31:0];
			end			
			Opcode_rsl: begin
				Data_out[31:0] = Data_A[31:0] >>> Data_B[31:0];
			end
		endcase
		
		//Sending the signal of the selected operation ends
		Ready = 1'b1;
		
	end
	else begin
		Ready = 1'b0;
	end
end	


endmodule