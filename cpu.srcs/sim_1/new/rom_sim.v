`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 09:18:10
// Design Name: 
// Module Name: rom_sim
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


module rom_sim();
    wire[31:0] inst;
    reg[31:0] pc = 0;
    rom ROM(    
        .address(pc), 
        .data_out(inst)
    );
    
    
    always #10 pc = pc + 4;
endmodule
