`timescale 1ns/1ns
module D_latch (input clc,D , output Q,Qb);
	wire j[1:0];
	nand #8 t1(j[0],D,clc);
	nand #8 t2(j[1],j[0],clc);
	nand #8 t3(Q,Qb,j[0]);
	nand #8 t4(Qb,Q,j[1]);
endmodule



