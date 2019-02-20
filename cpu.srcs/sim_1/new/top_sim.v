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
    reg clk, go;
    top TOP(
       .clkin(clk),
       .reset(0),
       .Go(go)
       );
    initial begin
        clk = 1;
        go = 0;
        #30960
        go = 1;
        #10
        go = 0;
    end   
 
    always #10 clk=~clk;
endmodule
