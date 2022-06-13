`timescale 1ns/1ns
module multiplexer4 (input a0, al, a2, a3, input [1: 0] s , output w);
 assign w = s == 2'b00 ?  a0:
            s == 2'b01 ?  al:
            s == 2'b10 ?  a2:
            s == 2'b11 ?  a3: 1'bx;
endmodule

module MSRR8_Q8(input clc, R, sIn, input [1: 0] mode, output [7: 0] Q);
    wire [7: 0] muxin_00, muxin_01, muxin_10, muxin_11, muxop, Qb;
    genvar k;
    generate;
      for (k = 0; k <8; k = k + 1) begin
           multiplexer4 muxx (muxin_00[k], muxin_01[k], muxin_10[k], muxin_11[k], mode, muxop[k]);
           Dfilpflop DD (clc, muxop[k], R, Q[k], Qb[k]);

           assign muxin_00[k] = Q[k];

           assign muxin_01[k]= k == 7 ?  Q[0]: Q[k + 1];

           assign muxin_10[k] = k == 7 ?  Q[1]:
                                k == 6 ?  Q[0]: Q[k + 2];

           assign muxin_11[k] = k == 7 ?  sIn: Q [k + 1];
      end
    endgenerate
endmodule

