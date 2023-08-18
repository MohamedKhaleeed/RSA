`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2023 01:22:36 PM
// Design Name: 
// Module Name: top_RSA_tb
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


module top_RSA_tb();
    parameter n = 6;
    reg clk, start;
    reg [n-1 : 0] KEY, N, BASE;
    wire [n-1 : 0] RESULT;
    
    top_RSA#(.n(n)) dut(
        .clk(clk),
        .start(start),
        .KEY(KEY),
        .BASE(BASE),
        .N(N),
        .RESULT(RESULT)
    );
    
    localparam T = 10;
    always begin
        clk = 1'b0;
        #(T/2) 
        clk = 1'b1;
        #(T/2);
    end
    
    initial begin
        start = 0;
        BASE = 3;
        KEY = 15;
        N = 2;
        #3
        start = 1;
        #400 
        
        start = 0;
        #3
        BASE = 50;
        KEY = 6;
        N = 35;
        start = 1;
        #400
        $finish;
    end
endmodule
