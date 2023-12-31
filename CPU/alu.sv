module alu1bit(reset, a, b, aen, binv, cin, cout, sum);
	input reset, a, b, aen, binv, cin;
	output cout, sum;
	wire x1, x2, x3, x4, x5, x6, x7, x8, x9, x10;

	assign x1 = (b & !binv) | (!b & binv); // xor
	assign x2 = (a & aen);
	assign x3 = !(x1 & x2);
	assign x4 = !(x1 & x3);
	assign x5 = !(x2 & x3);
	assign x6 = !(x4 & x5);
	assign x7 = !(cin & x6);
	assign x8 = !(cin & x7);
	assign x9 = !(x6 & x7);
	assign x10 = !(x8 & x9);
	assign cout = !(x3 & x7);
	assign sum = (x10 & !reset);
endmodule

module alu16 (reset, a, b, alufs, alu);
	input reset;
	input [1:0] alufs;
	input [15:0] a, b,;
	output [15:0] alu;
	wire [14:0] c;
	wire aen, binv, c0;

// alufs[1:0]
//2'b00 = b
//2'b01 = b+1
//2'b10 = a+b
// 2'b11 = a-b

assign aen = alufs[1];
assign binv = alufs[1:0] == 2'b11;
assign c0 = alufs[0];

alu1bit b00(.reset(reset), .a(a[0]), .b(b[0]), .aen(aen), .binv(binv), .cin(c0), .cout(c[0]), .sum(alu[0]));

for (i=1; i<16; i++) begin
alu1bit b0i(.reset(reset), .a(a[i]), .b(b[i]), .aen(aen), .binv(binv), .cin(c[i-1]), .cout(c[i-1]), .sum(alu[i-1]));
end

endmodule
