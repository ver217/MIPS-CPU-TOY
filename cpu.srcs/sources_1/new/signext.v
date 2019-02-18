module signext(
    input [15:0] inst,
    output [31:0] data
    );
	assign data = inst[15:15] ? {16'hffff, inst} : {16'h0000, inst};
endmodule
