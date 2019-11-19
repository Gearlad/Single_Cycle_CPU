module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input clk_i;
input rst_i;
input start_i;

//Control
wire Ctrl_Regwrite_o, Ctrl_ALUSrc_o;
wire [1:0] Ctrl_ALUOp_o;
wire [31:0] curr_instr_addr, next_instr_addr, curr_instr;

// ALU
wire [31:0] ALU_data_o;
wire ALU_zero_o;

//MUX32
wire [31:0] MUX_ALUSrc_data_o;

// Sign Extend
wire [31:0] Sign_Extend_data_o;

// ALU Control
wire [2:0] ALUCtrl_o;

// Registers
wire[31:0] Reg_RSdata_o, Reg_RTdata_o;

Control Control(
    .Op_i       (curr_instr[6:0]),
    //.RegDst_o   (),
    .ALUOp_o    (Ctrl_ALUOp_o),
    .ALUSrc_o   (Ctrl_ALUSrc_o),
    .RegWrite_o (Ctrl_Regwrite_o)
);

Adder Add_PC(
    .data1_in   (curr_instr_addr),
    .data2_in   (32'b100),
    .data_o     (next_instr_addr);
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (curr_instr_addr),
    .pc_o       (next_instr_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (curr_instr_addr), 
    .instr_o    (curr_instr)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (curr_instr[19:15]),
    .RTaddr_i   (curr_instr[24:20]),
    .RDaddr_i   (curr_instr[11:7]), 
    .RDdata_i   (ALU_data_o),
    .RegWrite_i (Ctrl_Regwrite_o), 
    .RSdata_o   (Reg_RSdata_o), 
    .RTdata_o   (Reg_RTdata_o) 
);

/*
MUX5 MUX_RegDst(
    .data1_i    (),
    .data2_i    (),
    .select_i   (),
    .data_o     ()
);
*/

MUX32 MUX_ALUSrc(
    .data1_i    (Reg_RTdata_o),
    .data2_i    (Sign_Extend_data_o),
    .select_i   (Ctrl_ALUSrc_o),
    .data_o     (MUX_ALUSrc_data_o)
);

Sign_Extend Sign_Extend(
    .data_i     (curr_instr[31:20]),
    .data_o     (Sign_Extend_data_o)
);
  
ALU ALU(
    .data1_i    (Reg_RSdata_o),
    .data2_i    (MUX_ALUSrc_data_o),
    .ALUCtrl_i  (ALUCtrl_o),
    .data_o     (ALU_data_o),
    .Zero_o     (ALU_zero_o)
);

ALU_Control ALU_Control(
    .funct_i    ({curr_instr[31:25], curr_instr[14:12]}),
    .ALUOp_i    (Ctrl_ALUOp_o),
    .ALUCtrl_o  (ALUCtrl_o)
);

endmodule

