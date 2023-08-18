`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2023 12:45:08 PM
// Design Name: 
// Module Name: top_RSA
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


module top_RSA#(
    parameter n = 6)(
    input clk, start,
    input [n-1 : 0] KEY, BASE, N,
    output [n-1 : 0] RESULT
    );
    
    wire counter_done, mux_sel;
    counter# (.n(n)) C(
        .clk(clk),
        .reset_n(start),
        .key(KEY),
        .counter_done(counter_done),
        .mux_sel(mux_sel)
    );
    
    wire [2*n - 1 : 0] mult_out;
    wire [n-1 : 0] ram_out;
    multiplier#(.n(n)) M(
        .clk(clk),
        .in1(BASE),
        .in2(mux_sel? ram_out : BASE),
        .mult_out(mult_out)
    );
    
    modulo_BRAM#(.n(n)) RAM(
        .clk(clk),
        .N(N),
        .mult_out(mult_out),
        .ram_out(ram_out)
    );
    
    register_file#(.n(n)) RF(
        .clk(clk),
        .counter_done(counter_done),
        .ram_out(ram_out),
        .reg_out(RESULT)
    );
endmodule
