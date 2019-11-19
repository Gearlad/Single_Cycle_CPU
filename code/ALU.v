module ALU(data1_i, data2_i, ALUCtrl_i, data_o, Zero_o)

input [31:0] data1_i, data2_i;
input [2:0] ALUCtrl_i;

output reg [31:0] data_o;
output reg Zero_o;

/*
and: 001
or: 010
add: 011
sub: 100
mul: 101
addi: 110

nop: 000
unused:111
*/

always@(data1_i or data2_i or ALUCtrl_i) begin
	Zero_o = 1'b0;
	case(ALUCtrl_i)
		3'b001: data_o <= data1_i & data2_i; // and
		3'b010: data_o <= data1_i | data2_i; // or
		3'b011: data_o <= data1_i + data2_i; // add
		3'b100: data_o <= data1_i - data2_i; // sub
		3'b101: data_o <= data1_i * data2_i; // mul
	default: data_o <= 32'd0; // nop
	endcase
end