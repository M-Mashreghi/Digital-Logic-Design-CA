`timescale 1ns/1ns
module tbc();
wire SerOut ;
wire [9:0]q;
reg SerIn = 1,clk = 0,rst = 1;
partc cut(SerOut , SerIn , clk , rst , q );    
always #50 clk = ~clk; 
integer i ;



reg [22:0] seq = 23'b00101100111111111001011;
initial begin
#100 rst = 0 ;

for (i = 22 ; i>-1 ; i--) begin 
	SerIn = seq[i];
	#100 ;
end

repeat(1024)begin
#100 SerIn = 0;
#100 SerIn = 1;
end
#2000 $stop ;
end
endmodule

