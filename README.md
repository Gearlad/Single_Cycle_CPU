# Single Cycle CPU
### Seth Austin Harding	|	韓哈斯	｜	B06902101

## CA HW3: Verilog Implementation
Verilog implementation of a single cycle CPU, including a driver module, a CPU module (connecting all other modules), control, adder, PC, instruction memory, registers, mux32, mux5, sign extend, ALU, and ALU control modules.

-----

## Verilog Files

### Testbench.v

- The main 'driver' file for this implementation is the provided *testbench.v*. This file is responsible for initializing both the instruction memory and the register file to default 32-bit binary zero values, also handling resets, starting and ending the simulation, and accessing input (instruction.txt) and writing (output.txt) files.
- CYCLE_TIME, defined in the pre-compiler, is set to 50, meaning that
- 

### CPU.v

- CPU.v essentially links all other files in the simulated one-cycle CPU together. This file required slight modification from the provided file, with declaration of wires to connect all parts, such as the PC adder for calculating the next instruction (this is the only adder needed in the CPU file), or the I/O for the Control. They function as parameters for all declared modules.

### Control.v

- 

### Adder.v

- This is perhaps the easiest to implement module; this half adder has two 32-bit input parameters which, when added together, form the 32-bit output (the address of the next instruction).

### PC.v

- For control, naturally there is one input (the operation), and three outputs (ALUOp, ALUSrc, and RegWrite).

### Instruction_Memory.v

### Registers.v

### MUX32.v

### MUX5.v

### Sign_Extend.v

### ALU.v

### ALU_Control.v

----

## Other Files

### Instruction.txt

### Output.txt

