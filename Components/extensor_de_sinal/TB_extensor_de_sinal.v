module TB_extensor_de_sinal();

	reg [15:0] In_tb;	
	wire [31:0] Out_tb;
	integer error, qtdTestes;
extensor_de_sinal dut(In_tb,Out_tb);

	
initial begin
	error = 0;
	qtdTestes = 0;
	qtdTestes = qtdTestes + 1;
	In_tb = 16'b0000000000000000;#1
	if(Out_tb == 32'b00000000000000000000000000000000 )begin
	end		
	else begin
		$display("In_tb = %x,Out_tb = %x",
					In_tb,Out_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	In_tb = 16'b1000000000000000;#1
	if(Out_tb == 32'hffff8000 )begin
	end		
	else begin
		$display("In_tb = %x,Out_tb = %x",
					In_tb,Out_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	In_tb = 16'b1000000000000001;#1
	if(Out_tb == 32'b11111111111111111000000000000001 )begin
	end		
	else begin
		$display("In_tb = %x,Out_tb = %x",
					In_tb,Out_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	In_tb = 16'b1110000000000000;#1
	if(Out_tb == 32'b11111111111111111110000000000000 )begin
	end		
	else begin
		$display("In_tb = %x,Out_tb = %x",
					In_tb,Out_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	In_tb = 16'b0000000000001111;#1
	if(Out_tb == 32'b00000000000000000000000000001111 )begin
	end		
	else begin
		$display("In_tb = %x,Out_tb = %x",
					In_tb,Out_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	In_tb = 16'b0000000000011000;#1
	if(Out_tb == 32'b00000000000000000000000000011000 )begin
	end		
	else begin
		$display("In_tb = %x,Out_tb = %x",
					In_tb,Out_tb);
		error = error+1;
	end
	
	
	//ERROR MENSAGE
	$display("\nTESTE DO EXTENSOR DE SINAL 32 BITS:\n");
	if(error != 0) begin
		$display("%x erros no teste", error);
	end
	else begin
		$display("Testes executados %d.\nSem erro no teste", qtdTestes);
	end
	
end
endmodule