`timescale 1ns/1ns

module ca2_tb1e();
logic aa , bb,ee, ll,gg ;
wire EE1,LL1,GG1,EE2,LL2,GG2;

bit_comparator CUT_12(.a(aa),.b(bb),.e(ee),.l(ll),.g(gg),.E(EE1),.L(LL1),.G(GG1));
bit_comparator_assign CUT_13(.a(aa),.b(bb),.e(ee),.l(ll),.g(gg),.E(EE2),.L(LL2),.G(GG2));
initial begin
#1 ee=0;
#1 ll=0;
#1 gg=0;
#1 aa=0;
#1 bb=0;
#80 aa=1;
#90 aa=0;
#130 bb=1;
#150 aa=0;
#180 aa=1;

#1 ee=1;
#1 ll=1;
#1 gg=1;

#80 aa=1;
#90 aa=0;
#130 bb=1;
#150 aa=0;
#180 aa=1;


#100 ee=0;
#100 ll=0;
#100 gg=0;


#100 bb=0;
#100 bb=1;


#100 aa=0;
#100 aa=1;

#100 gg=1;

#100 bb=0;
#100 bb=1;

#220 $stop;
end

endmodule
