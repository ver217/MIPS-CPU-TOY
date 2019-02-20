`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/18 16:28:26
// Design Name: 
// Module Name: mem
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


module ram(
    input [31:0] address,
    input [31:0] data_in,
    input [1:0] mode, // word or byte or halfword (0 / 1 / 2)
    input WE,
    input clk,
    input reset,
    output [31:0]data_out
    );
    
    parameter SIZE = 4096;
    reg[31:0] mem[0:SIZE - 1];


    
//    mem[address[11:2]] >> (address[1:0] << 3) & 32h'000f;

    assign data_out = 
        mode == 0
            ? mem[address[11:2]]
            : mode == 1 
                ? (mem[address[11:2]] >> {address[1:0], 3'b000}) & 32'h0000_00ff
                : (mem[address[11:2]] >> {address[1], 4'b0000}) & 32'h0000_ffff;

            // : mode == 0 
            //     ? address[1:0] == 0
            //         ? {24'b0, [31:24]}
            //         : address[1:0] == 1 
            //             ? {24'b0, mem[address[11:2]][23:16]}
            //             : address[1:0] == 2
            //                 ? {24'b0, mem[address[11:2]][15:8]}
            //                 : address[1:0] == 3
            //                     ? {24'b0, mem[address[11:2]][7:0]}
            //                     : 32'b1;
            //     :32'b0;
    integer i;
    initial begin
        for (i = 0; i < SIZE; i = i + 1) mem[i] <= 0;
    end
    always @(negedge clk) begin
        if (WE) begin
            if (mode == 0)
                mem[address[11:2]] = data_in;
            else if (mode == 1)
                // if (address[1:0] == 0)
                //     mem[address[11:2]] = {data_in[7:0], mem[address[11:2]][23:0]};
                // else if (address[1:0] == 1)
                //     mem[address[11:2]] = {mem[address[11:2]][31:24], data_in[7:0], mem[address[11:2]][15:0]};
                // else if (address[1:0] == 2)
                //     mem[address[11:2]] = {mem[address[11:2]][31:16], data_in[7:0], mem[address[11:2]][7:0]};
                // else if (address[1:0] == 3)
                //     mem[address[11:2]] = {mem[address[11:2]][31:8], data_in[7:0]};
                mem[address[11:2]] = (data_in[7:0] << {address[1:0], 3'b000}) | (mem[address[11:2]] & ~(32'h0000_00ff << {address[1:0], 3'b000}));
            else
                mem[address[11:2]] = (data_in[15:0] << {address[1], 4'b0000}) | (mem[address[11:2]] & ~(32'h0000_ffff << {address[1], 4'b0000}));
        end
        
        if (reset) begin
            for (i = 0; i < SIZE; i = i + 1) mem[i] <= 0;
        end
    end
endmodule
