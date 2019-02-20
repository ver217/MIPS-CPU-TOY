module regFile(
    input clk,
    input reset,
    input [31:0] regWriteData,
    input [4:0] regWriteAddr,
    input regWriteEn,
    output [31:0] RsData,
    output [31:0] RtData,
    input [4:0] RsAddr,
    input [4:0] RtAddr
    );
	reg [31:0] regs [0:31];
	assign RsData = (RsAddr == 5'b0) ? 32'b0 : regs[RsAddr];
	assign RtData = (RtAddr == 5'b0) ? 32'b0 : regs[RtAddr];
	integer i;
	initial begin
	   for (i = 0; i < 32; i = i + 1)
            regs[i] <= 0;
    end
	always @(negedge clk) begin
		if (!reset)	begin
			if (regWriteEn == 1)
				regs[regWriteAddr] <= regWriteData;
		end
		else	begin
			for (i = 0; i < 32; i = i + 1)
				regs[i] <= 0;
		end
	end
endmodule
