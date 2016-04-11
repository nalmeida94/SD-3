module TB_ula_32_bits;


	reg [31:0] Data_A_tb, Data_B_tb;
	reg [4:0]Selection_tb;
	reg Enable_tb;
	wire [31:0] Data_out_tb;
	wire Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb;

	integer error, qtdTestes;
	
ula_32_bits dut( Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb, Signal_tb,
				Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
	
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
				Opcode_rsl 				= 5'd18
				;
 
 
initial
begin
	error = 0;
	qtdTestes = 0;
	
	Enable_tb = 1;
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST NOT
	Selection_tb = Opcode_not;
	
	qtdTestes = qtdTestes + 1;
	Data_A_tb = 32'b00000000000000000000000000000000; Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	Data_A_tb = 32'b10000000000000000000000000000001; Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b01111111111111111111111111111110  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	Data_A_tb = 32'b11111111111111111111111111111111; Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	Data_A_tb = 32'b00000000000000000000000000000011; Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b11111111111111111111111111111100  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes + 1;
	Data_A_tb = 32'b11000000000000000000000000000001; Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b00111111111111111111111111111110  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST AND
	Selection_tb = Opcode_and;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	qtdTestes = qtdTestes+1;
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b10000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b10000000000000000000000000000001  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000001  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b00000000000000000000000000000001   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST AND NOT A
	Selection_tb = Opcode_and_not_A;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	qtdTestes = qtdTestes+1;
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b10000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b01111111111111111111111111111110  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b01111111111111111111111111111111   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST AND NOT B
	Selection_tb = Opcode_and_not_B;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	qtdTestes = qtdTestes+1;
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b10000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000010  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b00000000000000000000000000000000   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST NAND
	Selection_tb = Opcode_nand;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	qtdTestes = qtdTestes+1;
	if(Data_out_tb == 32'b11111111111111111111111111111111  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b10000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b01111111111111111111111111111110  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b11111111111111111111111111111110  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b11111111111111111111111111111111   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end

	
	//-----------------------------------------------------------------------------------------------------------
	//TEST OR B
	Selection_tb = Opcode_or;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000011    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b01111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST OR NOT A
	Selection_tb = Opcode_or_not_A;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b11111111111111111111111111111101    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST OR NOT B
	Selection_tb = Opcode_or_not_B;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b1 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b10000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST NOR
	Selection_tb = Opcode_nor;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111   && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b11111111111111111111111111111100    && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b10000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST XOR
	Selection_tb = Opcode_xor;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111110  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b01111111111111111111111111111110 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TEST XNOR
	Selection_tb = Opcode_xnor;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b00000000000000000000000000000001  && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b11111111111111111111111111111111;#1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b11111111111111111111111111111101 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1;
	if(Data_out_tb == 32'b10000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE ADD
	Selection_tb = Opcode_add;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00111111111111111111111111111111; #1
	if(Data_out_tb == 32'b01000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//0+127
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1
	if(Data_out_tb == 32'b10000000000000000000000000000000 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b1 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+(-2)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111110; #1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+(-2)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000010;	Data_B_tb = 32'b11111111111111111111111111111110;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+(-1)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE ADDINC
	Selection_tb = Opcode_add_inc;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00111111111111111111111111111111; #1
	if(Data_out_tb == 32'b01000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//0+127
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b01111111111111111111111111111111;#1
	if(Data_out_tb == 32'b10000000000000000000000000000001 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b1 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+(-2)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111110; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+(-2)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000010;	Data_B_tb = 32'b11111111111111111111111111111110;#1
	if(Data_out_tb == 32'b00000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000011 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+(-1)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b00000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1+1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000011 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE INCA
	Selection_tb = Opcode_inc_A;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	#1
	if(Data_out_tb == 32'b00000000000000000000000000000100 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111110; #1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b01000000000000000000000000000001; #1
	if(Data_out_tb == 32'b01000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE SUB
	Selection_tb = Opcode_sub;
	
	//1-0
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b00000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//0-(-1)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b00000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end

	//1-(-2)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111110; #1
	if(Data_out_tb == 32'b00000000000000000000000000000011 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//(-2)-(-1)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111110;	Data_B_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b11111111111111111111111111111111&& Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001; Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1-(3)
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000011; #1
	if(Data_out_tb == 32'b11111111111111111111111111111110 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE SUBDEC	
	Selection_tb = Opcode_sub_dec;
	
	//1-0-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//0-(-1)-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end

	//1-(-2)-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b11111111111111111111111111111110; #1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//(-2)-(-1)-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111110;	Data_B_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b11111111111111111111111111111110&& Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1-1-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001; Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//1-(3)-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000011; #1
	if(Data_out_tb == 32'b11111111111111111111111111111101 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	//3-1-1
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE DECA
	Selection_tb = Opcode_dec_A;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000; #1
	if(Data_out_tb == 32'b11111111111111111111111111111111 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b1 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end

	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111110; #1
	if(Data_out_tb == 32'b11111111111111111111111111111101 && Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111; #1
	if(Data_out_tb == 32'b11111111111111111111111111111110&& Signal_tb == 1'b1 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011; Data_B_tb = 32'b00000000000000000000000000000001; #1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000100; #1
	if(Data_out_tb == 32'b00000000000000000000000000000011 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE LSL
	Selection_tb = Opcode_lsl;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000010 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b00000000000000000000000000000011;#1
	if(Data_out_tb == 32'b11111111111111111111111111111000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000110 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b01111111111111111111111111111111;	Data_B_tb = 32'b00000000000000000000000000000000;#1;
	if(Data_out_tb == 32'b01111111111111111111111111111111 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//TESTE RSL
	Selection_tb = Opcode_rsl;
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000000;	Data_B_tb = 32'b00000000000000000000000000000000;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000001;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000000 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b1 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b11111111111111111111111111111111;	Data_B_tb = 32'b00000000000000000000000000000011;#1
	if(Data_out_tb == 32'b00011111111111111111111111111111 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b00000000000000000000000000000011;	Data_B_tb = 32'b00000000000000000000000000000001;#1
	if(Data_out_tb == 32'b00000000000000000000000000000001 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	qtdTestes = qtdTestes+1;
	Data_A_tb = 32'b01111111111111111111111111111111;	Data_B_tb = 32'b00000000000000000000000000000000;#1;
	if(Data_out_tb == 32'b01111111111111111111111111111111 && Signal_tb == 1'b0 && 
			Overflow_tb == 1'b0 && Carry_out_tb == 1'b0 && Zero_tb == 1'b0 )begin
	end	
	else begin
		$display("Selection = %d, Enable = %x, Data_A = %x, Data_B = %x, Data_out = %x",
				Selection_tb, Enable_tb,Data_A_tb,Data_B_tb, Data_out_tb);
		$display("Signal = %x, Overflow = %x, Carry_out = %x, Zero = %x, Ready = %x",
				Signal_tb, Overflow_tb, Carry_out_tb, Zero_tb, Ready_tb);
		error = error+1;
	end
	
	
	//-----------------------------------------------------------------------------------------------------------
	//ERROR MENSAGE
	$display("\nTESTE DE ULA 32 BITS:\n");
	if(error != 0) begin
		$display("%d erros no teste", error);
	end
	else begin
		$display("Testes executados %d.\nSem erro no teste", qtdTestes);
	end
	
end
endmodule