`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 20:10:01
// Design Name: 
// Module Name: blk_mem_sim
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


module blk_mem_sim();
    reg clk = 0;
    reg pc[11:0] = 0;
    wire[31:0] inst;
    blk_mem_gen_0 rom(
	       .clka(clk),
	       .ena(1),
	       .addra(pc),
	       .douta(inst)
	 );
	 
	 always #10 clk=~clk;
	 always #10 pc = pc + 4;
endmodule
