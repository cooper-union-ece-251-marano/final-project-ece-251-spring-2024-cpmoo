# ECE251 Final Project Report

## Stephen Brockerhoff and Abduhla Ali

Special Thanks to Professor Marano for his guidance and support throughout the semester.

### Description

In this project, we implemented a 16-bit RISC Single Cycle CPU. This CPU has Von Neumann architecture and is implemented with verilog. The following components are utilized in the making of the CPU: adder,alu, aludec, clock, computer, controller, cpu, datapath, dff, dmem, imem, maindec, mux2, regfile, signext, and sl2.


## Instruction Specs:

![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-cpmoo/assets/162063986/e5d1a7e6-c46e-4419-a14e-0eb64338c6fe)

![image (2)](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-cpmoo/assets/162063986/f0484201-a2c6-47b4-ab22-bc9f001e7585)


Our CPU has 16 instructions from the MIPS architecture set. The first 4 bits are the opcode. The following 3 groups of 4 bits are the input/output registers, used for R, I, and J type instructions.

### Functions
![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-cpmoo/assets/162063986/78033a0d-2a82-4a3c-bf93-d5d1fbcfc8fe)

### Registers
![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-cpmoo/assets/162063986/9d7e02c7-1494-4f30-a3fa-d69fdb3c2ae8)

## CPU Design:

![IMG_0070](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-cpmoo/assets/162063986/ef902ee9-75e6-427a-ac46-108631bd7127)
16-bit MIPS-based Single Cycle CPU

## Control Signals:

![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-cpmoo/assets/162063986/d6d163c4-ee1d-4ca5-8fb2-70014f87a445)
Tthe control signals control how information travels within the CPU depending on the opcode supplied to the controller.

### Memory implementation
memory is split into dmem and imem

imem: Returns 16-bit instruction that is sent off to control unit when given the address specified by the PC

dmem: This is where memory is written. Utilized by sw and lw

When testing the computer in the testbench, we would expect to get fib(n) when inputing n. For example, fib(9)=34
