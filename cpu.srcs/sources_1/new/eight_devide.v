`timescale 1ns / 1ps
//Æß¶ÎÏÔÊ¾Æ÷É¨ÃèÄ£¿é by Ê·¿­²¨
module eight_devide(clk,devide);
 input clk;
 output reg [2:0]devide;
 
 reg [31:0]count;
 reg clk_M;
initial begin
count=0;
devide=3'h0;
clk_M=0;
end
 
always @ (posedge clk) begin
    count = count + 1;
    if(count > 50000)  begin
        clk_M = ~clk_M;
        count = 0;
    end
end 
 
   
always @(posedge clk_M)  begin    // Ê±ÖÓÉÏÉıÑØ     
	devide=devide+1;
	end
endmodule
