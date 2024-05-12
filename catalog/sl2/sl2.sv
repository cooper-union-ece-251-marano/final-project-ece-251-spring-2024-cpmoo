//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: sl2
//     Description: shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SL2
`define SL2
`timescale 1ns/100ps

module sl2 (
	input logic [15:0] in,
	output logic [15:0] out
	);

	always @(*) begin
		out <= in << 2;
	end

endmodule
`endif
