//----------------------------------------------------------------------
//  Twiddle: 64-Point Twiddle Table for Radix-2^2 Butterfly (assign array version)
//----------------------------------------------------------------------
module twiddle3 (
	input		  clk,
    input  [3:0]  addr,   // Twiddle Factor Number
    output [11:0] tw_re,  // Twiddle Factor (Real)
    output [11:0] tw_im   // Twiddle Factor (Imag)
);

wire [11:0] wn_re [0:9];
wire [11:0] wn_im [0:9];

reg [11:0] temp_re, temp_im;

assign wn_re[0] = 12'h000; assign wn_im[0] = 12'h000;
assign wn_re[1] = 12'h3B2; assign wn_im[1] = 12'hE78;
assign wn_re[2] = 12'h2D4; assign wn_im[2] = 12'hD2C;
assign wn_re[3] = 12'h188; assign wn_im[3] = 12'hC4E;
assign wn_re[4] = 12'h000; assign wn_im[4] = 12'hC00;
assign wn_re[5] = 12'hE78; assign wn_im[5] = 12'hC4E;
assign wn_re[6] = 12'hD2C; assign wn_im[6] = 12'hD2C;
assign wn_re[7] = 12'hC4E; assign wn_im[7] = 12'hE78;
assign wn_re[8] = 12'hD2C; assign wn_im[8] = 12'h000;
assign wn_re[9] = 12'hC4E; assign wn_im[9] = 12'h188;

always @(posedge clk) begin
	temp_re <= wn_re[addr];
	temp_im <= wn_im[addr];
end

assign tw_re = temp_re;
assign tw_im = temp_im;

endmodule

