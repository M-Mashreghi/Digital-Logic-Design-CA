`timescale 1ns/1ns
module hex_comparator(input [3:0][3:0]a,b,input e,l,g, output E,L,G);

	wire gg[4:0];
	wire ee[4:0];
	wire ll[4:0];
	assign l=0;
	assign g=0;
	assign e=1;
	assign ll[0]=l;
	assign gg[0]=g;
	assign ee[0]=e;
	genvar k;
		generate
 		      for(k=0;k<4;k=k+1) begin : game
 		      quad_comparator_assign  t1(a[k],b[k],ee[k],ll[k],gg[k],ee[k+1],ll[k+1],gg[k+1]);
		      end
		endgenerate
	assign E = ee[4];
	assign L = ll[4];
	assign G = gg[4];
endmodule
