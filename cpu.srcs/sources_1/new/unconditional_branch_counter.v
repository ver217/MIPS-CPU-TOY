`timescale 1ns / 1ps
//��������֧��ת���� -by ʷ������ja||jal||jmpΪ1��Ч

module unconditional_branch_counter(
input clk,
input pause,
input reset,
input jr,
input jal,
input jmp,
output reg [31:0]unconditional_branch_number
    );
    
    initial begin
    unconditional_branch_number=0;
    end
    
    always@(posedge clk)begin
    if(pause==1) unconditional_branch_number=unconditional_branch_number;
    else if(reset==1) unconditional_branch_number=0;
    else 
    if((jr==1)||(jal==1)||(jmp==1))
    unconditional_branch_number=unconditional_branch_number+1;
    else unconditional_branch_number=unconditional_branch_number;
    end
endmodule
