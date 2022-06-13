`timescale 1ns/1ns
module D_latch_tb();
    logic D=1, clc=1 ;
    wire Qb,Q;

    D_latch cut(clc , D , Q, Qb);

    always #100 clc=~clc;

    initial begin
      #40
       repeat(40) #60 D=~D;
       #100 $stop;
    end


endmodule