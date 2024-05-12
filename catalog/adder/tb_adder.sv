//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Stephen Brockerhoff & Abduhla Ali
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`include "./adder.sv"

module adder_tb();
    logic [15:0] a;
    logic [15:0] b;
    logic [15:0] result;

    reg clk, reset; //reset for initializing testvectors

    logic [47:0] testvectors[0:3];
    logic [47:0] tmp;
    integer vectornum, errors;
    logic [15:0] expectedResult;


    adder uut (
             .a(a),
             .b(b),
             .result(result)
    );

    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, uut);
    end

    initial begin
        $readmemh("adder_tb.tv", testvectors);
        vectornum = 0;
        errors = 0;
        reset = 1; #27; reset = 0;
    end

    always @(posedge clk) begin
        #1; tmp = testvectors[vectornum];

        a = tmp[47:32];
        b = tmp[31:16];

        expectedResult = tmp[15:0];
    end

    always @(negedge clk) begin
        #1;
        if (~reset) begin
            if (result !== expectedResult) begin
                $display("Error:\tinputs: a = %h, b=%h", a, b);
                $display("\tresult = %h, expectedResult = %h", result, expectedResult);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 48'hx) begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
    end


endmodule
