`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/21 09:41:42
// Design Name: 
// Module Name: up_down_ctr_sim
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


module up_down_ctr_sim();
    
    reg clk = 0;
    
    reg key_up = 0;
    reg key_down = 0;
    
    wire[31:0] addr;
    
    up_down_ctr up_down_ctr(
        .clk_native(clk),
        .key_up(key_up),
        .key_down(key_down),
        .address(addr)
    );
    
    initial begin
        #100
        key_up = 1;
        
        #100
        key_down = 1;
        
        #100
        key_up = 1;
        
        #100
        key_down = 1;
    
    end
    
    always #10 clk=~clk;

endmodule
