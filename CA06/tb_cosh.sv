`timescale 1ns/1ns
module tb_coshx();
  reg clk = 1'b0;
  reg rst = 1'b0;
  reg start = 1'b0;
  reg [15:0]x = 16'b1000000000000000;
  wire done;
  wire [17:0]result,ADDER;
  wire [15:0]sel_output;
  wire [2:0] counting;
  wire co_coun,sel_num,enc,zc;
  wire [2:0] ps;
  partddd12d cut(done,clk,co_coun,zc,enc,rst,sel_num,x,start,ADDER,counting,sel_output,ps,result);
  /*
output 	done;
input 	clk;
output 	c_out;
output 	zc;
output 	enc;
input 	rst;
output 	s_mux;
input 	[15:0] x;
input 	start;
output 	[17:0] adder;
output 	[2:0] count;
output 	[15:0] sel_output;
output 	[2:0] ps;
output 	[17:0] result;
  */
  
  
  always #100 clk=~clk;
  initial begin  
    #100 rst = 1'b1;
    #100 
    rst = 1'b0;
    x = 16'b1000000000000000;
    #520
    start = 1'b1;
    #370
    start = 1'b0;
    x = 16'b1000000000000000;
    #8000
    //x = 16'b1011101110011001;
    start = 1'b1;
    #100
     start = 1'b0;
    //#562
    //start = 1'b1;
    #8000
    //start = 1'b0;
    //x = 16'b0000000000000000;
    #10
    #100 rst = 1'b1;
    #100 
    rst = 1'b0;
    x = 16'b1100110011001100;
    #520
    start = 1'b1;
    #370
    start = 1'b0;
    #8000
    $stop;
  end
endmodule
