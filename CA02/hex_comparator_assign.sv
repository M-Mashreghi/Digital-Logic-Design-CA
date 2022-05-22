`timescale 1ns/1ns

module hex_comparator_assign(input [3:0][3:0]a,b,input e,l,g, output E,L,G);
    assign #(736,992) L = (a < b) | ((a == b) & (l == 1'b1));
    assign #(848,880) G = (a > b) | ((a == b) & g);
    assign #(464,496) E = (a == b) & (e == 1'b1); 
endmodule
