module detector_de_flags(
			Enable,
			Data,
			Signal_A,
			Signal_B,
			Signal_Result,
			Seletion_Sum_Sub,
			Overflow,
			Zero
			);

/*
Seletion_Sum_Sub
					-> 1 = Subtração
					-> 0 = Soma
*/
input wire [31:0] Data;
input wire Enable, Signal_A, Signal_B, Signal_Result, Seletion_Sum_Sub;
wire or_Data;

output wire Overflow, Zero;


assign Overflow = (
						~Signal_A & ~Signal_B & Signal_Result & ~Seletion_Sum_Sub |	
						Signal_A & Signal_B & ~Signal_Result & ~Seletion_Sum_Sub | 
						~Signal_A & Signal_B & Signal_Result & Seletion_Sum_Sub |
						Signal_A & ~Signal_B & ~Signal_Result & Seletion_Sum_Sub
						) & Enable;

assign or_Data = |Data[31:0];					
assign Zero = ~or_Data;


endmodule