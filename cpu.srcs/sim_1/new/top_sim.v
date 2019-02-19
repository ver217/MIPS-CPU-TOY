`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 09:46:24
// Design Name: 
// Module Name: top_sim
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


module top_sim();
    reg clk = 0;
    reg reset = 0;
    reg[31:0] clk_count = 0;
    top TOP(
       .clkin(clk),
       .reset(0)
       );
       
    always @(posedge clk) clk_count = clk_count + 1;
 
    always #10 clk=~clk;
endmodule
