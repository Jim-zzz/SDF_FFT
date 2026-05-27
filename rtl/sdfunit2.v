`timescale 1ns/1ps
module sdfunit2 #(
    parameter WIDTH = 12,
    parameter DEPTH = 15
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

// ------------------------ Internal Wires & Regs ------------------------
reg  [WIDTH-1:0] x_re_r, x_im_r;
reg  [WIDTH-1:0] dx_re, dx_im;
wire [WIDTH-1:0] dy_re, dy_im;
wire [WIDTH-1:0] bf_x0_re, bf_x0_im;
wire [WIDTH-1:0] bf_x1_re, bf_x1_im;
wire [WIDTH-1:0] bf_y0_re, bf_y0_im;
wire [WIDTH-1:0] bf_y1_re, bf_y1_im;
wire [WIDTH-1:0] tw_re, tw_im;
reg  [WIDTH-1:0] y_re_r, y_im_r;
reg  [WIDTH-1:0] do_en_r;
reg  [WIDTH-1:0] mux2_re, mux2_im;
reg  temp1_en, temp2_en, temp3_en, temp4_en, en;
wire [WIDTH-1:0] dout_re, dout_im;
wire sel;
reg [5:0] addr;
reg [6:0] count;

reg [WIDTH-1:0] temp1_re, temp1_im;
reg [WIDTH-1:0] temp2_re, temp2_im;
reg [WIDTH-1:0] temp3_re, temp3_im;
reg [WIDTH-1:0] temp4_re, temp4_im;

wire [WIDTH-1:0] x_re_comb, x_im_comb;
wire [WIDTH-1:0] dx_re_comb, dx_im_comb;
wire [WIDTH-1:0] mux2_re_comb, mux2_im_comb;
wire [WIDTH-1:0] y_re_comb, y_im_comb;
reg start;

always @(negedge clk or posedge reset) begin
	if (reset) begin
		start <= 0;
	end else if (di_en) begin
		start <= 1;
	end
end

// ------------------------ input ------------------------

//assign x_re_comb = ({WIDTH{di_en}} & x_re) | ({WIDTH{~di_en}} & 0);
//assign x_im_comb = ({WIDTH{di_en}} & x_im) | ({WIDTH{~di_en}} & 0);

always @(posedge clk) begin		
	x_re_r <= ({WIDTH{di_en}} & x_re) | ({WIDTH{~di_en}} & 0);
	x_im_r <= ({WIDTH{di_en}} & x_im) | ({WIDTH{~di_en}} & 0);

end

// ------------------------ control signal ------------------------
FSM2 f0 (.clk(clk), .reset(reset), .di_en(di_en), .sel(sel), .do_en(do_en));

// ------------------------ MUX1: buffer ------------------------
//assign dx_re_comb = ({WIDTH{sel}} & bf_y1_re) | ({WIDTH{~sel}} & x_re_r);
//assign dx_im_comb = ({WIDTH{sel}} & bf_y1_im) | ({WIDTH{~sel}} & x_im_r);

always @(posedge clk) begin
	dx_re <= ({WIDTH{sel}} & bf_y1_re) | ({WIDTH{~sel}} & x_re_r);;
	dx_im <= ({WIDTH{sel}} & bf_y1_im) | ({WIDTH{~sel}} & x_im_r);
end


// ------------------------ Delay Buffer ------------------------
delaybuffer #(.WIDTH(WIDTH), .DEPTH(DEPTH)) d0 (
    .clk(clk),
    .reset(reset),
    .x_re(dx_re),
    .x_im(dx_im),
    .y_re(dy_re),
    .y_im(dy_im)
);

// ------------------------ Butterfly ------------------------
assign bf_x0_re = dy_re;
assign bf_x0_im = dy_im;
assign bf_x1_re = x_re_r;
assign bf_x1_im = x_im_r;

butterfly2 #(.WIDTH(WIDTH)) b0 (
    .x0_re(bf_x0_re), .x0_im(bf_x0_im),
    .x1_re(bf_x1_re), .x1_im(bf_x1_im),
    .y0_re(bf_y0_re), .y0_im(bf_y0_im),
    .y1_re(bf_y1_re), .y1_im(bf_y1_im)
);


// ------------------------ MUX2: Output ------------------------
//assign mux2_re_comb = ({WIDTH{sel}} & bf_y0_re) | ({WIDTH{~sel}} & dy_re);
//assign mux2_im_comb = ({WIDTH{sel}} & bf_y0_im) | ({WIDTH{~sel}} & dy_im);

always @(posedge clk) begin
	mux2_re <= ({WIDTH{sel}} & bf_y0_re) | ({WIDTH{~sel}} & dy_re);
	mux2_im <= ({WIDTH{sel}} & bf_y0_im) | ({WIDTH{~sel}} & dy_im);
end



always @(posedge clk) begin
	temp1_re <= mux2_re;
	temp1_im <= mux2_im;
	temp2_re <= temp1_re;
	temp2_im <= temp1_im;
	temp3_re <= temp2_re;
	temp3_im <= temp2_im;
	temp4_re <= temp3_re;
	temp4_im <= temp3_im;
end

// ------------------------ cnt && addr_gen ------------------------

always @(posedge clk or posedge reset) begin
	if (reset) begin
		count <= 0;
	end else if (start) begin
		if (count == 100) begin
			count <= 0;
		end else begin
			count <= count + 1;
		end
	end
end
// ------------------------addr ------------------------
always @(posedge clk) begin
	if (count >= 33 && count <= 47) begin
		addr <= (count-32) << 1;
	end else if (count >= 48 && count <= 63) begin
		addr <= (count-48);
	end else if (count >= 64 && count <= 79) begin
		addr <= (count-64)*3;
	end else begin
		addr <= 0;
	end
end

// ------------------------ Twiddle & Multiply ------------------------

/*
twiddle2 t0 (
	.clk(clk),
    .addr(addr),
    .tw_re(tw_re),
    .tw_im(tw_im)
);
*/
rom2_1 r0 (
	.clk(clk),
	.addr(addr),
	.tw_re(tw_re)
);

rom2_2 r1 (
	.clk(clk),
	.addr(addr),
	.tw_im(tw_im)
);


multiply #(.WIDTH(WIDTH)) m0 (

	.clk(clk),
    .a_re(mux2_re),
    .a_im(mux2_im),
    .b_re(tw_re),
    .b_im(tw_im),
    .m_re(dout_re),
    .m_im(dout_im)
);


// ------------------------ Final Output ------------------------

always @(posedge clk) begin
	if (addr) begin
		temp1_en <= 1;
		temp2_en <= temp1_en;
		temp3_en <= temp2_en;
		temp4_en <= temp3_en;
		en <= temp4_en;
	end else begin
		temp1_en <= 0;
		temp2_en <= temp1_en;
		temp3_en <= temp2_en;
		temp4_en <= temp3_en;
		en <= temp4_en;
	end
end
//assign y_re_comb = ({WIDTH{en}} & dout_re) | ({WIDTH{~en}} & temp4_re);
//assign y_im_comb = ({WIDTH{en}} & dout_im) | ({WIDTH{~en}} & temp4_im);

always @(posedge clk) begin
	y_re <= ({WIDTH{en}} & dout_re) | ({WIDTH{~en}} & temp4_re);
	y_im <= ({WIDTH{en}} & dout_im) | ({WIDTH{~en}} & temp4_im);
end


//assign y_re = y_re_r;
//assign y_im = y_im_r;




endmodule

