//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: mux2
//     Description: 2 to 1 multiplexer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MUX2
`define MUX2
`timescale 1ns/100ps

module mux2
    #(parameter n = 16) (
    input logic [(n-1):0] a, b,
    input logic s,
    output logic [(n-1):0] result
    );

    assign result = s ? b : a;

endmodule

`endif // MUX2
