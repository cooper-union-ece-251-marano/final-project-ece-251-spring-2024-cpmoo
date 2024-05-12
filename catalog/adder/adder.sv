//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Stephen Brockerhoff & Abduhla Ali
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER
`timescale 1ns/100ps

module adder (
	input logic [15:0] a, 
	input logic [15:0] b, 
    output logic [15:0] sum
	);
	
	assign sum = a + b;

endmodule

`endif
