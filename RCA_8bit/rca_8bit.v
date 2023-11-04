module fa(x_in, y_in, c_in, sum, carry);

	input x_in, y_in;

	input c_in;

	output sum;

	output carry;

	assign sum = x_in^y_in^c_in;

	assign carry = (x_in&y_in&c_in)|(x_in&y_in)|(x_in&c_in)|(y_in&c_in);

endmodule


//8bit RCA

module rca_8bit(x_in, y_in, c_in, sum, cout);

	input [7:0] x_in;

	input [7:0] y_in;

	input c_in;

	output [7:0] sum;

	output cout;

	wire c0, c1, c2, c3, c4, c5, c6, c7;

	fa fa0(x_in[0],y_in[0],c_in,sum[0],c1);

	fa fa1(x_in[1],y_in[1],c1,sum[1],c2);

	fa fa2(x_in[2],y_in[2],c2,sum[2],c3);

	fa fa3(x_in[3],y_in[3],c3,sum[3],c4);

	fa fa4(x_in[4],y_in[4],c4,sum[4],c5);

	fa fa5(x_in[5],y_in[5],c5,sum[5],c6);

	fa fa6(x_in[6],y_in[6],c6,sum[6],c7);

	fa fa7(x_in[7],y_in[7],c7,sum[7],cout);


endmodule
