module ALU_Control(funct_i, ALUOp_i, ALU_Ctrl_o);

input [9:0] funct_i;
input [1:0] ALUOp_i;
output reg [2:0] ALU_Ctrl_o;

