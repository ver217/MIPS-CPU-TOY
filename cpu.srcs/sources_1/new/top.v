module top(
    input clk_native, 
    input reset,
    input Go,
	input show_clock_count,
	input show_unconditional_branch_count,
	input show_conditional_branch_count,
	input show_mem,
	input key_up,
	input key_down,
	input[4:0] level,
	output reg[7:0] AN,
    output reg[7:0] seg
    );
	reg [31:0] pc, add4, cnt;
	wire branch;
	wire [31:0] inst;
	wire [31:0] jmpMux, branchMux, jrMux, aluSrcMux, signedExtMux, memToRegMux, jalMux1;
	wire [4:0] sysMux, dispMux, regDstMux, jalMux;
	// wire for controller
	wire memToReg, memWrite, aluSrc, regWrite, syscall, signedExt, regDst, beq, bne, jr, jmp, jal, blez, sb;
	wire [3:0] aluOp;
	// wire for alu
	wire equal, bleZero;
	wire [31:0] aluRes;
	// wire for rom
	wire [31:0] memOut;
	// wire for register
	wire [31:0] r1, r2;
	// wire for ext
	wire [31:0] signedExted;
	wire [31:0] zeroExted;
	wire [31:0] data;
    wire en;
    wire [7:0] pause_AN;
    wire [7:0] pause_seg;

	wire [7:0] counter_AN;
    wire [7:0] counter_seg;

	wire [7:0] mem_AN;
    wire [7:0] mem_seg;

	wire clk_N;
	

    initial begin
        pc <= 0;
        add4 <= 4;
        cnt <= 0;
    end
	always @(posedge clk_N)
		begin
			if(!reset) begin
			    if (en) begin
                    pc = jmpMux;
                    add4  =  pc + 4;
                    cnt <= cnt + 1;
				end
			end
		else	begin
			pc <= 32'b0;
			add4 <= 32'h4;
			cnt <= 0;
		end
	end
	
	ctr mainctr(
		.inst(inst),
		.memToReg(memToReg),
		.memWrite(memWrite),
		.aluSrc(aluSrc),
		.regWrite(regWrite),
		.syscall(syscall),
		.signedExt(signedExt),
		.regDst(regDst),
		.beq(beq),
		.bne(bne),
		.jr(jr),
		.jmp(jmp),
		.jal(jal),
		.aluOp(aluOp),
		.blez(blez),
		.sb(sb)
	);
	
	alu alu(
		.x(r1),
		.y(aluSrcMux),
		.aluOp(aluOp),
		.shamt(inst[10:6]),
		.result(aluRes),
		.equal(equal),
		.bleZero(bleZero)
	);

	wire[31:0] address_display;
	wire[31:0] data_out_display;

	up_down_ctr up_down_ctr(
		.clk_native(clk_native),
		.key_up(key_up),
		.key_down(key_down),
		.address(address_display)
	);

	Display show_mem_display(
		.reset(reset),
		.clk(clk_native),
		.data(data_out_display),
		.seg(mem_seg),
		.AN(mem_AN)
	);
	
	ram dmem(
		.address(aluRes),
		.__address_display(address_display),
		.data_in(r2),
		.clk(clk_N),
		.WE(memWrite),
		.reset(reset),
		.mode({1'b0, sb}),
		.data_out(memOut),
		.__data_out_display(data_out_display)
	);

	rom imem(
		.address(pc), 
		.data_out(inst)
	 );

	regFile regfile(
		.RsAddr(sysMux),
		.RtAddr(dispMux),
		.clk(clk_N), 
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

	wire display;

	pause pause(
             .clk(clk_N),
             .sys_clk(clk_native),
             .syscall(syscall),
             .r1(r1),
             .reset(reset),
             .r2(r2),
             .en(en),
			 .display(display),
             .Go(Go),
             .AN(pause_AN),
             .seg(pause_seg)
      );


	reg[2:0] select = 0;

	always @(
		show_clock_count,
		show_unconditional_branch_count,
		show_conditional_branch_count,
		show_mem,
		reset
	) begin
		casez ({
			show_mem,
			show_conditional_branch_count,
			show_unconditional_branch_count,
			show_clock_count
		})
			4'b1ZZZ: select = 3;
			4'b01ZZ: select = 2;
			4'b001Z: select = 1;
			4'b0001: select = 0;
			4'b0000: select = 4;
			default: select = 3'b111;
		endcase
		
		if (reset) select = 3'b111;
	end

	always @(
	   select,
	   counter_AN,
	   counter_seg,
	   mem_AN,
	   mem_seg,
	   pause_AN,
	   pause_seg
    ) begin
		if (select == 0 || select == 1 || select == 2) begin
			AN = counter_AN;
			seg = ~counter_seg;
		end else if (select == 3) begin
			AN = mem_AN;
			seg = mem_seg;
		end else if (select == 4) begin
			AN = pause_AN;
			seg = pause_seg;
		end else begin
			AN = 8'hff;
			seg = 8'hff;
		end
	end

	Information_display info(
		.clk(clk_native),
		.clk_N(clk_N),
      	.reset(reset),
		.conditional_branch_counter_en(branch & en),
		
		.unconditional_branch_counter_en(jmp & en),
		.clock_counter_en(en),
		.select(select),
		.display(counter_seg),
		.AN(counter_AN)
	);
	
	var_f_divider var_f_divider(
	   .clk_native(clk_native),
	   .level(level),
	   .clk_out(clk_N)
	);

	assign branch = (beq & equal) | (bne & (~equal)) | (blez & bleZero);
	assign jmpMux = jmp ? jrMux : branchMux;
	assign branchMux = branch ? (signedExted << 2) + add4 : add4;
	assign jrMux = jr ? r1 : {add4[31:28], inst[25:0], 2'b00};
	assign aluSrcMux = aluSrc ? signedExtMux : r2;
	assign signedExtMux = signedExt ? signedExted : zeroExted;
	assign memToRegMux = memToReg ? memOut : aluRes;
	assign jalMux1 = jal ? add4 : memToRegMux;
	assign sysMux = syscall ? 2 : inst[25:21];
	assign dispMux = display ? 4 : inst[20:16];
	assign regDstMux = regDst ? inst[15:11] : inst[20:16];
	assign jalMux = jal ? 31 : regDstMux;
endmodule
