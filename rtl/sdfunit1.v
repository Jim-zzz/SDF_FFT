`timescale 1ns/1ps
module sdfunit1 #(
    parameter WIDTH = 12,
    parameter DEPTH = 31
)(
    input clk,
    input di_en,
    input reset,
    input  [WIDTH-1:0] x_re,
    input  [WIDTH-1:0] x_im,
    output reg [WIDTH-1:0] y_re,
    output reg [WIDTH-1:0] y_im,
    output do_en
);

// Internal registers and wires
reg  [WIDTH-1:0] dx_re, dx_im;
wire [WIDTH-1:0] dy_re, dy_im;
wire [WIDTH-1:0] bf_x0_re, bf_x0_im;
wire [WIDTH-1:0] bf_x1_re, bf_x1_im;
wire [WIDTH-1:0] bf_y0_re, bf_y0_im;
wire [WIDTH-1:0] bf_y1_re, bf_y1_im;
reg  [WIDTH-1:0] mux2_re, mux2_im;
reg  [WIDTH-1:0] dout_re, dout_im;
reg  [WIDTH-1:0] y_re_r, y_im_r;
wire sel;
wire bf_nj;

wire [WIDTH-1:0] dx_re_comb, dx_im_comb;
wire [WIDTH-1:0] mux2_re_comb, mux2_im_comb;
wire [WIDTH-1:0] dout_re_comb, dout_im_comb;

// ---------------------- FSM ----------------------
FSM f0 (.clk(clk), .reset(reset), .sel(sel), .bf_nj(bf_nj), .do_en(do_en));


// ---------------------- MUX: input to buffer ----------------------


//assign dx_re_comb = ({WIDTH{sel}} & bf_y1_re) | ({WIDTH{~sel}} & x_re);
//assign dx_im_comb = ({WIDTH{sel}} & bf_y1_im) | ({WIDTH{~sel}} & x_im);

always @(posedge clk) begin
	dx_re <= ({WIDTH{sel}} & bf_y1_re) | ({WIDTH{~sel}} & x_re);
	dx_im <= ({WIDTH{sel}} & bf_y1_im) | ({WIDTH{~sel}} & x_im);
end

// ---------------------- Delay Buffer ----------------------
delaybuffer #(.WIDTH(WIDTH), .DEPTH(DEPTH)) d0 (
    .clk(clk),
    .reset(reset),
    .x_re(dx_re),
    .x_im(dx_im),
    .y_re(dy_re),
    .y_im(dy_im)
);

// ---------------------- Butterfly Input Mapping ----------------------

assign bf_x0_re = dy_re;
assign bf_x0_im = dy_im;
assign bf_x1_re = x_re;
assign bf_x1_im = x_im;

butterfly #(.WIDTH(WIDTH)) b0(
	.clk(clk),
    .x0_re(bf_x0_re), .x0_im(bf_x0_im),
    .x1_re(bf_x1_re), .x1_im(bf_x1_im),
    .y0_re(bf_y0_re), .y0_im(bf_y0_im),
    .y1_re(bf_y1_re), .y1_im(bf_y1_im)
);

// ---------------------- Pipeline: mux2 ----------------------

//assign mux2_re_comb = ({WIDTH{sel}} & bf_y0_re) | ({WIDTH{~sel}} & dy_re);
//assign mux2_im_comb = ({WIDTH{sel}} & bf_y0_im) | ({WIDTH{~sel}} & dy_im);

always @(posedge clk) begin
	mux2_re <= ({WIDTH{sel}} & bf_y0_re) | ({WIDTH{~sel}} & dy_re);
	mux2_im <= ({WIDTH{sel}} & bf_y0_im) | ({WIDTH{~sel}} & dy_im);
end


// ---------------------- output ----------------------

//assign dout_re_comb = ({WIDTH{bf_nj}} & mux2_im) | ({WIDTH{~bf_nj}} & mux2_re);
//assign dout_im_comb = ({WIDTH{bf_nj}} & (~mux2_re + 1)) | ({WIDTH{~bf_nj}} & mux2_im);

always @(posedge clk) begin
	dout_re <= ({WIDTH{bf_nj}} & mux2_im) | ({WIDTH{~bf_nj}} & mux2_re);
	dout_im <= ({WIDTH{bf_nj}} & (~mux2_re + 1)) | ({WIDTH{~bf_nj}} & mux2_im);
end



// ---------------------- Output Register ----------------------
always @(posedge clk) begin
    y_re <= dout_re;
    y_im <= dout_im;
end
//assign y_re = y_re_r;
//assign y_im = y_im_r;

endmodule

