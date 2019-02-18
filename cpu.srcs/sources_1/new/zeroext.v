`timescale 1ns / 1ps

module zeroext(
    input [15:0] inst,
    output [31:0] data
    );
	assign data = {16'h0000, inst};
endmodule
