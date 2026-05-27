//----------------------------------------------------------------------
//  DelayBuffer: Generate Constant Delay
//----------------------------------------------------------------------
module delaybuffer2 #(
    parameter   WIDTH = 16
)(
    input               clk,  //  Master Clock
	input				reset,
    input   [WIDTH-1:0] x_re,  //  Data Input (Real)
    input   [WIDTH-1:0] x_im,  //  Data Input (Imag)
    output  [WIDTH-1:0] y_re,  //  Data Output (Real)
    output  [WIDTH-1:0] y_im   //  Data Output (Imag)
);

reg [WIDTH-1:0] temp1_re;
reg [WIDTH-1:0] temp1_im;



//  Shift Buffer
always @(posedge clk or posedge reset) begin
	if (reset) begin
		temp1_re <= 0;
		temp1_im <= 0;
	end	else begin
		temp1_re <= x_re;
		temp1_im <= x_im;
	end
end

assign  y_re = temp1_re;
assign  y_im = temp1_im;

endmodule
