`timescale 1ns / 1ps
//条件分支跳转计数

module conditional_branch_counter(
input clk,
input pause,
input reset,
input beq,
input bne,
input equal,
output reg [31:0]conditional_branch_number
    );
    
    initial begin
    conditional_branch_number=0;
    end
    
    always@(posedge clk)begin
    if(pause==1) conditional_branch_number=conditional_branch_number;
    else if(reset==1) conditional_branch_number=0;
    else 
    if(((beq==1)&&(equal==1))||((bne==1)&&(equal!=1)))
    conditional_branch_number=conditional_branch_number+1;
    else conditional_branch_number=conditional_branch_number;
    end
endmodule
