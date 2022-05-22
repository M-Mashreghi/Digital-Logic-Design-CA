`timescale 1ns/1ns

module quad_comparator_assign(input [3:0]a,b,input e,l,g, output E,L,G);
    assign #(184,248) L = (a < b) | ((a == b) & (l == 1'b1));
    assign #(212,220) G = (a > b) | ((a == b) & g);
    assign #(116,124) E = (a == b) & (e == 1'b1); 
endmodule
