module TB_detector_de_flags();
	
	reg[31:0] Data_tb;
	reg Enable_tb, Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb;
	wire Overflow_tb, Zero_tb;
	integer error, qtdTestes;
	
detector_de_flags dut(Enable_tb, Data_tb, Signal_A_tb, Signal_B_tb, Signal_Result_tb,
						Seletion_Sum_Sub_tb,	Overflow_tb, Zero_tb);


initial begin
	error = 0;
	qtdTestes = 0;
	Enable_tb = 1'b1;
	
	//A-B -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd0; Signal_A_tb = 1'b0; Signal_B_tb = 1'b0; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b1; #1
	if(Overflow_tb == 1'b0  && Zero_tb == 1'b1)begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//A-(-B) -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd1; Signal_A_tb = 1'b0; Signal_B_tb = 1'b1; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b1; #1
	if(Overflow_tb == 1'b0  && Zero_tb == 1'b0)begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//-A-B -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd0; Signal_A_tb = 1'b1; Signal_B_tb = 1'b0; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b1; #1
	if(Overflow_tb == 1'b1  && Zero_tb == 1'b1)begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//-A-B -> S NEGATIVO	
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd111; Signal_A_tb = 1'b1; Signal_B_tb = 1'b0; Signal_Result_tb = 1'b1; 
	Seletion_Sum_Sub_tb = 1'b1; #1
	if(Overflow_tb == 1'b0  && Zero_tb == 1'b0 )begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//-A-B -> S NEGATIVO	
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd32;Signal_A_tb = 1'b1; Signal_B_tb = 1'b0; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b1; #1
	if(Overflow_tb == 1'b1  && Zero_tb == 1'b0 )begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//A-(-B) -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd0; Signal_A_tb = 1'b0; Signal_B_tb = 1'b1; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b1; #1
	if(Overflow_tb == 1'b0  && Zero_tb == 1'b1 )begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//A+B -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd44; Signal_A_tb = 1'b0; Signal_B_tb = 1'b0; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b0; #1
	if(Overflow_tb == 1'b0  && Zero_tb == 1'b0 )begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//A+B -> S NEGATIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd44; Signal_A_tb = 1'b0; Signal_B_tb = 1'b0; Signal_Result_tb = 1'b1;
	Seletion_Sum_Sub_tb = 1'b0; #1
	if(Overflow_tb == 1'b1  && Zero_tb == 1'b0 )begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//-A+(-B) -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd0; Signal_A_tb = 1'b1; Signal_B_tb = 1'b1; Signal_Result_tb = 1'b0;
	Seletion_Sum_Sub_tb = 1'b0; #1
	if(Overflow_tb == 1'b1  && Zero_tb == 1'b1)begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	//-A+(-B) -> S POSITIVO
	qtdTestes = qtdTestes + 1;
	Data_tb = 32'd11; Signal_A_tb = 1'b1; Signal_B_tb = 1'b1; Signal_Result_tb = 1'b1; 
	Seletion_Sum_Sub_tb = 1'b0; #1
	if(Overflow_tb == 1'b0  && Zero_tb == 1'b0)begin
	end		
	else begin
		$display("Signal_A_tb = %x, Signal_B_tb = %x, Signal_Result_tb = %x; Seletion_Sum_Sub_tb = %x, Overflow_tb = %x",
					Signal_A_tb, Signal_B_tb, Signal_Result_tb, Seletion_Sum_Sub_tb, Overflow_tb);
		error = error+1;
	end
	
	
	
	
	//ERROR MENSAGE
	$display("\nTESTE DE DETECTOR DE FLAG:\n");
	if(error != 0) begin
		$display("%x erros no teste", error);
	end
	else begin
		$display("Testes executados %d.\nSem erro no teste", qtdTestes);
	end
	
end
endmodule