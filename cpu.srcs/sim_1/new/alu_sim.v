`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 18:43:45
// Design Name: 
// Module Name: alu_sim
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


module alu_sim(

    );
    reg [31:0] x, y;
    reg [3:0] aluOp;
    reg [4:0] shamt;
    wire [31:0] res;
    wire equal;
    alu alu(x, y, aluOp, shamt, res, equal);
    initial begin
        shamt = 0;
        aluOp = 4'b1011;
        x = -1;
        y = 1;
        #10
        y = -2;
        #10
        y = -1;
        #10
        y = 1;
        #10
        x = 1;
        #10
        x = 2;
        #10
        y = -1;
    end
endmodule
