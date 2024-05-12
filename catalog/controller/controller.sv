//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: controller
//     Description: 16-bit RISC-based CPU controller (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef CONTROLLER
`define CONTROLLER
`timescale 1ns/100ps

`include "../maindec/maindec.sv"

module controller (
    input logic [3:0] op,
    input logic zero,
    output logic regWrite, memWrite, pcSrc,
    output logic [1:0] regDst, memToReg, jump, aluSrc,
    output logic [2:0] aluCtrl
    );


    logic branch;
    maindec mainDecoder(
        op,
        regWrite,
        branch,
        memWrite,
        regDst,
        memToReg,
        jump,
        aluSrc,
        aluCtrl
        );
    assign pcSrc = branch & zero;
endmodule

`endif // CONTROLLER
