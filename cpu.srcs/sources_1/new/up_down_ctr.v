`timescale 1ns / 1ps

module up_down_ctr(
    input clk_native,
    input key_up,
    input key_down,
    output reg[31:0] address = 0
    );

    initial address = 0;

    reg[15:0] debounce_up_reg = 0;
    reg[15:0] debounce_down_reg = 0;

    always @(
        key_up,
        key_down,
        debounce_up_reg,
        debounce_down_reg,
        address,
        clk_native
    ) begin
        if (debounce_up_reg > 0) begin
            debounce_up_reg = debounce_up_reg - 1;
        end
    
        if (debounce_down_reg > 0) begin
            debounce_down_reg = debounce_down_reg - 1;
        end
        
        if(
            key_up &&
            debounce_up_reg == 0 &&
            0 <= address <= 4092
        ) begin
            address = address + 4;
            debounce_up_reg = 16'hFFFF;
        end

        if(
            key_down &&
            debounce_down_reg == 0 &&
            4 <= address <= 4096
        ) begin
            address = address - 4;
            debounce_down_reg = 16'hFFFF;
        end
    end
endmodule
