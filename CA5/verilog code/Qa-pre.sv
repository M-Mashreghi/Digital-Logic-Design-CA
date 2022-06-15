`timescale 1ns/1ns
module Qa_presynth3 (input clk,rst , serIn ,transmitted, output logic seroutvalid , i0);
  logic [3:0] pstate,nstate ;	reg c_en,load;
  wire co;
  parameter [2:0] A = 0 ,B = 1 , C = 2 , D = 3 , E = 4 ,F=5;
  	always @(pstate,serIn,co,transmitted) begin
		i0=0;
		c_en = 0 ;
		load = 0 ;
		seroutvalid=0;
		nstate=A;
		case(pstate)
			A: nstate = serIn ? A : B;

			B: nstate = serIn ? A : C;

			C : begin nstate = serIn ? D : C;  load = 1 ; end

			D: begin c_en = 1; nstate = ~serIn ? (co ? E : B) : (~co ? D : A); end

			E: begin i0 = 1; nstate = serIn ? A : F; end

			F: begin seroutvalid=1; nstate = transmitted ? A : F;end
			
			default: nstate = A;
		endcase
	end 
 
  always @(posedge clk , posedge rst) begin
    if(rst)
      pstate <= A;
    else
      pstate <= nstate;
  end

    
    logic [3:0] Count;//divider by 9
  always @(posedge clk , posedge rst) begin
    if(rst) Count <= 4'd0;
    else if (load) Count <= 4'd7;
        else if (c_en) Count <= Count + 1;
  end
    assign co = &Count;   

endmodule



