`timescale 1ns/1ns
module MSRR8_Q10_tb();
 logic sIn=1 , clc=0 , R=0;
 logic [1:0]mode;
 wire[7:0]Q_gate , Q_assign;
MSRR8_Q8  CUT1(clc, R, sIn, mode, Q_gate);
MSRR8_Q10  CUT2(clc, R, sIn, mode, Q_assign);
 always #250 clc = ~clc;
 initial begin
  #30
  #200 sIn=1;
  repeat(10) #600 mode = 11 ;

  repeat(20) #600 mode = $random ;
  #200 sIn=0;
  repeat(20) #600 mode = $random ;
    #200 sIn=1;
  repeat(20) #600 mode = $random ;
  #200 sIn=0;
  repeat(20) #600 mode = $random ;
  #1000 $stop;
 end
endmodule


