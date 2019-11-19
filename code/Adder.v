module Adder (
	data1_in, 	// A
	data2_in, 	// B
	data_o 		// S
);

input [31:0] data1_in, data2_in;
output reg [31:0] data_o;

assign data_o = data1_in + data2_in;

endmodule