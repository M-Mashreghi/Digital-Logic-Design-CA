`timescale 1ns/1ns
module myALU1 (input signed [15:0] inB,inA,input [2:0] opc,input inC,output zer,neg,output logic signed [15:0] w);
	assign zer=~(|w);
	assign neg=w[15];
	always @(inB,inA,opc,inC) begin
		w=16'd0;
		case(opc)
			3'd0:w=inB+inA+inC;
			3'd1:w=inB+(inA>>>1);
			3'd2:w=inB+1;
			3'd3:w=inB+(inB>>>1);
			3'd4:w=inB&inA;
			3'd5:w=inB|inA;
			3'd6:w=~inB;
			default:w=16'd0;
		endcase
	end
endmodule

