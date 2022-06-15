`timescale 1ns/1ns
module Qa_TB_prepo();

wire seroutvalid1 , i01;
wire seroutvalid2 , i02;
reg serIn = 1,transmitted = 0 ,clk = 0,rst = 1;

Qa_presynth3 cut1(.clk(clk) , .rst(rst) ,  .serIn(serIn) , .transmitted(transmitted) , .seroutvalid(seroutvalid1) , .i0(i01));
Qapro cut2(.clk(clk) , .rst(rst) ,  .serIn(serIn) , .transmitted(transmitted) , .seroutvalid(seroutvalid2) , .i0(i02));


always #50 clk = ~clk; 
integer i ;
//initial begin 
//#1500 transmitted = 1;
//end


reg [22:0] seq = 23'b00101100111111111001011;
initial begin
#100 rst = 0 ;

for (i = 22 ; i>-1 ; i--) begin 
	serIn = seq[i];
	#100 ;
end
   
#1000 $stop ;
end


endmodule


