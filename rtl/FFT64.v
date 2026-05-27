`timescale 1ns/1ps
module FFT64 #(
	parameter WIDTH = 12, 
	parameter DEPTH1 = 31,
	parameter DEPTH2 = 15,
	parameter DEPTH3 = 7,
	parameter DEPTH4 = 3,
	parameter DEPTH5 = 1
)(
	input clk,
	input reset,
	input di_en,
	input  [WIDTH-1:0] x_re,
	input  [WIDTH-1:0] x_im,
	output [WIDTH-1:0] y_re,
	output [WIDTH-1:0] y_im,
	output do_en

);
	
wire [WIDTH-1:0] temp1_re;
wire [WIDTH-1:0] temp1_im;
wire [WIDTH-1:0] temp2_re;
wire [WIDTH-1:0] temp2_im;
wire [WIDTH-1:0] temp3_re;
wire [WIDTH-1:0] temp3_im;
wire [WIDTH-1:0] temp4_re;
wire [WIDTH-1:0] temp4_im;
wire [WIDTH-1:0] temp5_re;
wire [WIDTH-1:0] temp5_im;
wire do1;
wire do2;
wire do3;
wire do4;
wire do5;
	
sdfunit1 #(.WIDTH(WIDTH), .DEPTH(DEPTH1)) s1
(
	.clk(clk),
	.di_en(di_en), 
	.reset(reset),
	.x_re (x_re),
	.x_im (x_im),
	.y_re (temp1_re),
	.y_im (temp1_im),
	.do_en (do1)
);
sdfunit2 #(.WIDTH(WIDTH), .DEPTH(DEPTH2)) s2
(
	.clk(clk),
	.di_en(do1), 
	.reset(reset),
	.x_re (temp1_re),
	.x_im (temp1_im),
	.y_re (temp2_re),
	.y_im (temp2_im),
	.do_en (do2)
);
sdfunit3 #(.WIDTH(WIDTH), .DEPTH(DEPTH3)) s3
(
	.clk(clk),
	.di_en(do2), 
	.reset(reset),
	.x_re (temp2_re),
	.x_im (temp2_im),
	.y_re (temp3_re),
	.y_im (temp3_im),
	.do_en (do3)
);
sdfunit4 #(.WIDTH(WIDTH), .DEPTH(DEPTH4)) s4
(
	.clk(clk),
	.di_en(do3), 
	.reset(reset),
	.x_re (temp3_re),
	.x_im (temp3_im),
	.y_re (temp4_re),
	.y_im (temp4_im),
	.do_en (do4)
);
sdfunit5 #(.WIDTH(WIDTH), .DEPTH(DEPTH5)) s5
(
	.clk(clk),
	.di_en(do4), 
	.reset(reset),
	.x_re (temp4_re),
	.x_im (temp4_im),
	.y_re (temp5_re),
	.y_im (temp5_im),
	.do_en (do5)
);
sdfunit6 #(.WIDTH(WIDTH)) s6
(
	.clk(clk),
	.di_en(do5), 
	.reset(reset),
	.x_re (temp5_re),
	.x_im (temp5_im),
	.y_re (y_re),
	.y_im (y_im),
	.do_en (do_en)
);


endmodule
