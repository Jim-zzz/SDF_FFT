`timescale 1ns/1ps
module carry_select_adder2 #(parameter WIDTH = 12)
(
	input signed [WIDTH-1:0] x,
	input signed [WIDTH-1:0] y,
	output reg signed [WIDTH:0] z

);

wire signed [5:0] low_sum;
wire signed [5:0] inc_add;
wire  carry;
wire C;
wire cout1, cout2, cout3, cout4, cout5;
wire overflow;
wire signed [5:0] high_sum1, high_sum2;
reg signed [12:0] sum;
//assign inc_add = y[11:6] + 1'b1;
/*
carry_generator c0 (.A(x[2:0]), .B(x[2:0]), .cout(C));
ha h0 (.x(x[0]), .y(y[0]), .z(low_sum[0]), .cout(cout1));
fa f0 (.x(x[1]), .y(y[1]), .cin(cout1), .z(low_sum[1]), .cout(cout2));
fa f1 (.x(x[2]), .y(y[2]), .cin(cout2), .z(low_sum[2]), .cout(cout3));
*/


assign {carry, low_sum[5:0]} = x[5:0] + y[5:0];
assign high_sum1 = x[11:6] + y[11:6] + 1'b1;
assign high_sum2 = x[11:6] + y[11:6];

always @(*) begin
	case ({carry})
		1'b0:
			sum = {high_sum2[5], high_sum2[5:0], low_sum};
		1'b1:
			sum = {high_sum1[5], high_sum1[5:0], low_sum};
	endcase
end

assign overflow = (~(x[11] ^ y[11])) & (x[11] ^ sum[11]);

always @(*) begin
	case ({carry, overflow})
		2'b01:
			z = {high_sum2, low_sum};
		2'b11:
			z = {high_sum1, low_sum};
		2'b00:
			z = sum;
		2'b10:
			z = sum;
	endcase;
end
	

endmodule 


