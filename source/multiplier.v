`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 11:35:06 PM
// Design Name: 
// Module Name: multiplier
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


(* USE_DSP="yes" *)module multiplier#(
    parameter n = 6)(
    input clk,
    input [n-1 : 0] in1, in2,
    output reg [2*n - 1 : 0] mult_out
    );
    
    always@(posedge clk)begin
        mult_out <= in1 * in2;
    end
endmodule
