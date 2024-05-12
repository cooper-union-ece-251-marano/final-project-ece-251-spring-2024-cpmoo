//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: computer
//     Description: 32-bit RISC
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef COMPUTER
`define COMPUTER
`timescale 1ns/100ps

`include "../cpu/cpu.sv"
`include "../imem/imem.sv"
`include "../dmem/dmem.sv"

module computer (
    input logic clk, rst,
    output logic [15:0] writeData, address,
    output logic memWrite
    );
    logic [15:0] instruction, readData, pc;

    cpu moo(
        clk,
        rst,
        instruction,
        readData,
        memWrite,
        address,
        writeData,
        pc
    );
    imem imem(
        pc[5:1],
        instruction
    );
    dmem dmem(
        clk,
        memWrite,
        address,
        writeData,
        readData
    );
endmodule

`endif
