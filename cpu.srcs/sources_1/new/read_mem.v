`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 19:50:47
// Design Name: 
// Module Name: read_mem
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

module up_done(key_up,key_done,address);
    output reg [31:0]address;
    input key_up;
    input key_done;
    initial begin
        address=0;
        end
       always@(key_up or key_done)
       begin
        if(key_up && (0<=address<=4092))begin
            address=address+4;
        end
        if(key_done && (4<=address<=4096))begin
            address=address-4;
        end
       end
endmodule
