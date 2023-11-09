module FF(d,clk,q);

	input d, clk;

	output reg q;

	always @(posedge clk) begin

		q <= d;

	end

endmodule


module DD2(d,clk,q);

	input d, clk;

	output reg q;

	reg data;

	always @(posedge clk) begin

		data <= d;

		q <= data;

	end

endmodule


module DD3(d,clk,q);

	input d, clk;

	output reg q;

	reg[1:0] data;

	always @(posedge clk) begin

		data[0] <= d;

		data[1] <= data[0];

		q <= data[1];

	end

endmodule


module DD4(d,clk,q);

	input d, clk;

	output reg q;

	reg[2:0] data;

	always @(posedge clk) begin

		data[0] <= d;

		data[1] <= data[0];

		data[2] <= data[1];

		q <= data[2];

	end

endmodule


module DD5(d,clk,q);

	input d, clk;

	output reg q;

	reg[3:0] data;

	always @(posedge clk) begin

		data[0] <= d;

		data[1] <= data[0];

		data[2] <= data[1];

		data[3] <= data[2];

		q <= data[3];

	end

endmodule


module DD6(d,clk,q);

	input d, clk;

	output reg q;

	reg[4:0] data;

	always @(posedge clk) begin

		data[0] <= d;

		data[1] <= data[0];

		data[2] <= data[1];

		data[3] <= data[2];

		data[4] <= data[3];

		q <= data[4];

	end

endmodule


module DD7(d,clk,q);

	input d, clk;

	output reg q;

	reg[5:0] data;

	always @(posedge clk) begin

		data[0] <= d;

		data[1] <= data[0];

		data[2] <= data[1];

		data[3] <= data[2];

		data[4] <= data[3];

		data[5] <= data[4];

		q <= data[5];

	end

endmodule


module DD8(d,clk,q);

	input d, clk;

	output reg q;

	reg[6:0] data;

	always @(posedge clk) begin

		data[0] <= d;

		data[1] <= data[0];

		data[2] <= data[1];

		data[3] <= data[2];

		data[4] <= data[3];

		data[5] <= data[4];

		data[6] <= data[5];

		q <= data[6];

	end

endmodule


module FA(A,B,Ci,S,Co);

	input A, B, Ci;

	output S, Co;

	assign S = A^B^Ci;

	assign Co = A&B|(A^B)&Ci;

endmodule


//8bit pipelined RCA

module rca_pipe(C0, A, B, clk, Oc, C7);

	input C0;

	input [7:0] A;

	input [7:0] B;

	input clk;

	output [7:0] Oc;

	output C7;

	wire [6:0] C;

	wire [6:0] Cc;

	wire [7:0] Ac;

	wire [7:0] Bc;

	wire [7:0] O;

	wire C0c;

	//FA0

	FF R1(A[0], clk, Ac[0]);

	FF R2(B[0], clk, Bc[0]);

	FF R3(C0, clk, C0c);

	FA F0(Ac[0], Bc[0], C0c, O[0], C[0]);

	DD7 D73(O[0],clk,Oc[0]);

	//FA1

	FF R4(C[0], clk, Cc[0]);

	DD2 D21(A[1], clk, Ac[1]);

	DD2 D22(B[1], clk, Bc[1]);

	FA F1(Ac[1], Bc[1], Cc[0], O[1], C[1]);

	DD6 D63(O[1],clk,Oc[1]);

	//FA2

	FF R5(C[1], clk, Cc[1]);

	DD3 D31(A[2], clk, Ac[2]);

	DD3 D32(B[2], clk, Bc[2]);

	FA F2(Ac[2], Bc[2], Cc[1], O[2], C[2]);

	DD5 D53(O[2],clk,Oc[2]);

	//FA3

	FF R6(C[2], clk, Cc[2]);

	DD4 D41(A[3], clk, Ac[3]);

	DD4 D42(B[3], clk, Bc[3]);

	FA F3(Ac[3], Bc[3], Cc[2], O[3], C[3]);

	DD4 D43(O[3],clk,Oc[3]);

	//FA4

	FF R7(C[3], clk, Cc[3]);

	DD5 D51(A[4], clk, Ac[4]);

	DD5 D52(B[4], clk, Bc[4]);

	FA F4(Ac[4], Bc[4], Cc[3], O[4], C[4]);

	DD3 D33(O[4],clk,Oc[4]);

	//FA5

	FF R8(C[4], clk, Cc[4]);

	DD6 D61(A[5], clk, Ac[5]);

	DD6 D62(B[5], clk, Bc[5]);

	FA F5(Ac[5], Bc[5], Cc[4], O[5], C[5]);

	DD2 D23(O[5],clk,Oc[5]);

	//FA6

	FF R9(C[5], clk, Cc[5]);

	DD7 D71(A[6], clk, Ac[6]);

	DD7 D72(B[6], clk, Bc[6]);

	FA F6(Ac[6], Bc[6], Cc[5], O[6], C[6]);

	FF R11(O[6],clk,Oc[6]);

	//FA7

	FF R10(C[6], clk, Cc[6]);

	DD8 D81(A[7], clk, Ac[7]);

	DD8 D82(B[7], clk, Bc[7]);

	FA F7(Ac[7], Bc[7], Cc[6], O[7], C7);

	assign Oc[7] = O[7];

endmodule
