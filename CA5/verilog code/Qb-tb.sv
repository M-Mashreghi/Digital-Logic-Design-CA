`timescale 1ns/1ns
module Qb_tb();

wire transmitted;
reg rst = 1 ;
reg clk = 0;
reg cen = 1;
reg init = 0;
wire signed [9:0] count;


Qb cut(transmitted,rst,clk,cen,init,count);
always #20 clk = ~clk; 
integer k;
initial begin
#40 rst = 0;
     init = 0;
for (k = 0 ; k < 2052 ; k = k + 1) begin 
    #20 ;
end 
    #20 $stop ;
end
endmodule