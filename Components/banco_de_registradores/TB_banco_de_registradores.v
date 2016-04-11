module TB_banco_de_registradores();

	reg [31:0] Data_to_write_tb;
	reg [3:0] Read_1_tb, Read_2_tb, Address_to_write_tb;
	reg Signal_write_tb,	Signal_read_tb, Signal_reset_tb, Clock_in_tb;
	wire [31:0] Out_1_tb, Out_2_tb;
	integer error, qtdTestes;
	
banco_de_registradores dut(Read_1_tb, Read_2_tb, Data_to_write_tb,
				Address_to_write_tb, Signal_write_tb, Signal_read_tb,
				Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);

//CLOCK DE 5 EM 5
always  begin
	#5  Clock_in_tb =  !Clock_in_tb;
	end

	
initial begin
	error = 0;
	qtdTestes = 0;
	Clock_in_tb = 0;

	//SINAL DE RESET COM CLOCK
	qtdTestes = qtdTestes + 1;
	Read_1_tb = 4'b0; Read_2_tb = 4'b1; Data_to_write_tb = 32'b0; Address_to_write_tb = 4'b0;
	Signal_write_tb = 1'b0; Signal_read_tb = 1'b0; Signal_reset_tb = 1'b1;  #6
	Signal_reset_tb = 1'b0; #4
	if(Out_1_tb == 32'b0 && Out_2_tb == 32'b0)begin
	end
	else begin
		$display("Read_1_tb = %x, Read_2_tb = %x, Data_to_write_tb = %x, Address_to_write_tb = %x",
				Read_1_tb, Read_2_tb, Data_to_write_tb, Address_to_write_tb);
		$display("Signal_write_tb = %x, Signal_read_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Out_1_tb = %x, Out_2_tb = %x\n",
				Signal_write_tb, Signal_read_tb, Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);
		error = error+1;
	end
	
	//SINAL DE ESCREVER COM CLOCK
	qtdTestes = qtdTestes + 1;
	Read_1_tb = 4'b0; Read_2_tb = 4'b1; Data_to_write_tb = 32'd1; Address_to_write_tb = 4'b0;
	Signal_write_tb = 1'b1; Signal_read_tb = 1'b0; Signal_reset_tb = 1'b0;  #6
	Signal_reset_tb = 1'b0; #4
	if(Out_1_tb == 32'b0 && Out_2_tb == 32'b0)begin
	end
	else begin
		$display("Read_1_tb = %x, Read_2_tb = %x, Data_to_write_tb = %x, Address_to_write_tb = %x",
				Read_1_tb, Read_2_tb, Data_to_write_tb, Address_to_write_tb);
		$display("Signal_write_tb = %x, Signal_read_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Out_1_tb = %x, Out_2_tb = %x\n",
				Signal_write_tb, Signal_read_tb, Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);
		error = error+1;
	end
	
	//SINAL DE LER COM CLOCK
	//POSIÇÃO 1 TEM DE TER 1 DEVIDO AO RESET
	qtdTestes = qtdTestes + 1;
	Read_1_tb = 4'b0; Read_2_tb = 4'b1; Data_to_write_tb = 32'b0; Address_to_write_tb = 4'b0;
	Signal_write_tb = 1'b0; Signal_read_tb = 1'b1; Signal_reset_tb = 1'b0;  #6
	Signal_reset_tb = 1'b0; #4
	if(Out_1_tb == 32'b1 && Out_2_tb == 32'b1)begin
	end
	else begin
		$display("Read_1_tb = %x, Read_2_tb = %x, Data_to_write_tb = %x, Address_to_write_tb = %x",
				Read_1_tb, Read_2_tb, Data_to_write_tb, Address_to_write_tb);
		$display("Signal_write_tb = %x, Signal_read_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Out_1_tb = %x, Out_2_tb = %x\n",
				Signal_write_tb, Signal_read_tb, Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);
		error = error+1;
	end
	
	//SINAL DE ESCREVER E LER COM CLOCK
	qtdTestes = qtdTestes + 1;
	Read_1_tb = 4'b0; Read_2_tb = 4'b111; Data_to_write_tb = 32'b111; Address_to_write_tb = 4'b111;
	Signal_write_tb = 1'b1; Signal_read_tb = 1'b1; Signal_reset_tb = 1'b0;  #6
	Signal_reset_tb = 1'b0; #4
	if(Out_1_tb == 32'b1 && Out_2_tb == 32'b0)begin
	end
	else begin
		$display("Read_1_tb = %x, Read_2_tb = %x, Data_to_write_tb = %x, Address_to_write_tb = %x",
				Read_1_tb, Read_2_tb, Data_to_write_tb, Address_to_write_tb);
		$display("Signal_write_tb = %x, Signal_read_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Out_1_tb = %x, Out_2_tb = %x\n",
				Signal_write_tb, Signal_read_tb, Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);
		error = error+1;
	end
	
	//SINAL DE LER COM CLOCK
	qtdTestes = qtdTestes + 1;
	Read_1_tb = 4'b0; Read_2_tb = 4'b111; Data_to_write_tb = 32'b111; Address_to_write_tb = 4'b111;
	Signal_write_tb = 1'b0; Signal_read_tb = 1'b1; Signal_reset_tb = 1'b0;  #6
	Signal_reset_tb = 1'b0; #4
	if(Out_1_tb == 32'b1 && Out_2_tb == 32'b111)begin
	end
	else begin
		$display("Read_1_tb = %x, Read_2_tb = %x, Data_to_write_tb = %x, Address_to_write_tb = %x",
				Read_1_tb, Read_2_tb, Data_to_write_tb, Address_to_write_tb);
		$display("Signal_write_tb = %x, Signal_read_tb = %x, Signal_reset_tb = %x, Clock_in_tb = %x, Out_1_tb = %x, Out_2_tb = %x\n",
				Signal_write_tb, Signal_read_tb, Signal_reset_tb, Clock_in_tb, Out_1_tb, Out_2_tb);
		error = error+1;
	end
	
	
	//ERROR MENSAGE
	$display("\nTESTE DO BANCO DE REGISTRADORES:\n");
	if(error != 0) begin
		$display("%x erros no teste", error);
	end
	else begin
		$display("Testes executados %x.\nSem erro no teste", qtdTestes);
	end
	
end
endmodule