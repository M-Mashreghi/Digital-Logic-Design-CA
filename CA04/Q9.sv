`timescale 1ns/1ns
module dff_sync_rst (input R, clk, d,  output reg Q,output  Qb);
    always @(negedge clk)
     begin
          if (R) Q <= 1'b0;
          else Q <= d;
     end
   assign Qb = ~ Q;
endmodule
