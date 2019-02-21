`timescale 1ns / 1ps
//ͳ����Ϣ��ʾģ�� by ʷ����

/*��ģ�������źž�Ϊ1��Ч*/

//���룺
//clk:��·���ʼʱ���ź�
//clk_N:��Ƶ��cpuʱ���ź�
//pause:��ͣ�����źţ���Ӱ����ʾ��
//reset:��0�ź�

/*��������ת*/


/*��������֧��ת*/


//select:�����Ϣ�����ź�

//�����
//display:�߶�������ʾ�������ź�
//AN:�߶�������ʾ��ѡ���ź�




module Information_display(clk,clk_N,reset,clock_counter_en,unconditional_branch_counter_en,conditional_branch_counter_en,select,display,AN  );
      input clk;
      input clk_N;
      input reset;
  
      input clock_counter_en;    
      input unconditional_branch_counter_en;
      input conditional_branch_counter_en;


      
      input [2:0]select;  
      output reg [7:0]display;
      output reg [7:0]AN;

reg [3:0] decimalism_number[7:0];//ʮ������ʾ
wire [2:0]devide;
reg [31:0] number;  


wire [31:0]cycle_number;
wire [31:0]unconditional_branch_number;
wire [31:0]conditional_branch_number;







always @(posedge clk)begin
 decimalism_number[0]=number&32'h0000000f;
 decimalism_number[1]=(number&32'h000000f0)>>4;
 decimalism_number[2]=(number&32'h00000f00)>>8;
 decimalism_number[3]=(number&32'h0000f000)>>12;
 decimalism_number[4]=(number&32'h000f0000)>>16;
 decimalism_number[5]=(number&32'h00f00000)>>20;
 decimalism_number[6]=(number&32'h0f000000)>>24;
 decimalism_number[7]=(number&32'hf0000000)>>28;
 end

  
                      
 always @(posedge clk) begin  //����ź�ѡ��
    case(select)
      3'h0: begin number=cycle_number; end
      3'h1: begin number=unconditional_branch_number; end
      3'h2: begin number=conditional_branch_number; end
      3'h3:begin end
    default:  number=0;
 endcase
 end
  
 always @(posedge clk) begin
    case(devide) 
    3'h0:begin
         AN=8'b01111111;
          case(decimalism_number[7])
              0: begin display = 8'h3f; end
              1: begin display = 8'h06; end
              2: begin display = 8'h5b; end
              3: begin display = 8'h4f; end
              4: begin display = 8'h66; end
              5: begin display = 8'h6d; end
              6: begin display = 8'h7d; end
              7: begin display = 8'h07; end
              8: begin display = 8'h7f; end
              9: begin display = 8'h6f; end
              10:begin display =8'b01110111;end//A
              11:begin display=8'b01111100;end//B
              12:begin display=8'b00111001;end//C
              13:begin display=8'b01011110;end
              14:begin display=8'b01111001;end
              15:begin display=8'b01110001; end
              default:  display = 8'h00;
           endcase
           end
       
     3'h1:begin
                AN=8'b10111111;
                 case(decimalism_number[6])
                     0: begin display = 8'h3f; end
                     1: begin display = 8'h06; end
                     2: begin display = 8'h5b; end
                     3: begin display = 8'h4f; end
                     4: begin display = 8'h66; end
                     5: begin display = 8'h6d; end
                     6: begin display = 8'h7d; end
                     7: begin display = 8'h07; end
                     8: begin display = 8'h7f; end
                     9: begin display = 8'h6f; end
                     10:begin display =8'b01110111;end//A
                     11:begin display=8'b01111100;end//B
                     12:begin display=8'b00111001;end//C
                     13:begin display=8'b01011110;end
                     14:begin display=8'b01111001;end
                     15:begin display=8'b01110001; end             
                     default:  display = 8'h00;
                  endcase
                  end      

     3'h2:begin
                AN=8'b11011111;
                 case(decimalism_number[5])
                     0: begin display = 8'h3f; end
                     1: begin display = 8'h06; end
                     2: begin display = 8'h5b; end
                     3: begin display = 8'h4f; end
                     4: begin display = 8'h66; end
                     5: begin display = 8'h6d; end
                     6: begin display = 8'h7d; end
                     7: begin display = 8'h07; end
                     8: begin display = 8'h7f; end
                     9: begin display = 8'h6f; end
                     10:begin display =8'b01110111;end//A
                     11:begin display=8'b01111100;end//B
                     12:begin display=8'b00111001;end//C
                     13:begin display=8'b01011110;end
                     14:begin display=8'b01111001;end
                     15:begin display=8'b01110001; end             
                     default:  display = 8'h00;
                  endcase
                  end   

     3'h3:begin
                AN=8'b11101111;
                 case(decimalism_number[4])
                     0: begin display = 8'h3f; end
                     1: begin display = 8'h06; end
                     2: begin display = 8'h5b; end
                     3: begin display = 8'h4f; end
                     4: begin display = 8'h66; end
                     5: begin display = 8'h6d; end
                     6: begin display = 8'h7d; end
                     7: begin display = 8'h07; end
                     8: begin display = 8'h7f; end
                     9: begin display = 8'h6f; end
                     10:begin display =8'b01110111;end//A
                     11:begin display=8'b01111100;end//B
                     12:begin display=8'b00111001;end//C
                     13:begin display=8'b01011110;end
                     14:begin display=8'b01111001;end
                     15:begin display=8'b01110001; end            
                     default:  display = 8'h00;
                  endcase
                  end 

     3'h4:begin
                AN=8'b11110111;
                 case(decimalism_number[3])
                     0: begin display = 8'h3f; end
                     1: begin display = 8'h06; end
                     2: begin display = 8'h5b; end
                     3: begin display = 8'h4f; end
                     4: begin display = 8'h66; end
                     5: begin display = 8'h6d; end
                     6: begin display = 8'h7d; end
                     7: begin display = 8'h07; end
                     8: begin display = 8'h7f; end
                     9: begin display = 8'h6f; end
                     10:begin display =8'b01110111;end//A
                     11:begin display=8'b01111100;end//B
                     12:begin display=8'b00111001;end//C
                     13:begin display=8'b01011110;end
                     14:begin display=8'b01111001;end
                     15:begin display=8'b01110001; end             
                     default:  display = 8'h00;
                  endcase
                  end                     
 
     3'h5:begin
                             AN=8'b11111011;
                              case(decimalism_number[2])
                                  0: begin display = 8'h3f; end
                                  1: begin display = 8'h06; end
                                  2: begin display = 8'h5b; end
                                  3: begin display = 8'h4f; end
                                  4: begin display = 8'h66; end
                                  5: begin display = 8'h6d; end
                                  6: begin display = 8'h7d; end
                                  7: begin display = 8'h07; end
                                  8: begin display = 8'h7f; end
                                  9: begin display = 8'h6f; end
                                  10:begin display =8'b01110111;end//A
                                  11:begin display=8'b01111100;end//B
                                  12:begin display=8'b00111001;end//C
                                  13:begin display=8'b01011110;end
                                  14:begin display=8'b01111001;end
                                  15:begin display=8'b01110001; end             
                                  default:  display = 8'h00;
                               endcase
                               end 

     3'h6:begin
                             AN=8'b11111101;
                              case(decimalism_number[1])
                                  0: begin display = 8'h3f; end
                                  1: begin display = 8'h06; end
                                  2: begin display = 8'h5b; end
                                  3: begin display = 8'h4f; end
                                  4: begin display = 8'h66; end
                                  5: begin display = 8'h6d; end
                                  6: begin display = 8'h7d; end
                                  7: begin display = 8'h07; end
                                  8: begin display = 8'h7f; end
                                  9: begin display = 8'h6f; end
                                  10:begin display =8'b01110111;end//A
                                  11:begin display=8'b01111100;end//B
                                  12:begin display=8'b00111001;end//C
                                  13:begin display=8'b01011110;end
                                  14:begin display=8'b01111001;end
                                  15:begin display=8'b01110001; end                  
                                  default:  display = 8'h00;
                               endcase
                               end

     3'h7:begin
                             AN=8'b11111110;
                              case(decimalism_number[0])
                                  0: begin display = 8'h3f; end
                                  1: begin display = 8'h06; end
                                  2: begin display = 8'h5b; end
                                  3: begin display = 8'h4f; end
                                  4: begin display = 8'h66; end
                                  5: begin display = 8'h6d; end
                                  6: begin display = 8'h7d; end
                                  7: begin display = 8'h07; end
                                  8: begin display = 8'h7f; end
                                  9: begin display = 8'h6f; end
                                  10:begin display =8'b01110111;end//A
                                  11:begin display=8'b01111100;end//B
                                  12:begin display=8'b00111001;end//C
                                  13:begin display=8'b01011110;end
                                  14:begin display=8'b01111001;end
                                  15:begin display=8'b01110001; end                
                                  default:  display = 8'h00;
                               endcase
                               end                               
       default:
       AN=8'b11111111;  
       endcase
       end
    
  
 eight_devide devide_1(clk,devide);
 Cycle_counter  counter(clk_N,clock_counter_en,unconditional_branch_counter_en,conditional_branch_counter_en,reset,cycle_number,unconditional_branch_number,conditional_branch_number );

    
 
    
endmodule
