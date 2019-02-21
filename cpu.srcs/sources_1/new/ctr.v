module ctr(
    input [31:0] inst,
    output reg memToReg,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite,
	output reg syscall,
	output reg signedExt,
    output reg regDst,
    output reg beq,
    output reg bne,
    output reg bgtz,
    output reg jr,
    output reg jmp,
    output reg jal,
	output reg [1:0] mem_mode,
    output reg [3:0] aluOp
    );

	always @(inst)	begin
		case (inst[31:26])	// op
			0:	begin	// R type
				case (inst[5:0])	// inst[5:0]
					0: aluOp <= 0; // sll
					4: aluOp <= 0; // sllv
					3: aluOp <= 1; // sra
					2: aluOp <= 2; // srl
					32: aluOp <= 5; // add
					33: aluOp <= 5; // addu
					34: aluOp <= 6; // sub
					36: aluOp <= 7; // and
					37: aluOp <= 8; // or
					39: aluOp <= 10; // nor
					42: aluOp <= 11; // slt
					43: aluOp <= 12; // sltu
					38: aluOp <= 9; // xor
				endcase
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= (inst[5:0] == 8 || inst[5:0] == 12) ? 0 : 1;
				syscall <= (inst[5:0] == 12) ? 1 : 0;
				signedExt <= 0;
				regDst <= (inst[5:0] == 8 || inst[5:0] == 12) ? 0 : 1;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= (inst[5:0] == 8) ? 1 : 0;
				jmp <= (inst[5:0] == 8) ? 1 : 0;
				jal <= 0;
				mem_mode <= 0;
			end
			2: begin	// j
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= 0;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 1;
				jal <= 0;	
				mem_mode <= 0;
			end
			3: begin	// jal
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 1;
				jal <= 1;	
				mem_mode <= 0;
			end
			4: begin	// beq
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= 0;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 1;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				mem_mode <= 0;
			end
			5: begin	// bne
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= 0;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 1;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;
				mem_mode <= 0;
			end
			7: begin	// bgtz
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= 0;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 1;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				mem_mode <= 0;
			end
			8: begin	// addi
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 1;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 5;
				mem_mode <= 0;
			end
			12: begin	// andi
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 7;
				mem_mode <= 0;
			end
			9: begin	// addiu
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 1;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 5;
				mem_mode <= 0;
			end
			10: begin	// slti
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 1;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 11;
				mem_mode <= 0;
			end
			13: begin	// ori
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 8;
				mem_mode <= 0;
			end
			35: begin	// lw
				memToReg <= 1;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 1;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 5;
				mem_mode <= 0;
			end
			6'b100101: begin // lh
				memToReg <= 1;
				memWrite <= 0;
				aluSrc <= 1;
				regWrite <= 1;
				syscall <= 0;
				signedExt <= 1;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 5;
				mem_mode <= 2;
			end
			43: begin	// sw
				memToReg <= 0;
				memWrite <= 1;
				aluSrc <= 1;
				regWrite <= 0;
				syscall <= 0;
				signedExt <= 1;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;	
				aluOp <= 5;
				mem_mode <= 0;
			end
			default: begin
				aluOp = 0;
				memToReg <= 0;
				memWrite <= 0;
				aluSrc <= 0;
				regWrite <= 0;
				syscall <= 0;
				signedExt <= 0;
				regDst <= 0;
				beq <= 0;
				bne <= 0;
				bgtz <= 0;
				jr <= 0;
				jmp <= 0;
				jal <= 0;
				mem_mode <= 0;
			end
		endcase
	end
endmodule
