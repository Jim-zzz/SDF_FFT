`timescale 1ns/1ns
module sdfunit6 #(
    parameter WIDTH = 12
)(
    input clk,
    input di_en,
    input reset,
    input  [WIDTH-1:0] x_re,
    input  [WIDTH-1:0] x_im,
    output [WIDTH-1:0] y_re,
    output [WIDTH-1:0] y_im,
    output do_en
);
reg  [WIDTH-1:0] x_re_r, x_im_r;
wire [WIDTH-1:0] bf_x0_re, bf_x0_im;
wire [WIDTH-1:0] bf_x1_re, bf_x1_im;
wire [WIDTH-1:0] bf_y0_re, bf_y0_im;
wire [WIDTH-1:0] bf_y1_re, bf_y1_im;
wire sel;
reg  [WIDTH-1:0] mux1_re, mux1_im;
reg  [WIDTH-1:0] mux2_re, mux2_im;
reg  [WIDTH-1:0] y_re_r, y_im_r;
reg  [WIDTH-1:0] do_en_r;


wire [WIDTH-1:0] x_re_comb, x_im_comb;
wire [WIDTH-1:0] mux1_re_comb, mux1_im_comb;
wire [WIDTH-1:0] mux2_re_comb, mux2_im_comb;
//  ---------------------- signal_control ----------------------
signal_control4 s0 (.clk(clk), .reset(reset), .di_en(di_en), .sel(sel), .do_en(do_en));

// ---------------------- input ----------------------

//assign x_re_comb = ({WIDTH{di_en}} & x_re) | ({WIDTH{~di_en}} & 0);
//assign x_im_comb = ({WIDTH{di_en}} & x_im) | ({WIDTH{~di_en}} & 0);
always @(posedge clk) begin
	x_re_r <= ({WIDTH{di_en}} & x_re) | ({WIDTH{~di_en}} & 0);
	x_im_r <= ({WIDTH{di_en}} & x_im) | ({WIDTH{~di_en}} & 0);
end
	
// ---------------------- MUX1: input to buffer ----------------------


//assign mux1_re_comb = ({WIDTH{sel}} & bf_y1_re) | ({WIDTH{~sel}} & x_re_r);
//assign mux1_im_comb = ({WIDTH{sel}} & bf_y1_im) | ({WIDTH{~sel}} & x_im_r);
always @(posedge clk) begin
	mux1_re <= ({WIDTH{sel}} & bf_y1_re) | ({WIDTH{~sel}} & x_re_r);
	mux1_im <= ({WIDTH{sel}} & bf_y1_im) | ({WIDTH{~sel}} & x_im_r);
end

// ---------------------- Butterfly Input Mapping ----------------------
assign bf_x0_re = mux1_re;
assign bf_x0_im = mux1_im;
assign bf_x1_re = x_re_r;
assign bf_x1_im = x_im_r;

butterfly2 #(.WIDTH(WIDTH)) b0 (
    .x0_re(bf_x0_re), .x0_im(bf_x0_im),
    .x1_re(bf_x1_re), .x1_im(bf_x1_im),
    .y0_re(bf_y0_re), .y0_im(bf_y0_im),
    .y1_re(bf_y1_re), .y1_im(bf_y1_im)
);

// ---------------------- MUX2: output ----------------------

//assign mux2_re_comb = ({WIDTH{sel}} & bf_y0_re) | ({WIDTH{~sel}} & mux1_re);
//assign mux2_im_comb = ({WIDTH{sel}} & bf_y0_im) | ({WIDTH{~sel}} & mux1_im);
always @(posedge clk) begin
	mux2_re <= ({WIDTH{sel}} & bf_y0_re) | ({WIDTH{~sel}} & mux1_re);
	mux2_im <= ({WIDTH{sel}} & bf_y0_im) | ({WIDTH{~sel}} & mux1_im);
end

assign y_re = mux2_re;
assign y_im = mux2_im;


endmodule

