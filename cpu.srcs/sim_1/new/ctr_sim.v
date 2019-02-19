`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 10:48:52
// Design Name: 
// Module Name: ctr_sim
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


module ctr_sim(

    );
    wire memToReg, memWrite, aluSrc, regWrite, syscall, signedExt, regDst, beq, bne, jr, jmp, jal;
    wire [3:0] aluOp;
    reg [31:0] inst = 32'hae300000;
    ctr ctr(inst, memToReg, memWrite, aluSrc, regWrite, syscall, signedExt, regDst, beq, bne, jr, jmp, jal, aluOp);
endmodule
