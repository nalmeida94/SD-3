module banco_de_registradores(
			Read_1,
			Read_2,
			Data_to_write,
			Address_to_write,
			Signal_write,
			Signal_read,
			Signal_reset,
			Clock_in,
			Out_1,
			Out_2
			);

input wire [3:0] Read_1;
input wire [3:0] Read_2;
input wire [31:0] Data_to_write;
//32 possible registers
input wire [3:0] Address_to_write;
input wire Signal_write, Signal_read, Signal_reset;
input wire Clock_in;
reg [31:0] Data [0:16];
output reg [31:0] Out_1;
output reg [31:0] Out_2;


always @( Clock_in ) begin
	if( Clock_in ) begin
		//reset operation
		//Reset all the registers
		if (Signal_reset) begin
			//Data[4:0] <= 32'd0;
			Data[0]  <= 32'b0;		Data[1]  <= 32'b1;		Data[2]  <= 32'b0;
			Data[3]  <= 32'b0;		Data[4]  <= 32'b0;		Data[5]  <= 32'b0;
			Data[6]  <= 32'b0;		Data[7]  <= 32'b0;		Data[8]  <= 32'b0;
			Data[9]  <= 32'b0;		Data[10] <= 32'b0;		Data[11] <= 32'b0;
			Data[12] <= 32'b0;		Data[13] <= 32'b0;      Data[14] <= 32'b0;
			Data[15] <= 32'b0;		
			
			Out_1 <= 32'b0; Out_2 <= 32'b0;
		end
		else begin
			//write operation
			//Puting a data of the registers
			if(Signal_write) begin
				Data[Address_to_write] <= Data_to_write;
			end		
		end
	end
	else begin
		if(Signal_read) begin
			//read operation
			//geting a data of the registers
			Out_1 <= Data[Read_1];
			Out_2 <= Data[Read_2];
		end
	end
end

/*
always @( posedge Clock_in ) begin
	//reset operation
	//Reset all the registers
	if (Signal_reset) begin
		//Data[4:0] <= 32'd0;
		Data[0]  <= 32'b0;		Data[1]  <= 32'b1;		Data[2]  <= 32'b0;
		Data[3]  <= 32'b0;		Data[4]  <= 32'b0;		Data[5]  <= 32'b0;
		Data[6]  <= 32'b0;		Data[7]  <= 32'b0;		Data[8]  <= 32'b0;
		Data[9]  <= 32'b0;		Data[10] <= 32'b0;		Data[11] <= 32'b0;
		Data[12] <= 32'b0;		Data[13] <= 32'b0;      Data[14] <= 32'b0;
		Data[15] <= 32'b0;		
		
		Out_1 <= 32'b0; Out_2 <= 32'b0;
	end
	else begin
		//write operation
		//Puting a data of the registers
		if(Signal_write) begin
			Data[Address_to_write] <= Data_to_write;
		end		
	end
end

always @( negedge Clock_in ) begin
	if(Signal_read) begin
		//read operation
		//geting a data of the registers
		Out_1 <= Data[Read_1];
		Out_2 <= Data[Read_2];
	end
end
*/
/*
always @( posedge Clock_in ) begin
	//reset operation
	//Reset all the registers
	if (Signal_reset) begin
		//Data[4:0] <= 32'd0;
		Data[0]  <= 32'b0;		Data[1]  <= 32'b1;		Data[2]  <= 32'b0;
		Data[3]  <= 32'b0;		Data[4]  <= 32'b0;		Data[5]  <= 32'b0;
		Data[6]  <= 32'b0;		Data[7]  <= 32'b0;		Data[8]  <= 32'b0;
		Data[9]  <= 32'b0;		Data[10] <= 32'b0;		Data[11] <= 32'b0;
		Data[12] <= 32'b0;		Data[13] <= 32'b0;      Data[14] <= 32'b0;
		Data[15] <= 32'b0;		
		
		Out_1 <= 32'b0; Out_2 <= 32'b0;
	end
	else begin
		//write operation
		//Puting a data of the registers
		if(Signal_write) begin
			Data[Address_to_write] <= Data_to_write;
		end
		if(Signal_read) begin
			//read operation
			//geting a data of the registers
			Out_1 <= Data[Read_1];
			Out_2 <= Data[Read_2];
		end
	end
end
*/

endmodule