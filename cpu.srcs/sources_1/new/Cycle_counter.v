`timescale 1ns / 1ps
//周期计数 by 史凯波

module Cycle_counter(
input clk,
input clock_counter_en,
input unconditional_branch_counter_en,
input conditional_branch_counter_en,
input reset,
output reg [31:0] cycle_number,
output reg [31:0] unconditional_branch_number,
output reg [31:0] conditional_branch_number
 );

initial begin
cycle_number=0;
unconditional_branch_number=0;
conditional_branch_number=0;
end

always@(posedge clk)begin
    if(reset==1) begin 
        cycle_number=0;
        unconditional_branch_number=0;
        conditional_branch_number=0;
    end else begin
        if(clock_counter_en==1) cycle_number<=cycle_number+1;
        if(unconditional_branch_counter_en==1) begin unconditional_branch_number<=unconditional_branch_number+1;end
        if(conditional_branch_counter_en==1) begin conditional_branch_number<=conditional_branch_number+1;end
    end
end

endmodule
