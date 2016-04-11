module testador_salto(
			Enable_FontePC,
			Opcode_Jump,
			Op,
			Cond_to_jump,
			Signal_Result,
			Carry_out,
			Overflow,
			Zero,
			Branch
			);

/*
OP
	-> 1 = FALSE
	-> 0 = TRUE
*/
localparam 
	COND_TO_JUMP_NEG				 		= 3'b000,
	COND_TO_JUMP_ZERO						= 3'b001,
	COND_TO_JUMP_CARRY					= 3'b010,
	COND_TO_JUMP_NEG_ZERO 				= 3'b011,
	COND_TO_JUMP_OVERFLOW				= 3'b100
	;
localparam
	JUMP_CONDICIONAL		= 3'b101,
	JUMP_INCONDICIONAL	= 3'b110,
	JUMP_REGISTER			= 3'b111
	;

input wire Enable_FontePC, Op, Signal_Result, Carry_out, Overflow, Zero;
input wire [3:0] Cond_to_jump;
input wire [2:0] Opcode_Jump;
/*
Branch -> 1 saltar
Branch -> 0 PC+4
*/
output reg Branch; 


always@ ( * ) begin
	//IS A JUMP OPERATION, THE UC IDENTIFY THIS
	if(Enable_FontePC) begin
		case(Opcode_Jump)
			//CONDITIONAL JUMP
			JUMP_CONDICIONAL: begin
				//A jt. operation
				if(Op) begin
					case ( Cond_to_jump )
						COND_TO_JUMP_NEG: begin
							if(Signal_Result) begin
								Branch = 1'b1;
							end
							else begin
								Branch = 1'b0;
							end
						end
						COND_TO_JUMP_ZERO: begin
							if(Zero) begin
								Branch = 1'b1;
							end
							else begin
								Branch = 1'b0;
							end
						end
						COND_TO_JUMP_CARRY: begin
							if(Carry_out) begin
								Branch = 1'b1;
							end
							else begin
								Branch = 1'b0;
							end
						end
						COND_TO_JUMP_NEG_ZERO: begin
							if(Signal_Result | Zero) begin
								Branch = 1'b1;
							end
							else begin
								Branch = 1'b0;
							end
						end
						COND_TO_JUMP_OVERFLOW: begin
							if(Overflow) begin
								Branch = 1'b1;
							end
							else begin
								Branch = 1'b0;
							end
						end
					endcase
				end
				//A jf. operation
				else begin
					case (Cond_to_jump)
						COND_TO_JUMP_NEG: begin
							if(Signal_Result) begin
								Branch = 1'b0;
							end
							else begin
								Branch = 1'b1;
							end
						end
						COND_TO_JUMP_ZERO: begin
							if(Zero) begin
								Branch = 1'b0;
							end
							else begin
								Branch = 1'b1;
							end
						end
						COND_TO_JUMP_CARRY: begin
							if(Carry_out) begin
								Branch = 1'b0;
							end
							else begin
								Branch = 1'b1;
							end
						end
						COND_TO_JUMP_NEG_ZERO: begin
							if(Signal_Result | Zero) begin
								Branch = 1'b0;
							end
							else begin
								Branch = 1'b1;
							end
						end
						COND_TO_JUMP_OVERFLOW: begin
							if(Overflow) begin
								Branch = 1'b0;
							end
							else begin
								Branch = 1'b1;
							end
						end
					endcase
				end			
			end
			//INCONDITIONAL JUMP
			JUMP_INCONDICIONAL: begin
				Branch = 1'b1;
			end
			//REGISTER JUMP
			JUMP_REGISTER: begin
				Branch = 1'b1;
			end
		endcase
	end
	else begin
		Branch = 1'b0;
	end
end


endmodule