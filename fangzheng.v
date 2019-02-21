`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/21 09:28:03
// Design Name: 
// Module Name: fangzheng
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


module fangzheng();
    reg clk;
    reg[3:0]key;
    wire clk_out1;
    wire clk_out2;
    wire clk_out3;
    wire clk_out4;
    clk_div_S clk_div_S(key,clk,rst,clk_out1,clk_out2,clk_out3,clk_out4);
    initial begin
    clk=0;
    key=4'b0000;
    #100 key=4'b0001;
    #200 key=4'b0010;
    #200 key=4'b0100;
    #200 key=4'b1000;
    end
    always #10 clk=~clk;
endmodule