module sync_counter(count, clk, nrst);
	output [3:0] count;
	input clk;
	input nrst;
	reg [3:0] count;
	always @(posedge clk) begin
		if (!nrst == 0)
			count <= 0;
		else
			count <= count + 1'b1;
	end
endmodule
