`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 11:34:23 PM
// Design Name: 
// Module Name: counter
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


module counter#(
    parameter n = 6)(
    input clk, reset_n,
    input [n-1 : 0] key,
    output reg mux_sel,
    output counter_done
    );
    
    reg [n-1 : 0] counts;
    always@(posedge clk, negedge reset_n)begin
        if(~reset_n)begin
            counts <= 'b0;
            mux_sel = 1'b0;
        end
        else begin
            counts <= counts + 1;
            mux_sel <= 1'b1;
        end
    end
    assign counter_done = (counts == (key-1'b1)*2);
endmodule
