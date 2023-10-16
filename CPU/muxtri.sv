module mux12bit (a, b, s, out);
	input s;
	input [11:0] a, b;
	output [11:0] out;

	assign out = s ? a : b;
endmodule

module mux16bit (a, b, s, out);
	input s;
	input [15:0] a, b;
	output [15:0] out;

	assign out = s ? a : b;
endmodule

module tri16bit (in, oe ,out);
	input oe;
	input [15:0] in;
	output [15:0] out;

	assign out = oe ? in : 16'hz;
endmodule
