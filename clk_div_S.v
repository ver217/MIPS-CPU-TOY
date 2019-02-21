`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/21 09:26:50
// Design Name: 
// Module Name: clk_div_S
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


module clk_div_S(
	input [3:0]key,
    input clk,
    input rst,
    output reg clk_out1 = 0,
    output reg clk_out2 = 0,
    output reg clk_out3 = 0,
    output reg clk_out4 = 0
    );
	parameter N1 =2 ;
	parameter N2 =4 ;
	parameter N3 =6 ;
	parameter N4 =8 ;
	reg [31:0]counter;
	initial begin
	counter=0;
	end
	always @(posedge clk or posedge rst or key) begin
		case(key)
		4'b0001:	if (rst) begin
					// reset
						counter <= 0;
					end
					else if (counter == N1-1) begin
						counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end
		4'b0010:	if (rst) begin
					// reset
						counter <= 0;
					end
					else if (counter == N2-1) begin
						counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end
		4'b0100:	if (rst) begin
					// reset
						counter <= 0;
					end
					else if (counter == N3-1) begin
						counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end
		4'b1000:	if (rst) begin
					// reset
						counter <= 0;
					end
					else if (counter == N4-1) begin
						counter <= 0;
					end
					else begin
						counter <= counter + 1;
					end		
		endcase
	end

	always @(posedge clk or posedge rst or key) begin
		case(key)
		4'b0001	:	if (rst) begin
					// reset
						clk_out1 <= 0;
					end
					else if (counter == N1-1) begin
						clk_out1 <= !clk_out1;
					end
		4'b0010:	if (rst) begin
					// reset
						clk_out2 <= 0;
					end
					else if (counter == N2-1) begin
						clk_out2 <= !clk_out2;
					end		
		4'b0100:	if (rst) begin
					// reset
						clk_out3 <= 0;
					end
					else if (counter == N3-1) begin
						clk_out3 <= !clk_out3;
					end
		4'b1000:	if (rst) begin
					// reset
						clk_out4 <= 0;
					end
					else if (counter == N4-1) begin
						clk_out4 <= !clk_out4;
					end
		endcase
	end
endmodule
