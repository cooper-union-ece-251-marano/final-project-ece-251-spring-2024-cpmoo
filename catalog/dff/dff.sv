//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: dff
//     Description: 16 bit D flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DFF
`define DFF
`timescale 1ns/100ps

module dff (
	input logic, reset, clk, 
	input logic [15:0] d,
	output reg [15:0] q
	);

	always @(posedge clk, posedge reset) begin
		if (reset)
			q <= 15'b0;
		else
			q <= d;
	end

endmodule

`endif
