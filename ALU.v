`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 12:38:25
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


 module ALU(
    input [7:0] A,          // 8-bit input A
    input [7:0] B,          // 8-bit input B
    input [2:0] opcode,     // 3-bit operation code
    output reg [7:0] out,   // 8-bit output
    output reg zero_flag    // Zero flag (1 when output is zero)
);

    // Operation codes
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND = 3'b010;
    parameter OR  = 3'b011;
    parameter NOT = 3'b100;

    always @(*) begin
        case(opcode)
            ADD: out = A + B;       // Addition
            SUB: out = A - B;       // Subtraction
            AND: out = A & B;       // Bitwise AND
            OR:  out = A | B;       // Bitwise OR
            NOT: out = ~A;           // Bitwise NOT (uses only A)
            default: out = 8'b0;    // Default output (zero)
        endcase
        
        // Set zero flag if output is zero
        zero_flag = (out == 8'b0) ? 1'b1 : 1'b0;
    end

endmodule
