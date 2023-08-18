`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 11:36:19 PM
// Design Name: 
// Module Name: modulo_BRAM
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


module modulo_BRAM#(
    parameter n = 6)(
    input clk,
    input [n-1 : 0] N,
    input [2*n - 1 : 0] mult_out,
    output [n-1 : 0] ram_out
    );
    
    (*rom_style = "block"*)reg [n-1 : 0] BRAM [0 : 2**(3*n) - 2**(2*n)- 1];
    reg [n-1 : 0]Q_reg;
    
    initial
        $readmemb("BRAM_content.mem",BRAM);
        
    always@(posedge clk)begin
        Q_reg <= BRAM[{N-1, mult_out}];
    end
    
    assign ram_out = Q_reg;
endmodule
