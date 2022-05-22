`timescale 1ns/1ns

module signed_comparator(input [15:0]a,b,input e,l,g, output E,L,G);
	wire [15:0]cc=a;
	wire [15:0]dd=b;
	assign cc=a;
	assign dd=b;
	assign cc[15]= ~a[15];
	assign dd[15]= ~b[15];
    assign #(736,992) L = (cc < dd) | ((cc == dd) & (l == 1'b1));
    assign #(848,880) G = (cc > dd) | ((cc == dd) & g);
    assign #(464,496) E = (cc == dd) & (e == 1'b1); 
endmodule
