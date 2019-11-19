module Sign_Extend(data_i, data_o);

input [11:0] data_i; // from 12-bit curr_instr[31:20] input
output reg [31:0] data_o; // for Sign_Extend_data_o[31:0]

always@(data_i) begin
	//$display("exec");
	data_o[31:0] <= {{20[data_i[11]]}, {data_i[11:0]}}; 
	// repeat digit at 12th spot, keep remaining
end

endmodule
// reference: https://stackoverflow.com/questions/4176556/how-to-sign-extend-a-number-in-verilog