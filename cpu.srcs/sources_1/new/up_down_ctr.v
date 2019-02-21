`timescale 1ns / 1ps

module up_down_ctr(
    input clk_native,
    input key_up,
    input key_down,
    output reg[31:0] address
    );
    wire key_up_done, key_down_done;
    anti_shake as1(clk_native, key_up, key_up_done);
    anti_shake as2(clk_nativek, key_down, key_down_done);
    initial address = 0;

//    reg[15:0] debounce_up_reg = 0;
//    reg[15:0] debounce_down_reg = 0;

    always @(
//        key_up,
//        key_down,
//        debounce_up_reg,
//        debounce_down_reg,
//        address,
        clk_native
    ) begin
//        if (debounce_up_reg > 0) begin
//            debounce_up_reg = debounce_up_reg - 1;
//        end
    
//        if (debounce_down_reg > 0) begin
//            debounce_down_reg = debounce_down_reg - 1;
//        end
        
        if(
            key_up_done/* &&
            debounce_up_reg == 0*/
        ) begin
            address = address > 4091 ? address : address + 4;
//            debounce_up_reg = 16'hFFFF;
        end

        if(
            key_down_done /*&&
            debounce_down_reg == 0*/
        ) begin
            address = address > 3 ? address - 4 : address;
//            debounce_down_reg = 16'hFFFF;
        end
    end
endmodule
