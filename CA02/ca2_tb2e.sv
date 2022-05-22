`timescale 1ns/1ns
module ca2_tb2e();
logic [3:0]aa;
logic [3:0]bb;
logic ee=1, ll=0,gg=0;
wire EE1,LL1,GG1,EE2,LL2,GG2;
quad_comparator CUT_112(.a(aa),.b(bb),.e(ee),.l(ll),.g(gg),.E(EE1),.L(LL1),.G(GG1));
quad_comparator_assign CUT_122(.a(aa),.b(bb),.e(ee),.l(ll),.g(gg),.E(EE2),.L(LL2),.G(GG2));
initial begin
#1 ee=1;ll=0;gg=0;
#1 aa[0]=0 ; aa[1]=0 ; aa[2]=0 ; aa[3]=0 ;
#1 bb[0]=0 ; bb[1]=0 ; bb[2]=0 ; bb[3]=0 ;
#250 aa[0]=1;
#250 bb[0]=1;
#250 bb[1]=1;
#250 aa[2]=1;
#250 bb[3]=1;
#250 bb[0]=0;
#250 aa[2]=1;
#250 bb[2]=0;
#250 aa[3]=1;
#1 aa[0]=1 ; aa[1]=1 ; aa[2]=1 ; aa[3]=1 ;
#1 bb[0]=1 ; bb[1]=1 ; bb[2]=1 ; bb[3]=1 ;
#250 bb[0]=0;
#250 bb[0]=1 ;
#250 aa[0]=0;
#250 aa[0]=1;
#250 aa=1'b0001;
#250 bb=1'b1111;
#250 aa=1'b1111;

#250 aa=1'b1110;
#250 aa=1'b1111;

#250 aa=1'b0111;
#220 $stop;
end
endmodule
