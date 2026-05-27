module FSM2
(
	input clk,
	input reset,
	input di_en,
	output sel,
	output do_en
);


reg do_en_r;
reg state1, next_state1;
//reg state2, next_state2;

parameter IDLE1 = 0, SEL = 1;
//parameter IDLE2 = 0, DO = 1;

reg [6:0] cnt;
reg start_count;


always @(negedge clk or posedge reset) begin
	if (reset) begin
        start_count <= 0;		
	end else if (di_en) begin
        start_count <= 1;
	end
end
always @(posedge clk or posedge reset) begin
    if (reset)
        cnt <= 0;
    else if (start_count) begin
        if (cnt == 100)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end
end

// ----------------------SEL----------------------
always @(*) begin
	case (state1) 
		IDLE1: next_state1 = (cnt == 16 || cnt == 48) ? SEL : IDLE1;
		SEL:   next_state1 = (cnt == 32 || cnt == 64) ? IDLE1 : SEL;
	endcase
end


always @(posedge clk or posedge reset) begin
	if (reset) begin
		state1 <= IDLE1;
	end else begin
		state1 <= next_state1;
	end
end

assign sel = (state1 == SEL);
// ----------------------DO----------------------

/*
always @(*) begin
	case (state2)
		IDLE2: next_state2 = (cnt == 22) ? DO : IDLE2;
		DO:    next_state2 = (cnt == 87) ? IDLE2 : DO;
	endcase
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state2 <= IDLE2;
	end else begin
		state2 <= next_state2;
	end
end
*/
always @(posedge clk or posedge reset) begin
	if (reset) begin
		do_en_r <= 0;
	end else begin
		do_en_r <= (cnt >= 22 && cnt <= 86);
	end
end
assign do_en = do_en_r;

endmodule



