//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Stephen Brockerhoff & Abduhla Ali
// 
//     Create Date: 2023-02-07
//     Module Name: aludec
//     Description: 16-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aludec(input logic [3:0] opcode,
              output logic [2:0] aluop);

  always @(*)
      case(opcode)
          4'b0000: aluop <= 3'b010;  // add
          4'b0001: aluop <= 3'b110;  // sub
          4'b0010: aluop <= 3'b000;  // and
          4'b0011: aluop <= 3'b001;  // or
          4'b0100: aluop <= 3'b010;  // move
          4'b0101: aluop <= 3'b010;  // jr
          4'b0110: aluop <= 3'b010;  // sll
          4'b0111: aluop <= 3'b010;  // srl
          4'b1000: aluop <= 3'b111;  // slt 
          4'b1001: aluop <= 3'b010;  // addi
          4'b1010: aluop <= 3'b110;  // subi 
          4'b1011: aluop <= 3'b110;  // beq 
          4'b1100: aluop <= 3'b010;  // lw 
          4'b1101: aluop <= 3'b010;  // sw 
          4'b1110: aluop <= 3'b010;  // j 
          4'b1111: aluop <= 3'b010;  // jal
    endcase
endmodule


`endif // ALUDEC
