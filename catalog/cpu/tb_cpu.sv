//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Stephen Brockerhoff & Abduhla Ali
// 
//     Create Date: 2023-02-07
//     Module Name: tb_cpu
//     Description: Test bench for cpu
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`include "./cpu.sv"

module tb_cpu();
    logic rst;
    logic [15:0] instruction, readData;

    logic memWrite;
    logic [15:0] aluResult, memWriteData, pc;

    reg clk, reset; //reset for initializing testvectors

    logic [87:0] testvectors[0:1000];
    logic [87:0] tmp;
    integer vectornum, errors;

    //expected
    logic expectedMemWrite;
    logic [15:0] expectedAluResult, expectedMemWriteData, expectedPc;

    cpu uut (
             .clk(clk),
             .rst(rst),
             .instruction(instruction),
             .readData(readData),
             .memWrite(memWrite),
             .aluResult(aluResult),
             .memWriteData(memWriteData),
             .pc(pc)
    );

    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        $dumpfile("tb_cpu_cpu.vcd");
        $dumpvars(0, uut);
    end

    initial begin
        $readmemh("tb_cpu_tb.tv", testvectors);
        vectornum = 0;
        errors = 0;
        reset = 1; #27; reset = 0;
    end

    always @(posedge clk) begin
        tmp = testvectors[vectornum];

        rst = tmp[84];
        instruction = tmp[83:68];
        readData = tmp[67:52];
        expectedMemWrite = tmp[51:48];
        expectedAluResult = tmp[47:32];
        expectedMemWriteData = tmp[31:16];
        expectedPc = tmp[15:0];

    end

    always @(negedge clk) begin
        if (~reset) begin
            if ({memWrite, aluResult, memWriteData, pc} !== {expectedMemWrite, expectedAluResult, expectedMemWriteData, expectedPc}) begin
                $display("Error:\tinputs: {rst, instruction, readData} = %b %b %b", rst, instruction, readData);
                $display("\tmemWrite= %h, expectedMemWrite = %h", memWrite, expectedMemWrite);
                $display("\taluResult = %h, expectedAluResult = %h", aluResult, expectedAluResult);
                $display("\tmemWriteData = %h, expectedMemWriteData = %h", memWriteData, expectedMemWriteData);
                $display("\tpc = %h, expectedPc = %h", pc, expectedPc);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 88'hx) begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
    end


endmodule
