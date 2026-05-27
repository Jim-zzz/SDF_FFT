`timescale 1ns/1ps
module signal_control4
(
	input clk,
	input reset,
	input di_en,
	output sel,
	output do_en
	
);

reg do_en_r;
reg start_count;
reg [6:0] cnt;
reg cnt2;
wire [1:0] mask1;

// -----------------start_count-----------------
always @(negedge clk or posedge reset) begin
	if (reset) begin
		start_count <= 0;
	end else if (di_en) begin
		start_count <= 1;
	end
end

// -----------------counter-----------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt <= 0;
	end else if (start_count) begin			
		if (cnt == 100) begin
			cnt <= 0;
		end else begin
			cnt <= cnt + 1;
		end
	end
end

// -----------------sel-----------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt2 <= 0;
	end else if (cnt > 0 && cnt < 67)begin
		cnt2 <= ~cnt2;
	end else begin
		cnt2 <= 0;
	end
end
assign mask1 = 2'b10;
assign sel = mask1[cnt2];
// -----------------do_en-----------------
/*
always @(posedge clk) begin
	if (cnt > 1 && cnt < 67) begin
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
		do_en_r <= (cnt >= 2 && cnt <= 65);
	end
end
assign do_en = do_en_r;

endmodule


