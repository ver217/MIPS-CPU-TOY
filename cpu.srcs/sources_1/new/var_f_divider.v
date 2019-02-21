`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/21 11:18:44
// Design Name: 
// Module Name: var_f_divider
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


module var_f_divider(
    input clk_native,
    input [4:0] level,
    output reg clk_out = 1
    );
    wire[31:0] d;
    reg [31:0] cnt;

    assign d  = 32'hFFFF_FFFF >> level;
    initial begin
        cnt = 0;
        clk_out = 1;
    end
    always @(posedge clk_native) begin
        cnt = cnt + 1;
        if(cnt >= d) begin
            clk_out = ~clk_out;
            cnt = 0;
        end
    end
endmodule
