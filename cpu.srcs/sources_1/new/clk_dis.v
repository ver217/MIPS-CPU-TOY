`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 19:14:25
// Design Name: 
// Module Name: clk_dis
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


module clk_dis(clk,rst,clk_out);
    input clk;
    input rst;
    output reg clk_out = 0;//∑÷∆µ∫Û ±÷”
    parameter N=4;
    reg[7:0]counter;
    initial begin
        clk_out = 1;
        counter = 0;
    end
    always@(posedge clk) 
    begin
        if(rst)begin
            counter<=0;
            clk_out<=0;
        end
        else if(counter==N-1)begin
            counter<=0;
            clk_out<=!clk_out;
        end
        else begin
            counter<=counter+1;
        end
    end
    
endmodule
