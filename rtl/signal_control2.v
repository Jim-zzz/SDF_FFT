`timescale 1ns/1ps
module signal_control2
(
	input clk,
	input reset,
	input di_en,
	output sel,
	output do_en,
	output [3:0] addr
);
reg start_count;
reg do_en_r;
reg [3:0] addr_r;
reg [6:0] cnt;
reg [2:0] cnt2;
reg [3:0] cnt3;
wire [7:0] mask1;

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
	end else if (cnt > 3 && cnt < 75)begin
		cnt2 <= cnt2 + 1;
	end else begin
		cnt2 <= 0;
	end
end
assign mask1 = 8'b0001_1110;
assign sel = mask1[cnt2];

// -----------------addr-----------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt3 <= 0;
	end else if (cnt > 3 && cnt < 75)begin
		cnt3 <= cnt3 + 1;
	end else begin
		cnt3 <= 0;
	end
end 
always @(posedge clk or posedge reset) begin
	if (reset) begin
		addr_r <= 0;	
	end else if (cnt3 >= 0 && cnt3 <= 4) begin
		addr_r <= 0;
	end else if (cnt3 >= 5 && cnt3 <= 7) begin
		addr_r <= (cnt3-4) << 1;
	end else if (cnt3 >= 8 && cnt3 <= 11) begin
		addr_r <= cnt3 - 8;
	end else if (cnt3 >= 12 && cnt3 <= 15) begin
		addr_r <= (cnt3 - 12) * 3;
	end 
end

assign addr = addr_r;

// -----------------do_en-----------------
/*
always @(posedge clk) begin
	if (cnt > 9 && cnt < 75) begin
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
		do_en_r <= (cnt >= 10 & cnt <= 74);
	end
end
assign do_en = do_en_r;

endmodule


