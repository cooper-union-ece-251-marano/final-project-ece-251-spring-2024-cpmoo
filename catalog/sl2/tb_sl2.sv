//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_sl2
//     Description: Test bench for shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`include "./sl2.sv"

module sl2_tb();
    logic [15:0] in;
    logic [15:0] out;

    reg clk, reset; //reset for initializing testvectors

    logic [31:0] testvectors[0:1000];
    logic [31:0] tmp;
    integer vectornum, errors;
    logic [15:0] expectedOut;


    sl2 uut (
             .in(in),
             .out(out)
    );

    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        $dumpfile("sl2.vcd");
        $dumpvars(0, uut);
    end

    initial begin
        $readmemh("sl2_tb.tv", testvectors);
        vectornum = 0;
        errors = 0;
        reset = 1; #27; reset = 0;
    end

    always @(posedge clk) begin
        #1; tmp = testvectors[vectornum];

        in = tmp[31:16];

        expectedOut = tmp[15:0];
    end

    always @(negedge clk) begin
        #1;
        if (~reset) begin
            if (out !== expectedOut) begin
                $display("Error:\tinputs: in = %h", in);
                $display("\tout = %h, expectedOut = %h", out, expectedOut);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 32'hx) begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
    end


endmodule
