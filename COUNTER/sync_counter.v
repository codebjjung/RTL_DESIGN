module sync_counter(count, clk);
	output [3:0] count;
	input clk;
	reg [3:0] count;
	always @(posedge clk) begin
		count <= count + 1'b1;
	end
endmodule
