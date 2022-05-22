`timescale 1ns/1ns
module ALU_TB();
 wire [15:0]W;
 logic [15:0]inAA = 16'b0; 
 logic [15:0]inBB = 16'b0; 
 logic inC = 1'b0;
 logic [2:0]opc = 3'b0;
 wire neg ;
 wire zer;
 myALU1 CUT( .inB(inBB) , .inA(inAA)  , .opc(opc) , .inC(inC) , .zer(zer) , .neg(neg), .w(W) );

 initial repeat(1800)#20000 opc = opc + 1'b1;

 initial begin 
  repeat(2000) #300 inAA = $random;
  repeat(2000) #200 inBB = $random;
  repeat(900) #300 inC = $random;
  #500 $stop;
 end


endmodule
