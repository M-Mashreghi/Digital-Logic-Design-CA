`timescale 1ns/1ns
module DRlatch(input clc, D, R, output Q, Qb);
  wire  j[3: 0] ;  wire Rb;
    nand #8 t1 (j[3], D, Rb);
    not #6 n1 (j[2], j[3]);
    not #6 n2 (Rb, R);
    nand #12 t2 (j [0], j[2], Rb, clc);
    nand #8 t3 (j [1], j [0], clc);
    nand #8 t4 (Q, Qb, j [0]);
    nand #12 t5 (Qb, Q, j [1], Rb);
endmodule
