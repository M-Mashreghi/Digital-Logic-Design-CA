`timescale 1ns/1ns
module bit_comparator_assign (input a,b,e,l,g, output E,L,G);

    assign #(46,62) L = (a < b) | ((a == b) & (l == 1'b1));
    assign #(53,55) G = (a > b) | ((a == b) & g);
    assign #(29,31) E = (a == b) & (e == 1'b1);    

endmodule