module unidade_de_controle_ULA(
			Opula,
			Selection
			);

input wire [4:0] Opula;
output reg [4:0] Selection;

parameter
		Opula_add		= 5'b00000,
		Opula_addinc	= 5'b00001,
		Opula_inca		= 5'b00010,
		Opula_subdec	= 5'b00011,
		Opula_sub		= 5'b00100,
		Opula_deca		= 5'b00101,
		Opula_lsl		= 5'b00110,
		Opula_rsl		= 5'b00111,
		Opula_zeros		= 5'b01000,
		Opula_and		= 5'b01001,
		Opula_andnota	= 5'b01010,
		Opula_andnotb	= 5'b01011,
		Opula_passa		= 5'b01100,
		Opula_passb		= 5'b01101,
		Opula_xor		= 5'b01110,
		Opula_or			= 5'b01111,
		Opula_nand		= 5'b10000,
		Opula_xnor		= 5'b10001,
		Opula_passnota	= 5'b10010,
		Opula_ornota	= 5'b10011,
		Opula_ornotb	= 5'b10100,
		Opula_nor		= 5'b10101,
		Opula_ones		= 5'b10110,
		Opula_asr		= 5'b10110
		;

	
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
		Opcode_asr				= 5'd19
		;	
	
	
always @( * ) begin

	case(Opula)
		Opula_add: begin
			Selection = Opcode_add;
		end
		Opula_addinc: begin
			Selection = Opcode_add_inc;
		end
		Opula_inca: begin
			Selection = Opcode_inc_A;
		end
		Opula_subdec: begin
			Selection = Opcode_sub_dec;
		end
		Opula_sub: begin
			Selection = Opcode_sub;
		end
		Opula_deca: begin
			Selection = Opcode_dec_A;
		end
		Opula_lsl: begin
			Selection = Opcode_lsl;
		end
		Opula_rsl: begin
			Selection = Opcode_rsl;
		end
		//$s5 = $zero + $zero
		Opula_zeros: begin
			Selection = Opcode_add;
		end
		Opula_and: begin
			Selection = Opcode_and;
		end
		Opula_andnota: begin
			Selection = Opcode_and_not_A;
		end
		Opula_andnotb: begin
			Selection = Opcode_and_not_B;
		end
		//$s5 = $s4 + $zero
		Opula_passa: begin
			Selection = Opcode_add;
		end
		//$s5 = $s4 | $zero
		Opula_passb: begin
			Selection = Opcode_or;
		end
		Opula_xor: begin
			Selection = Opcode_xor;
		end
		Opula_or: begin
			Selection = Opcode_or;
		end
		Opula_nand: begin
			Selection = Opcode_nand;
		end
		Opula_xnor: begin
			Selection = Opcode_xnor;
		end
		Opula_passnota: begin
			Selection = Opcode_not;
		end
		Opula_ornota: begin
			Selection = Opcode_or_not_A;
		end
		Opula_ornotb: begin
			Selection = Opcode_or_not_B;
		end
		Opula_nor: begin
			Selection = Opcode_nor;
		end
		//$s5 = $one + $zero
		Opula_ones: begin
			Selection = Opcode_add;
		end
		Opula_asr: begin
			Selection = Opcode_asr;
		end
	endcase

end
	
endmodule	