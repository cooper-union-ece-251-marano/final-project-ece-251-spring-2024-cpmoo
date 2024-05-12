//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: cpu
//     Description: 16-bit RISC-based CPU (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef Moo_CPU
`define Moo_CPU
`timescale 1ns/100ps

`include "../datapath/datapath.sv"
`include "../controller/controller.sv"

module moo_cpu (
    input logic clk, rst,
    input logic [15:0] instruction, readData,
    output logic memWrite,
    output logic [15:0] aluResult, memWriteData, pc
    );
    logic zero, regWrite, pcSrc;
    logic [1:0] regDst, memToReg, jump, aluSrc;
    logic [2:0] aluCtrl;

    controller moo_controller(
        instruction[15:12],
        zero,
        regWrite,
        memWrite,
        pcSrc,
        regDst,
        memToReg,
        jump,
        aluSrc,
        aluCtrl
        );
    datapath moo_dataPath(
        clk,
        rst,
        regWrite,
        pcSrc,
        regDst,
        memToReg,
        jump,
        aluSrc,
        aluCtrl,
        instruction,
        readData,
        aluResult,
        memWriteData,
        pc,
        zero
        );
endmodule

`endif
