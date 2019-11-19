# Single Cycle CPU
### Seth Austin Harding	|	韓哈斯	｜	B06902101

## CA HW3: Verilog Implementation
Verilog implementation of a single cycle CPU, including a driver module, a CPU module (connecting all other modules), control, adder, PC, instruction memory, registers, mux32, mux5, sign extend, ALU, and ALU control modules.

-----

**Compilation**: iverilog *.v <br>
Equivalent to command: iverilog testbench.v CPU.v Adder.v Control.v PC.v Instruction_Memory.v Registers.v MUX32.v Sign_Extend.v ALU.v ALU_Control.v<br>
**Execution**: ./a.out <br>
Output printed to the console will be written to output.txt

## Verilog Files

### Testbench.v
The main 'driver' file for this implementation is the provided *testbench.v*. This file is responsible for initializing both the instruction memory and the register file to default 32-bit binary zero values, also handling resets, starting and ending the simulation, and accessing input (instruction.txt) and writing (output.txt) files. Cycle time, defined in the pre-compiler, is set to 50.

### CPU.v
CPU.v essentially links all other files in the simulated one-cycle CPU together. This file required slight modification from the provided file, with declaration of wires to connect all parts, such as the PC adder for calculating the next instruction (this is the only adder needed in the CPU file), or the I/O for the Control. They function as parameters for all declared modules.

### Control.v
Control naturally has one operation input, bits [6:0] of the current instruction. By default, RegWrite will be set to true, and the other two outputs (ALUOp_o and ALUSrc_o) will be toggled from Op_i. 

### Adder.v
This is perhaps the easiest to implement module; this half adder has two 32-bit input parameters which, when added together, form the 32-bit output (the address of the next instruction).

### PC.v
For control, naturally there is one input (the operation), and three outputs (ALUOp, ALUSrc, and RegWrite).

### Instruction_Memory.v
This CPU's instruction memory is 256 bits, and each 32-bit instruction is accessed based on its assigned 32-bit address.

### Registers.v
RSdata_o will be updated to the value of the register of address RSaddr_i, and likewise with RTdata_o/RTaddr_i. Activated asynchronously and when RegWrite is true (always true in this case), the register of the specified address in the input will be updated to the value of RDdata_i.

### MUX32.v
With three inputs, the select bit will determine whether data1 (Register Read Data 2) or data2 (Sign Extend output) is selected, and its output is sent to the CPU.

### MUX5.v
Unused

### Sign_Extend.v
This module is designed to extend the 12-bit input(data_i) into a 32-bit output(data_o). The extension is executed by copying the leftmost bit of data_i to the leftmost 20 bits of data_o [31:11], while also copying all bits of data_i to the right [11:0] bits.

### ALU.v
The ALU has two outputs; one is the zero output, and the other is the result of the operation performed. Operations for the two 32-bit inputs (data1_i and data2_i) are executed based on the value set from ALU_Control.

### ALU_Control.v
I set the operation codes to have the following values.
- and: 001
- or: 010
- add: 011
- sub: 100
- mul: 101
- addi: 110

- nop (default case): 000
- unused:111

----

## Other Files

### Instruction.txt
The input file containing all instructions

### Output.txt
The program will print the register value outputs after executing each instruction
