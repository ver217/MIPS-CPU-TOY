`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 21:22:16
// Design Name: 
// Module Name: ram_sim
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


module ram_sim();
    reg[31:0] addr = 0;
    reg[31:0] data_in = 32'h0000_6161;
    wire[31:0] data_out;
    reg clk = 0;
    reg reset = 0;
    ram RAM(
        .address(addr),
        .data_in(data_in),
        .clk(clk),
        .WE(1),
        .reset(reset),
        .mode(0),
        .data_out(data_out)
    );
    

    always #10 clk=~clk;
    always #100 data_in = data_in + 1;
    
    initial begin
        #100
        addr = addr + 1;
        
        #100
        addr = addr + 1;
        
        #100
        addr = addr + 1;
        
        #100
        addr = addr + 1;
        
        #100
        addr = addr + 1;
        
        #100
        addr = addr + 1;
        
        #100
        addr = addr + 1;
        
        #500
        reset = 1;
        
        #100
        addr = addr + 1;
    end
    

endmodule
