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
    input reset,
    output [0:31] data_out
    );
    
    parameter SIZE = 4096;
    reg[31:0] mem[0:SIZE - 1];
    
    assign data_out = mem[address];
    integer i;
    
    always @(negedge clk) begin
        if (WE) begin
            mem[address] = data_in;
        end
        
        if (reset) begin
            for (i = 0; i < SIZE; i = i + 1) mem[i] <= 0;
        end
    end
endmodule
