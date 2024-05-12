//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: imem
//     Description: 16-bit RISC memory (instruction "text" segment)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef IMEM
`define IMEM
`timescale 1ns/100ps

module imem (
    input logic [4:0] address,
    output logic [15:0] instruction
    );

    logic [15:0] RAM[31:0];

    initial begin
        $readmemh("imem_datafile.dat", RAM);
    end

    assign instruction = RAM[address];

endmodule

`endif

