`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 16:28:26
// Design Name: 
// Module Name: mem
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


module ram(
    input [0:31] address,
    input [0:31] data_in,
    input WE,
    input clk,
    output [0:31] data_out
    );
    
    reg[31:0] mem[0:4095];
    
    assign data_out = mem[address];
    
    always @(negedge clk) begin
        if (WE) begin
            mem[address] = data_in;
        end
     end
endmodule
