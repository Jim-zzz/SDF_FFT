`timescale 1ns/1ps
module signal_control
(
	input clk,
	input reset,
	input di_en,
	output sel,
	output bf_nj,
	output do_en
);

reg start_count;
reg do_en_r;
reg [3:0] cnt;
reg [6:0] cnt2;
reg [3:0] cnt3;
wire [15:0] mask1;
wire [15:0] mask2;
// -----------------start_count-----------------
always @(negedge clk or posedge reset) begin
	if (reset) begin
		start_count <= 0;
	end else if (di_en) begin
		start_count <= 1;
	end
end

// -----------------sel-----------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt <= 0;
	end else if (cnt2 > 75) begin
		cnt <= 0;
	end else if (start_count) begin
		cnt <= cnt + 1;
	end
end
assign mask1 = 16'b1111_1110_0000_0001;
assign sel = mask1[cnt];

// -----------------bf_nj-----------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt2 <= 0;
	end else if (start_count) begin
		if (cnt2 == 100) begin
			cnt2 <= 0;
		end else begin	
			cnt2 <= cnt2 + 1;
		end
	end
end 
always @(posedge clk) begin
	if (cnt2 > 8 && cnt2 < 76) begin
		cnt3 <= cnt3 + 1;
	end else begin
		cnt3 <= 0;
	end
end

assign mask2 = 16'b1110_0000_0000_0001;
assign bf_nj = mask2[cnt3];
// -----------------do_en-----------------
/*
always @(posedge clk) begin
	if (cnt2 > 10 && cnt2 < 76) begin
		do_en_r <= 1;
	end else begin
		do_en_r <= 0;
	end
end
*/
always @(posedge clk or posedge reset) begin
	if (reset) begin
		do_en_r <= 0;
	end else begin
		do_en_r <= (cnt2 >= 11 && cnt2 <= 75);
	end
end
assign do_en = do_en_r;

endmodule


