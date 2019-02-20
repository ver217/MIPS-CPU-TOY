`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 20:22:01
// Design Name: 
// Module Name: pause
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

module divider(clk, ck);
    input clk;          // 系统时钟
    output reg ck;      // 分频后的时钟
    parameter dely  = 500_00; // 时钟计数值，频率？？
    reg [31:0] cnt;
    initial begin
    cnt=0;
    ck=0;
    end
    always @(posedge clk) begin
      cnt=cnt+1;
     if(cnt==dely) begin
        ck=~ck;
        cnt=0;
      end
    end
endmodule
//3-8译码�?
module decoder3_8(num, sel);  
       input [2: 0] num;            // 数码管编号：0~7
       output reg  [7:0] sel;       // 7段数码管片�?�信号，低电平有�?
       always @(num) begin
          case(num)
              0:  sel[7:0] = 8'b01111111;//�?1个数码管�?
              1:  sel[7:0] = 8'b10111111;//�?2个数码管�?
              2:  sel[7:0] = 8'b11011111;//�?3个数码管�?
              3:  sel[7:0] = 8'b11101111;//�?4个数码管�?
              4:  sel[7:0] = 8'b11110111;//�?5个数码管�?
              5:  sel[7:0] = 8'b11111011;//�?6个数码管�?
              6:  sel[7:0] = 8'b11111101;//�?7个数码管�?
              7:  sel[7:0] = 8'b11111110;//�?8个数码管�?
              default: sel[7:0] = 8'b11111111;
         endcase
     end
endmodule

module pattern(SW, SG);
       input [3:0] SW;       // 16进制数字�?4位二进制编码
       output reg [7:0] SG;       // 7段数码管驱动，低电平有效
       always @(SW[3:0])
         case(SW[3:0])
            0 : SG[7:0]=8'b11000000;//数字0
            1 : SG[7:0]=8'b11111001;
			3 : SG[7:0]=8'b10110000;
      2 : SG[7:0]=8'b10100100;
			4 : SG[7:0]=8'b10011001;
            5 : SG[7:0]=8'b10010010; 
			6 : SG[7:0]=8'b10000010;
			7 : SG[7:0]=8'b11111000;
			8 : SG[7:0]=8'b10000000;
			9 : SG[7:0]=8'b10010000;
            10 : SG[7:0]=8'b10001000;//A
            11 : SG[7:0]=8'b10000011;//B
            12 : SG[7:0]=8'b11000110;//C
            13 : SG[7:0]=8'b10100001;
            14 : SG[7:0]=8'b10000110;
            15 : SG[7:0]=8'b10001110;                                         
            default:SG[7:0]=8'b11111111;
         endcase
endmodule 

//display数码管显示模�?
module Display(reset,clk,data,seg, AN);//数码管显示模�?
       input reset,clk;
       input [31:0] data;//显示的数�?
       output [7:0] seg;
       output [7:0] AN;     
	   reg [3:0] data32_4;     //数字和字母HELLO的数字的4位二进制编码
       reg [2:0] num;     //数码管编号：0~7    
       wire ck;          // 分频后的时钟     
	   initial  begin
           num=0;
           data32_4=0;//计数   
           end
       divider u_divider(clk, ck);//实例化分频器 
       always @(posedge ck) 
	    begin//上升�? 
        num=num+1; 
        if(num==8)
           num=0;	    
		 if(!reset) 
		  begin
			case(num)
			   7 : data32_4=data[3:0];
			   6 : data32_4=data[7:4];
			   5 : data32_4=data[11:8];
			   4 : data32_4=data[15:12];
			   3 : data32_4=data[19:16];
			   2 : data32_4=data[23:20];
			   1 : data32_4=data[27:24];
			   0 : data32_4=data[31:28];
               default : data32_4=0;
            endcase 
		  end
		 else 
		  begin
			case(num)
			   0 : data32_4=0;
			   1 : data32_4=0;
			   2 : data32_4=0;
			   3 : data32_4=0;
			   4 : data32_4=0;
			   5 : data32_4=0;
			   6 : data32_4=0;
			   7 : data32_4=0;
               default : data32_4=0;
            endcase
		  end
        end  
        decoder3_8 u_decoder3_8(num,AN);//数码�?
        pattern u_pattern(data32_4,seg);                     
endmodule

module pause(clk,syscall,r1,reset,r2,data,en,Go,AN,seg);
        input clk;
        input syscall,reset,Go;
        input [31:0]r1;
        input [31:0]r2;
        output [31:0]data;
        output en;
        output [7:0]AN;
        output [7:0]seg;
        wire s1;
        assign s1=(r1==34)?1:0;
        assign en=(~((~Go)&syscall&(~s1)));
        assign data=(s1&syscall)?r2:0;
        Display u_Display(reset,clk,data,seg, AN);

endmodule
