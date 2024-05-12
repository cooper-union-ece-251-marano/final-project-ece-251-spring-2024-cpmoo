//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_computer
//     Description: Test bench for a single-cycle MIPS computer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`include "./computer.sv"
`include "../clock/clock.sv"

module computer_tb();

    logic clk;
    logic clk_enable;
    logic rst;
    logic [15:0] writeData, address;
    logic memWrite;

    computer dut(.clk(clk), .rst(rst), .writeData(writeData), .address(address), .memWrite(memWrite));
    clock dut1(.ENABLE(clk_enable), .CLOCK(clk));

    initial begin
        $dumpfile("computer.vcd");
        $dumpvars(0, dut);
    end

    initial begin
        #0 clk_enable <= 0; #50 rst <= 1; #50; rst <= 0; #50 clk_enable <= 1;
    end

    always @(negedge clk or posedge clk) begin
        if (memWrite) begin
            if (address === 0) begin
                $display("Address: %h", address);
                $display("Output (hex): %h", writeData);
                $display("Output (dec): %d", writeData);
                $finish();
            end
        end
    end

endmodule
