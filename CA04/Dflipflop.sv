`timescale 1ns/1ns
module  Dfilpflop(input clc,D, R, output Q, Qb);
wire Rb, Dj, Q1, Qb1, clcb;
not #6 n1(Rb, R);
not #6 n2 (clcb, clc);
and #14 A1 (Dj, Rb, D);
D_latch p1(clc, Dj,  Q1, Qb1);
D_latch p2(clcb, Q1,  Q, Qb);
endmodule