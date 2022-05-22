`timescale 1ns/1ns
module Q1_c_ALU_TB();
 wire [15:0]W;

 logic [15:0]inAA = 16'b0; 
 logic [15:0]inBB = 16'b0; 
 logic inC = 1'b0;
 logic [2:0]opc = 3'b0;
 wire neg;
 wire zer;
  ALU1 CUT2( .inB(inBB) , .inA(inAA)  , .opc(opc) , .inC(inC) , .zer(zer) , .neg(neg), .w(W));
 initial repeat(1800)#2000 opc = opc + 1'b1;

 initial begin 
  repeat(2000) #3000 inAA = $random;
  repeat(2000) #2000 inBB = $random;
  repeat(900) #3000 inC = $random;
  #500 $stop;
 end


endmodule
