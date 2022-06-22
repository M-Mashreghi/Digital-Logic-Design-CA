module controller(input clk,rst,start,co, output reg done,zx,initx,ldx,zt,initt,ldt,zr,initr,ldr,zc,ldc,enc,s,output reg [2:0] ps);
  reg [2:0] ns;
  parameter [2:0] Idle = 3'd0, Initialization = 3'd1, Begin = 3'd2, Mult1 = 3'd3, Mult2 = 3'd4, Mult3 = 3'd5, Add = 3'd6;
  always@(ps,co,start) begin
    ns = Idle;
    case(ps)
      Idle: ns = (start)? Initialization:Idle;
      Initialization: ns = (start)? Initialization:Begin;
      Begin: ns = Mult1;
      Mult1: ns = Mult2;
      Mult2: ns = Mult3;
      Mult3: ns = Add;
      Add: ns = (co)? Idle:Mult1;
    endcase
  end

  always@(ps,co,start) begin
  {done,zx,initx,ldx,zt,initt,ldt,zr,initr,ldr,zc,ldc,enc,s}=14'b00000000000000000;
    case(ps)
      Idle: done = 1'b1;
      Begin: begin
        initr = 1'b1;
        ldr = 1'b1;
        initt = 1'b1;
        ldt = 1'b1;
        zc = 1'b1;
        ldx = 1'b1;
      end
      Mult1: begin
        s = 1'b0;
        ldt = 1'b1;
      end
      Mult2: begin
        s = 1'b0;
        ldt = 1'b1;
      end
      Mult3: begin
        s = 1'b1;
        ldt = 1'b1;
      end
      Add: begin
        enc = 1'b1;
        ldr = 1'b1;
      end
    endcase
  end

  always@(posedge clk, posedge rst) begin
    if (rst) ps <= Idle;
    else ps <= ns;
  end
endmodule