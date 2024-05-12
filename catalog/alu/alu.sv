//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Stephen Brockerhoff & Abduhla Ali
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 16-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU

module alu (
    input logic [15:0] a, b,
    input logic [2:0] ctrl,
    output logic [15:0] res,
    output logic zero
    );
    
    `define alu_ctrl_and 3'b000
    `define alu_ctrl_or  3'b001
    `define alu_ctrl_add 3'b010
    `define alu_ctrl_sll 3'b011
    `define alu_ctrl_nor 3'b100
    `define alu_ctrl_srl 3'b101
    `define alu_ctrl_sub 3'b110
    `define alu_ctrl_slt 3'b111
    
    always @* begin
    case (ctrl)
        `alu_ctrl_and: res <= a & b;     
        `alu_ctrl_or : res <= a | b;     
        `alu_ctrl_add: res <= a + b;     
        `alu_ctrl_sll: res <= a << b;   
        `alu_ctrl_nor: res <= ~(a | b);  
        `alu_ctrl_srl: res <= a >> b;    
        `alu_ctrl_sub: res <= a - b;     
        `alu_ctrl_slt: begin                
            if (a[15] != b[15])
                res <= (a[15] > b[15]);
            else
                res <= (a < b);
        end
        default: res <= 0;
    endcase
end

endmodule

`endif // ALU

