`timescale 1ns / 1ps
//ͳ����Ϣ��ʾģ�� by ʷ����
//���룺
//clk:��·���ʼʱ���ź�
//clk_N:��Ƶ��cpuʱ���ź�
//pause:��ͣ�����źţ���Ӱ����ʾ��
//reset:��0�ź�
//select:�����Ϣ�����ź�

//�����
//display:�߶�������ʾ�������ź�
//AN:�߶�������ʾ��ѡ���ź�


module Information_display(clk,clk_N,pause,reset,select,display,AN  );
      input clk;
      input clk_N;
      input pause;
      input reset;
      input [2:0]select;  
      output reg [7:0]display;
      output reg [7:0]AN;

wire [3:0] decimalism_number[2:0];//ʮ������ʾ
wire [2:0]devide;
reg [31:0] number;  


wire [31:0]cycle_number;

      assign
      decimalism_number[0]=number%10,
      decimalism_number[1]=(number/10)%10,
      decimalism_number[2]=(number/100)%10,
      decimalism_number[3]=(number/1000)%10,
      decimalism_number[4]=(number/10000)%10,
      decimalism_number[5]=(number/100000)%10,
      decimalism_number[6]=(number/1000000)%10,
      decimalism_number[7]=(number/10000000)%10;  
                      
 always @(posedge clk) begin  //����ź�ѡ��
    case(select)
      3'h0: begin number=cycle_number; end
      3'h1: begin end
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
                                  default:  display = 8'h00;
                               endcase
                               end                               
       default:
       AN=8'b11111111;  
       endcase
       end
    
  
 eight_devide devide_1(clk,devide);
 Cycle_counter  counter_1(clk_N,pause,reset,cycle_number );


    
 
    
endmodule
