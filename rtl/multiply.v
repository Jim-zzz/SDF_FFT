//----------------------------------------------------------------------
//  Multiply: Complex Multiplier
//----------------------------------------------------------------------
`timescale 1ns/1ns
module multiply #(
    parameter   WIDTH = 12
)(
	input 						clk,
    input   signed  [WIDTH-1:0] a_re,
    input   signed  [WIDTH-1:0] a_im,
    input   signed  [WIDTH-1:0] b_re,
    input   signed  [WIDTH-1:0] b_im,
    output  signed  [WIDTH-1:0] m_re,
    output  signed  [WIDTH-1:0] m_im
);


reg signed [WIDTH*2-1:0] md, ma, mb;

reg signed [WIDTH-1:0] sub_ar_ai;
reg signed [WIDTH-1:0] sub_br_bi;
reg signed [WIDTH-1:0] add_br_bi;

reg signed [WIDTH-1:0] sc_md, sc_ma, sc_mb;
reg signed [WIDTH-1:0] dout_re, dout_im;
/*
wire signed [WIDTH-1:0] a_im_neg, b_im_neg;
wire signed [WIDTH:0] temp1, temp2, temp3;
assign a_im_neg = ~a_im + 1;
assign b_im_neg = ~b_im + 1;
carry_select_adder2  c0 (.x(a_re), .y(a_im_neg), .z(temp1));
carry_select_adder2  c1 (.x(b_re), .y(b_im_neg), .z(temp2));
carry_select_adder2  c2 (.x(b_re), .y(b_im), .z(temp3));

always @(posedge clk) begin
	sub_ar_ai <= temp1;
	sub_br_bi <= temp2;
	add_br_bi <= temp3;
end
	

*/

always @(posedge clk) begin
	sub_ar_ai <= a_re + (~a_im + 1);
	sub_br_bi <= b_re + (~b_im + 1);
	add_br_bi <= b_re + b_im;
end
reg signed [WIDTH-1:0] temp1_b_im;
reg signed [WIDTH-1:0] temp1_a_re;
reg signed [WIDTH-1:0] temp1_a_im;
always @(posedge clk) begin
	temp1_b_im <= b_im;
	temp1_a_re <= a_re;
	temp1_a_im <= a_im;	

end



always @(posedge clk) begin
	md <= sub_ar_ai * temp1_b_im;
	ma <= sub_br_bi * temp1_a_re;
	mb <= add_br_bi * temp1_a_im;
end

	
always @(posedge clk) begin
	sc_md <= md >>> (WIDTH-2);
	sc_ma <= ma >>> (WIDTH-2);
	sc_mb <= mb >>> (WIDTH-2);
end


always @(posedge clk) begin
	dout_re <= sc_md + sc_ma;
	dout_im <= sc_md + sc_mb;
end

assign m_re = dout_re;
assign m_im = dout_im;











endmodule
