`timescale 1ns/1ns
module DRlatch_tb ();
logic clc = 1,D = 1,R = 0;
wire Q, Qb;
DRlatch CUT (clc, D, R, Q, Qb);
always # 90 clc = ~clc;
initial begin
    #100 
    repeat (10) # 65 D = ~D;
    # 200 R = 1;
    repeat (3)# 120 D = ~D;
    # 200 R = 0;
    repeat (10) # 65 D = ~D;
    # 200 $stop;
end endmodule
