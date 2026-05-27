//----------------------------------------------------------------------
//  Twiddle: 64-Point Twiddle Table for Radix-2^2 Butterfly (assign array version)
//----------------------------------------------------------------------
module twiddle2 (
	input		  clk,
    input  [5:0]  addr,   // Twiddle Factor Number
    output [11:0] tw_re,  // Twiddle Factor (Real)
    output [11:0] tw_im   // Twiddle Factor (Imag)
);

wire [11:0] wn_re [0:45];
wire [11:0] wn_im [0:45];

reg [11:0] temp_re, temp_im;

assign wn_re[ 0] = 12'h000; assign wn_im[ 0] = 12'h000;
assign wn_re[ 1] = 12'h3FB; assign wn_im[ 1] = 12'hF9C;
assign wn_re[ 2] = 12'h3ED; assign wn_im[ 2] = 12'hF38;
assign wn_re[ 3] = 12'h3D4; assign wn_im[ 3] = 12'hED7;
assign wn_re[ 4] = 12'h3B2; assign wn_im[ 4] = 12'hE78;
assign wn_re[ 5] = 12'h387; assign wn_im[ 5] = 12'hE1E;
assign wn_re[ 6] = 12'h353; assign wn_im[ 6] = 12'hDC7;
assign wn_re[ 7] = 12'h318; assign wn_im[ 7] = 12'hD77;
assign wn_re[ 8] = 12'h2D4; assign wn_im[ 8] = 12'hD2C;
assign wn_re[ 9] = 12'h289; assign wn_im[ 9] = 12'hCE8;
assign wn_re[10] = 12'h239; assign wn_im[10] = 12'hCAD;
assign wn_re[11] = 12'h1E2; assign wn_im[11] = 12'hC79;
assign wn_re[12] = 12'h188; assign wn_im[12] = 12'hC4E;
assign wn_re[13] = 12'h129; assign wn_im[13] = 12'hC2C;
assign wn_re[14] = 12'h0C8; assign wn_im[14] = 12'hC13;
assign wn_re[15] = 12'h064; assign wn_im[15] = 12'hC05;
assign wn_re[16] = 12'h000; assign wn_im[16] = 12'hC00;
assign wn_re[17] = 12'hF9C; assign wn_im[17] = 12'hC05;
assign wn_re[18] = 12'hF38; assign wn_im[18] = 12'hC13;
assign wn_re[19] = 12'hED7; assign wn_im[19] = 12'hC2C;
assign wn_re[20] = 12'hE78; assign wn_im[20] = 12'hC4E;
assign wn_re[21] = 12'hE1E; assign wn_im[21] = 12'hC79;
assign wn_re[22] = 12'hDC7; assign wn_im[22] = 12'hCAD;
assign wn_re[23] = 12'hD77; assign wn_im[23] = 12'hCE8;
assign wn_re[24] = 12'hD2C; assign wn_im[24] = 12'hD2C;
assign wn_re[25] = 12'hCE8; assign wn_im[25] = 12'hD77;
assign wn_re[26] = 12'hCAD; assign wn_im[26] = 12'hDC7;
assign wn_re[27] = 12'hC79; assign wn_im[27] = 12'hE1E;
assign wn_re[28] = 12'hC4E; assign wn_im[28] = 12'hE78;
assign wn_re[29] = 12'hC2C; assign wn_im[29] = 12'hED7;
assign wn_re[30] = 12'hC13; assign wn_im[30] = 12'hF38;
assign wn_re[31] = 12'hC05; assign wn_im[31] = 12'hF9C;
assign wn_re[32] = 12'hC00; assign wn_im[32] = 12'h000;
assign wn_re[33] = 12'hC05; assign wn_im[33] = 12'h064;
assign wn_re[34] = 12'hC13; assign wn_im[34] = 12'h0C8;
assign wn_re[35] = 12'hC2C; assign wn_im[35] = 12'h129;
assign wn_re[36] = 12'hC4E; assign wn_im[36] = 12'h188;
assign wn_re[37] = 12'hC79; assign wn_im[37] = 12'h1E2;
assign wn_re[38] = 12'hCAD; assign wn_im[38] = 12'h239;
assign wn_re[39] = 12'hCE8; assign wn_im[39] = 12'h289;
assign wn_re[40] = 12'hD2C; assign wn_im[40] = 12'h2D4;
assign wn_re[41] = 12'hD77; assign wn_im[41] = 12'h318;
assign wn_re[42] = 12'hDC7; assign wn_im[42] = 12'h353;
assign wn_re[43] = 12'hE1E; assign wn_im[43] = 12'h387;
assign wn_re[44] = 12'hE78; assign wn_im[44] = 12'h3B2;
assign wn_re[45] = 12'hED7; assign wn_im[45] = 12'h3D4;

always @(posedge clk) begin
	temp_re <= wn_re[addr];
	temp_im <= wn_im[addr];
end

assign tw_re = temp_re;
assign tw_im = temp_im;

endmodule

