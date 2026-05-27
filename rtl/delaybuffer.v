`timescale 1ns/1ns
module delaybuffer #(parameter WIDTH = 16, DEPTH = 32)(
input clk,
input reset,
input [WIDTH-1:0] x_re,
input [WIDTH-1:0] x_im,

output [WIDTH-1:0] y_re,
output [WIDTH-1:0] y_im
);

reg [WIDTH-1:0] buf_re [DEPTH-1:1];
reg [WIDTH-1:0] buf_im [DEPTH-1:1];
reg [WIDTH-1:0] y_re_r;
reg [WIDTH-1:0] y_im_r;
integer i;

//  Shift Buffer
always @(posedge clk or posedge reset) begin
    if(reset) begin
        for (i=1; i<DEPTH; i=i+1) begin
            buf_re[i] <= 0;
            buf_im[i] <= 0;
        end
    end
    else begin 
		for (i=2; i<DEPTH; i=i+1) begin
			buf_re[i] <= buf_re[i-1];
			buf_im[i] <= buf_im[i-1];
		end
		buf_re[1] <= x_re;
		buf_im[1] <= x_im;
	end
end

always @(posedge clk) begin
	y_re_r <= buf_re[DEPTH-1];
	y_im_r <= buf_im[DEPTH-1];
end

//assign y_re = buf_re[DEPTH-1];
//assign y_im = buf_im[DEPTH-1];

assign y_re = y_re_r;
assign y_im = y_im_r;


endmodule
