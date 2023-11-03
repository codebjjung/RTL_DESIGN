module fsm (reset, clk, opcode, accz, acc15, asel, bsel, accce, pcce, irce, accoe, alufs, memrq, rnw);
   input reset, clk, accz, acc15;
   input [3:0] opcode;
   output asel, bsel, accce, pcce, irce, accoe, memrq, rnw;
   output [1:0] alufs;
   reg exft;
   reg [10:0] outs;

   always @(opcode or reset or exft or accz or acc15) begin
      if (reset) outs = {1'b0, 1'b0, 1'b1, 
