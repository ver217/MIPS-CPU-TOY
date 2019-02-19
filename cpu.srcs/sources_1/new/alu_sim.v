`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 09:10:56
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
    wire [31:0] result;
    wire equal;
    reg clk = 0;
    alu alu(x, y, aluOp, shamt, result, equal);
    always #10 clk=~clk;
    initial begin
        x = 0;
        y = 0;
        aluOp = 0;
        shamt = 0;
        #10
        x = 32'b1111_1100_0101_1001_1110_0100_0001_1010;
        shamt = 5;
        aluOp = 1;
        #10
        x = 7;
        aluOp = 11;
        #10
        aluOp = 12;
    end
    
endmodule
