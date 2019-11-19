module ALU_Control(funct_i, ALUOp_i, ALU_Ctrl_o);

input [1:0] ALUOp_i;
input [9:0] funct_i; // funct7 + funct3
output reg [2:0] ALU_Ctrl_o;

always@(ALUOp_i or funct_i) begin
	case(ALUOp_i)
		2'b01:
			ALUOp_i <= 3'b110;
		2'b00:
			case(funct_i)
				10'b0000000111: ALUCtrl_o <= 3'b001; // and
				10'b0000000110: ALUCtrl_o <= 3'b010; // or
				10'b0000000000: ALUCtrl_o <= 3'b011; // add
				10'b0100000000: ALUCtrl_o <= 3'b100; // sub
				10'b0000001000: ALUCtrl_o <= 3'b101; // mul
			default: ALUCtrl_o <= 3'b000; // nop
			endcase
	endcase
end