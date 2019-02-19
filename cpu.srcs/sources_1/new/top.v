module top(
    input clkin, 
    input reset
    );
	reg[31:0] pc = 0, add4 = 4;
	wire branch;
	wire [31:0] inst;
	wire [31:0] jmpMux, branchMux, jrMux, aluSrcMux, signedExtMux, memToRegMux, jalMux1;
	wire [4:0] sysMux, dispMux, regDstMux, jalMux;
	// wire for controller
	wire memToReg, memWrite, aluSrc, regWrite, syscall, signedExt, regDst, beq, bne, jr, jmp, jal;
	wire [3:0] aluOp;
	// wire for alu
	wire equal;
	wire [31:0] aluRes;
	// wire for rom
	wire [31:0] memOut;
	// wire for register
	wire [31:0] r1, r2;
	// wire for ext
	wire [31:0] signedExted;
	wire [31:0] zeroExted;
	
	always @(negedge clkin)
		begin
			if(!reset) begin
				pc = jmpMux;
				add4  =  pc+4;
			end
		else	begin
			pc = 32'b0;
			add4 = 32'h4;
		end
	end
	
	ctr mainctr(
		inst,
		memToReg,
		memWrite,
		aluSrc,
		regWrite,
		syscall,
		signedExt,
		regDst,
		beq,
		bne,
		jr,
		jmp,
		jal,
		aluOp
	);
	
	alu alu(
		.x(r1),
		.y(aluSrcMux),
		.aluOp(aluOp),
		.shamt(inst[10:6]),
		.result(aluRes),
		.equal(equal)
	);
	
	ram dmem(
		.address(aluRes),
		.data_in(r2),
		.clk(clkin),
		.WE(memWrite),
		.reset(reset),
		.mode(0),
		.data_out(memOut)
	);

//	rom imem(
//		.address(pc), 
////		.clk(clkin), 
//		.data_out(inst)
//	 );
	 
	 blk_mem_gen_0 rom(
	       .clka(clkin),
	       .ena(1),
	       .addra(pc[11:0] >> 2),
	       .douta(inst)
	 );

	regFile regfile(
		.RsAddr(sysMux),
		.RtAddr(dispMux),
		.clk(clkin), 
		.reset(reset), 
		.regWriteAddr(jalMux), 
		.regWriteData(jalMux1), 
		.regWriteEn(regWrite),
		.RsData(r1),
		.RtData(r2)
	);
	
	signext signext(
		.inst(inst[15:0]),
		.data(signedExted)
	 );

	zeroext zeroext(
		.inst(inst[15:0]),
		.data(zeroExted)
	);
	assign branch = (beq & equal) | (bne & (~equal));
	assign jmpMux = jmp ? jrMux : branchMux;
	assign branchMux = branch ? (signedExted << 2) + add4 : add4;
	assign jrMux = jr ? r1 : {add4[31:28], inst[25:0], 2'b00};
	assign aluSrcMux = aluSrc ? signedExtMux : r2;
	assign signedExtMux = signedExt ? signedExted : zeroExted;
	assign memToRegMux = memToReg ? memOut : aluRes;
	assign jalMux1 = jal ? add4 : memToRegMux;
	assign sysMux = syscall ? 2 : inst[25:21];
	assign dispMux = inst[20:16];
	assign regDstMux = regDst ? inst[15:11] : inst[20:16];
	assign jalMux = jal ? 31 : regDstMux;
endmodule
