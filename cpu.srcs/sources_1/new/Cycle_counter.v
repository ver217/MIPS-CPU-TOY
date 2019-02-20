`timescale 1ns / 1ps
//周期计数 by 史凯波

module Cycle_counter(
input clk,
input pause,
input reset,
output reg [31:0]cycle_number
    );

initial begin
cycle_number=0;
end

always@(posedge clk)begin
if(pause==1) cycle_number=cycle_number;
else if(reset==1) cycle_number=0;
else cycle_number=cycle_number+1;
end

endmodule
