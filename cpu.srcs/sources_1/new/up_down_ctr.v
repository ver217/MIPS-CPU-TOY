`timescale 1ns / 1ps

module up_down_ctr(
    input clk_native,
    input key_up,
    input key_down,
    output reg[31:0] address
    );
    wire key_up_done, key_down_done;
    anti_shake as1(clk_native, key_up, key_up_done);
    anti_shake as2(clk_native, key_down, key_down_done);
    initial address = 0;

    always @(posedge clk_native) begin
        if (key_down_done) begin
            address = address > 4091 ? address : address + 4;
        end
        if(key_up_done) begin
            address = address > 3 ? address - 4 : address;
        end
    end
endmodule
