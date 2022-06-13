`timescale 1ns/1ns
module MSRR8_Q6_tb();
 logic sIn=1 , clc=0 , R=0;
 logic [1:0]mode;
 wire[7:0]Q;
MSRR8_Q5  CUT(clc, R, sIn, mode, Q);
 always #250 clc = ~clc;

 initial begin
  #30
  #200 sIn=1;
  repeat(8) #600 mode = $random ;
  #200 sIn=0;
  repeat(8) #600 mode = $random ;
    #200 sIn=1;
  repeat(8) #600 mode = $random ;
  #200 sIn=0;
  repeat(8) #600 mode = $random ;
  #1000 $stop;
 end


endmodule

