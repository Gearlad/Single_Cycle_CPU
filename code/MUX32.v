module MUX(data1_i, data2_i, select_i, data_o)

input [31:0] data1_i, data2_i;
input select_i;
output reg [31:0] data_o;

// if select_i is 0, select data1, else select data2
always@(data1_i or data2_i or select_i) begin
	if(select_i == 1'b0) begin
		data_o <= data1_i;
	end
	else begin
		data_o <= data2_i;
	end
end

endmodule