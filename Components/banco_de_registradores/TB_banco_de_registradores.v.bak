module TB_banco_de_registradores();


	reg [31:0] In_tb;
	reg Signal_write_tb,	Signal_reset_tb, Clock_in_tb;
	wire [31:0] Data_tb;
	integer error, qtdTestes;
	
banco_de_registradores dut(In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);

//CLOCK DE 5 EM 5
always
   #5  Clock_in_tb =  ! Clock_in_tb; 

	
initial begin
	error = 0;
	qtdTestes = 0;
	Clock_in_tb = 0;
	
	//SINAL DE ESCREVER COM CLOCK
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b00000000000000000000000000000000;
	Signal_write_tb = 1'b1; Signal_reset_tb = 1'b0;  #6//Clock_in_tb = 1'b1; #1
	if(Data_tb == 32'b00000000000000000000000000000000 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SEM CLOCK  COM SINAL DE ESCREVER
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b00000000000000000000000000011111;
	Signal_write_tb = 1'b0; Signal_reset_tb = 1'b0;  #6//Clock_in_tb = 1'b1; #1
	if(Data_tb == 32'b00000000000000000000000000000000 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SINAL DE ESCREVER COM CLOCK
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b11110000000000000000000000001111;
	Signal_write_tb = 1'b1; Signal_reset_tb = 1'b0;  #6//Clock_in_tb = 1'b0; #1
	if(Data_tb == 32'b11110000000000000000000000001111 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SINAL DE ESCREVER SEM CLOCK
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b0000000000000000000000000000000;
	Signal_write_tb = 1'b1; Signal_reset_tb = 1'b0;  #5//Clock_in_tb = 1'b1; #1
	if(Data_tb == 32'b11110000000000000000000000001111 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SEM SINAL DE ESCREVER COM CLOCK COM RESET
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b00000000000000000000000000001111;
	Signal_write_tb = 1'b0; Signal_reset_tb = 1'b1;  #7//Clock_in_tb = 1'b1; #1
	if(Data_tb == 32'b00000000000000000000000000000000 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SINAL DE RESET COM CLOCK COM SINAL DE ESCREVER
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b00000000000000000000000000001111;
	Signal_write_tb = 1'b1; Signal_reset_tb = 1'b1;  #6//Clock_in_tb = 1'b1; #1
	if(Data_tb == 32'b00000000000000000000000000000000 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SINAL DE ESCREVER COM CLOCK
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b10000000000000000000000000000011;
	Signal_write_tb = 1'b1; Signal_reset_tb = 1'b0;  #10//Clock_in_tb = 1'b1; #1
	if(Data_tb == 32'b10000000000000000000000000000011 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	//SINAL DE RESET SEM CLOCK
	qtdTestes = qtdTestes + 1;
	In_tb = 32'b00000000000000000000000000011111;
	Signal_write_tb = 0'b0; Signal_reset_tb = 1'b1;  #3//Clock_in_tb = 1'b0; #1
	if(Data_tb == 32'b10000000000000000000000000000011 )begin
	end		
	else begin
		$display("In_tb = %x, Signal_write_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Data_tb = %x",
					In_tb, Signal_write_tb, Signal_reset_tb, Clock_in_tb, Data_tb);
		error = error+1;
	end
	
	
	//ERROR MENSAGE
	$display("\nTESTE DE PC 32 BITS:\n");
	if(error != 0) begin
		$display("%x erros no teste", error);
	end
	else begin
		$display("Testes executados %x.\nSem erro no teste", qtdTestes);
	end
	
end
endmodule