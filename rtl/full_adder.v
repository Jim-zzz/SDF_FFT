`timescale 1ns/1ps
/*
module full_adder
(
	input [5:0] x,
	input [5:0] y,
	output [6:0] z

);

wire [4:0] carry;
HA h0 (.x(x[0]), .y(y[0]), .z(z[0]), .cout(carry[0]));
FA f1 (.x(x[1]), .y(y[1]), .cin(carry[0]), .z(z[1]), .cout(carry[1]));
FA f2 (.x(x[2]), .y(y[2]), .cin(carry[1]), .z(z[2]), .cout(carry[2]));
FA f3 (.x(x[3]), .y(y[3]), .cin(carry[2]), .z(z[3]), .cout(carry[3]));
FA f4 (.x(x[4]), .y(y[4]), .cin(carry[3]), .z(z[4]), .cout(carry[4]));
FA f5 (.x(x[5]), .y(y[5]), .cin(carry[4]), .z(z[5]), .cout(z[6]));
	


endmodule 


module FA
(
	input x,
	input y,
	input cin,
	output z,
	output cout
);

assign z = x ^ y ^ cin;
assign cout = (x & y) | (cin & (x ^ y));


endmodule
*/
module fa
(
	input x,
	input y,
	input cin,
	output z,
	output cout
);

assign z = x ^ y ^ cin;
assign cout = x | y;


endmodule


