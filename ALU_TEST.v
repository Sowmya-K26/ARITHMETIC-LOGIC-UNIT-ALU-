`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 12:41:07
// Design Name: 
// Module Name: ALU_TEST
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


module ALU_TEST;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;
    
    // Outputs
    wire [7:0] out;
    wire zero_flag;
    
    // Instantiate the ALU
    ALU uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .out(out),
        .zero_flag(zero_flag)
    );
    
    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        opcode = 0;
        
        // Monitor changes
        $monitor("Time=%0t A=%h B=%h opcode=%b out=%h zero_flag=%b", 
                 $time, A, B, opcode, out, zero_flag);
        
        // Test cases
        // Test ADD
        #10 A = 8'h05; B = 8'h03; opcode = 3'b000;
        #10 if (out !== 8'h08) $display("ADD test failed");
        
        // Test SUB
        #10 A = 8'h0A; B = 8'h03; opcode = 3'b001;
        #10 if (out !== 8'h07) $display("SUB test failed");
        
        // Test AND
        #10 A = 8'h0F; B = 8'hF0; opcode = 3'b010;
        #10 if (out !== 8'h00) $display("AND test failed");
        
        // Test OR
        #10 A = 8'h0F; B = 8'hF0; opcode = 3'b011;
        #10 if (out !== 8'hFF) $display("OR test failed");
        
        // Test NOT
        #10 A = 8'hAA; B = 8'h00; opcode = 3'b100;
        #10 if (out !== 8'h55) $display("NOT test failed");
        
        // Test zero flag
        #10 A = 8'h00; B = 8'h00; opcode = 3'b000;
        #10 if (zero_flag !== 1'b1) $display("Zero flag test failed");
        
        #10 $display("ALU tests completed");
        #10 $finish;
    end

endmodule
