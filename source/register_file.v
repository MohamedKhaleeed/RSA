`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2023 12:39:00 PM
// Design Name: 
// Module Name: register_file
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


module register_file#(
    parameter n = 6)(
    input clk,
    input counter_done,
    input [n-1 :0] ram_out,
    output reg [n-1 : 0] reg_out
    );
    always@(posedge clk)begin
        if(counter_done)
            reg_out = ram_out;
    end
endmodule
