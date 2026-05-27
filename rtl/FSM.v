`timescale 1ns/1ps
module FSM
(
	input clk,
	input reset,
	output sel,
	output bf_nj,
	output do_en 

);
reg do_en_r;
reg [1:0] state1, next_state1;
reg [1:0] state2, next_state2;
//reg [1:0] state3, next_state3;

parameter IDLE1 = 0, SEL = 1;
parameter IDLE2 = 0, NJ = 1;
//parameter IDLE3 = 0, DO = 1;

reg [6:0] cnt;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt <= 0;
	end else if (cnt == 100)begin
		cnt <= 0;
	end	else begin
		cnt <= cnt + 1;
	end
end


// ---------------SEL-----------------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		state1 <= IDLE1;
	end else begin
		state1 <= next_state1;
	end
end

always @(*) begin
	case (state1)
		IDLE1: next_state1 = (cnt == 32) ? SEL : IDLE1;
		SEL:  next_state1 = (cnt == 65) ? IDLE1 : SEL;
		default: next_state1 = IDLE1;
	endcase
end

assign sel = (state1 == SEL);

// ---------------NJ-----------------------
always @(posedge clk or posedge reset) begin
	if (reset) begin
		state2 <= IDLE2;
	end else begin
		state2 <= next_state2;
	end
end

always @(*) begin
	case (state2)
		IDLE2: next_state2 = (cnt == 82) ? NJ : IDLE2;
		NJ:    next_state2 = (cnt == 98) ? IDLE2 : NJ;
		default: next_state2 = IDLE2;
	endcase
end

assign bf_nj = (state2 == NJ);

// ---------------DO-----------------------
/*
always @(posedge clk or posedge reset) begin
	if (reset) begin
		state3 <= IDLE3;
	end else begin
		state3 <= next_state3;
	end
end

always @(*) begin
	case (state3)
		IDLE3: next_state3 = (cnt == 36) ? DO : IDLE3;
		DO:    next_state3 = (cnt == 101) ? IDLE3 : DO;
		default: next_state3 = IDLE3;
	endcase
end
*/


always @(posedge clk or posedge reset) begin
	if (reset) begin
		do_en_r	<= 0;
	end else begin
		do_en_r <= (cnt >= 36 && cnt <= 100);
	end
end

assign do_en = do_en_r;






endmodule
