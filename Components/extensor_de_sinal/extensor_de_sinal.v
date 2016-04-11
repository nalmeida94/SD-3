module extensor_de_sinal(In, Out);

input wire [15:0] In;
output wire [31:0] Out;

localparam qtdBits = 16;

assign Out[31:0] = { {qtdBits{In[15]}} , In};


endmodule