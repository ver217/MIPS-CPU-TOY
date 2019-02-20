`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 16:34:07
// Design Name: 
// Module Name: rom
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


module show_mem(
    input [31:0] address,
    output [31:0] data_out
    );
    
    initial begin

    end

    assign data_out = mem[address[11:2]];
endmodule
