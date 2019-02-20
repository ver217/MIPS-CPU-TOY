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
    reg clk = 1;
    reg Go = 0;
    wire[7:0] AN;
    wire[7:0] seg;
    top TOP(
        .clk_native(clk),
        .reset(0),
        .Go(Go),
        .show_clock_count(0),
        .show_unconditional_branch_count(0),
        .show_conditional_branch_count(0),
        .show_mem(0),
        .show_syscall(1),
        .AN(AN),
        .seg(seg)
       );
    
    initial begin
        clk = 1;
        #30000
        Go = 1;
        #300
        Go = 0;
    end
 
    always #1 clk=~clk;
endmodule
