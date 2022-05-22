`timescale 1ns/1ns
module ALU_TB_q2_c();
 wire [15:0]W;
 logic [15:0]inAA = 16'b0; 
 logic [15:0]inBB = 16'b0; 
 logic inC = 1'b0;
 logic [2:0]opc = 3'b0;
 wire neg ;
 wire zer;
myALU2_yosys CUT1( .inB(inBB) , .inA(inAA)  , .opc(opc) , .inC(inC) , .zer(zer) , .neg(neg), .w(W) );





 initial begin 
  #300 inC =  1;
  repeat(10000) #300 inAA = $random;
  repeat(10000) #200 opc = opc + 1'b1;
  repeat(10000) #200 inBB = $random;
  repeat(10000) #200 opc = opc + 1'b1;
  repeat(10000) #300 inC = $random;
  repeat(10000) #200 opc = opc + 1'b1;
  #300 inC =  0;
  repeat(10000) #300 inAA = $random;
  repeat(10000) #200 opc = opc + 1'b1;
  repeat(10000) #200 inBB = $random;
  repeat(10000) #200 opc = opc + 1'b1;
  repeat(10000) #300 inC = $random;
  repeat(10000) #200 opc = opc + 1'b1;
  #500 $stop;
 end


endmodule


