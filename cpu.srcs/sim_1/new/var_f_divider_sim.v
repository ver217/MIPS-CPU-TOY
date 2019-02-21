`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/21 14:20:54
// Design Name: 
// Module Name: var_f_divider_sim
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


module var_f_divider_sim();
    
    wire clk_out;
    reg clk = 0;

    var_f_divider var_f_divider(
        .clk_native(clk),
        .level(5'b11110),
        .clk_out(clk_out)
    );
    
    always #1 clk=~clk;
endmodule
