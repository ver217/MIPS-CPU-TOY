`timescale 1ns / 1ps


module anti_shake(
    input CLK,
    input key_in,
    output key_out
    );

    reg key_en, prev_en;
    always @(posedge CLK) begin
        key_en <= key_in;
        prev_en <= key_en;
    end

    assign key_out = prev_en & (~key_en);
endmodule
