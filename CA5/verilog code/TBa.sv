`timescale 1ns/1ns
module Qa_TB3();

wire seroutvalid , i0 ;

reg serIn = 1,transmitted = 0 ,clk = 0 ,rst = 0;
    
Qa_presynth3 cut1(.clk(clk) , .rst(rst) ,  .serIn(serIn) , .transmitted(transmitted) , .seroutvalid(seroutvalid) , .i0(i0));
always #25 clk = ~clk; 


logic [20:0] seq = 21'b100111100111111111001011;
integer k ;
initial begin
#50 serIn = 1 ;



for (k = 23 ; k>0 ; k--) begin //k=4 servalid=1
	serIn = seq[k];
	#50 ;
	
end
   
#10 $stop ;
end
endmodule
