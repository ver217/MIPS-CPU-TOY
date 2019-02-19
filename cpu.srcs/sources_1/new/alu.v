module alu(
    input [31:0] x,
    input [31:0] y,
    input [3:0] aluOp,
	input [4:0] shamt,
    output reg [31:0] result,
    output equal
    );
	always @(x or y or aluOp) begin
		case (aluOp)
			4'b0000:
				result = x << shamt;
			4'b0001:
				// result = ( { {31{x[31]}}, 1'b0 } << (~shamt) ) | ( x >> shamt );
				result = $signed(x) >>> shamt;
			4'b0010:
				result = x >> shamt;
			4'b0101:
				result = x + y;
			4'b0110:
				result = x - y;
			4'b0111:
				result = x & y;
			4'b1000:
				result = x | y;
			4'b1001:
				result = x ^ y;
			4'b1010:
				result = ~(x | y);
			4'b1011: begin
//				if (x[31] == 1 && y[31] == 0)
//					result = 32'b1;
//				else if (x[31] == 1 && y[31] == 1)
//					result = (x > y) ? 32'b1 : 32'b0;
//				else if (x[31] == 0 && y[31] == 1)
//					result = 32'b0;
//				else
//					result = (x < y) ? 32'b1 : 32'b0;
                result = $signed(x) < $signed(y) ? 32'b1 : 32'b0;
			end
			4'b1100: 
				result = (x < y) ? 32'b1 : 32'b0;
			default:
				result = 0;
		endcase
	end
	assign equal = (x == y);
endmodule
