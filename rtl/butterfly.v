//----------------------------------------------------------------------
//  Butterfly: Add/Sub and Scaling
//----------------------------------------------------------------------
`timescale 1ns/1ps
module butterfly #(
    parameter   WIDTH = 12
)(
	input 						clk,
    input   signed  [WIDTH-1:0] x0_re,  //  Input Data #0 (Real)
    input   signed  [WIDTH-1:0] x0_im,  //  Input Data #0 (Imag)
    input   signed  [WIDTH-1:0] x1_re,  //  Input Data #1 (Real)
    input   signed  [WIDTH-1:0] x1_im,  //  Input Data #1 (Imag)
    output  signed  [WIDTH-1:0] y0_re,  //  Output Data #0 (Real)
    output  signed  [WIDTH-1:0] y0_im,  //  Output Data #0 (Imag)
    output  signed  [WIDTH-1:0] y1_re,  //  Output Data #1 (Real)
    output  signed  [WIDTH-1:0] y1_im   //  Output Data #1 (Imag)
);
wire signed [WIDTH-1:0] x1_re_neg, x1_im_neg;
wire signed [WIDTH:0] temp1, temp2, temp3, temp4; 
reg signed [WIDTH:0]   add_re, add_im, sub_re, sub_im;
assign x1_re_neg = ~x1_re + 1;
assign x1_im_neg = ~x1_im + 1;


carry_select_adder2 #(.WIDTH(WIDTH)) c0 (.x(x0_re), .y(x1_re), .z(temp1));
carry_select_adder2 #(.WIDTH(WIDTH)) c1 (.x(x0_im), .y(x1_im), .z(temp2));
carry_select_adder2 #(.WIDTH(WIDTH)) c2 (.x(x0_re), .y(x1_re_neg), .z(temp3));
carry_select_adder2 #(.WIDTH(WIDTH)) c3 (.x(x0_im), .y(x1_im_neg), .z(temp4));


/*
ax_adder a0 (.A(x0_re), .B(x1_re), .S(temp1));
ax_adder a1 (.A(x0_im), .B(x1_im), .S(temp2));
ax_adder a2 (.A(x0_re), .B(x1_re_neg), .S(temp3));
ax_adder a3 (.A(x0_im), .B(x1_im_neg), .S(temp4));
*/

//  Add/Sub
/*
always @(posedge clk) begin
	add_re <= x0_re + x1_re;
	add_im <= x0_im + x1_im;
	sub_re <= x0_re + (~x1_re + 1);
	sub_im <= x0_im + (~x1_im + 1);
end
*/
	
always @(posedge clk) begin
	add_re <= temp1;
	add_im <= temp2;
	sub_re <= temp3;
	sub_im <= temp4;
end



//  Scaling
assign  y0_re = add_re >>> 1;
assign  y0_im = add_im >>> 1;
assign  y1_re = sub_re >>> 1;
assign  y1_im = sub_im >>> 1;



endmodule
