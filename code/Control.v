module Control(Op_i, ALUOp_o, ALUSrc_o, RegWrite_o);

input [6:0] Op_i;

output reg ALUSrc_o, RegWrite_o;
output reg [1:0] ALUOp_o;

always@(Op_i) begin
	RegWrite_o <= 1'b1;
	case(Op_i)
		7'b001011:
			ALUOp_o <= 2'b00; // addi
			ALUSrc_o <= 1'b1;
		7'b0110011:
			ALUOp_o <= 2'b01; // other
			ALUSrc_o <= 1'b0; // select rs2
	end
end