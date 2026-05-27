`timescale 1ns/1ps
module test;

parameter WIDTH  = 12; 
parameter N      = 6427;   // 輸入行數

reg clk;
reg di_en;
reg reset;
reg  [WIDTH-1:0] x_re;
reg  [WIDTH-1:0] x_im;
wire [WIDTH-1:0] y_re;
wire [WIDTH-1:0] y_im;
wire do_en;

// ================= DUT =================
FFT64 s0 (
	.clk   (clk),
	.di_en (di_en),
	.reset (reset),
	.x_re  (x_re),
	.x_im  (x_im),
	.y_re  (y_re),
	.y_im  (y_im),
	.do_en (do_en)
);

// =============== FSDB ===============
initial begin
	$fsdbDumpfile("wave.fsdb");
	$fsdbDumpvars(0, test);
end

// =============== Clock ===============
always #4.032 clk = ~clk;  // 8.064 ns period

// =============== Reset / Enable ===============
initial begin
	clk   = 0;
	di_en = 0;
	x_re  = {WIDTH{1'b0}};
	x_im  = {WIDTH{1'b0}};
	reset = 1;
	repeat (20) @(posedge clk);
	reset = 0;
	#3;
	di_en = 1;
end

// =============== 逐拍讀入 l1_1.txt ===============
// l1_1.txt 每行兩個 12-bit HEX： "RE IM" 例如 "0AC 000"
integer fin_in;
integer in_rcode;
integer in_count;
reg [WIDTH-1:0] in_re, in_im;

initial begin
	fin_in = $fopen("l1_1.txt", "r");
	if (fin_in == 0) begin
		$display("ERROR: Cannot open l1_1.txt");
		$finish;
	end
	in_count = 0;
	wait (di_en == 1);
	@(posedge clk);

	// 逐拍送資料
	while ((in_count < N) && (!$feof(fin_in))) begin
		in_rcode = $fscanf(fin_in, "%h %h\n", in_re, in_im);
		if (in_rcode == 2) begin
			x_re <= in_re;
			x_im <= in_im;
			in_count = in_count + 1;
		end else begin
			$display("WARN: bad input format at line %0d of l1_1.txt", in_count+1);
		end
		@(posedge clk);
	end

	// 送完清零避免殘影（Verilog 寫法）
	x_re <= {WIDTH{1'b0}};
	x_im <= {WIDTH{1'b0}};
	$fclose(fin_in);
end

// =============== 輸出寫檔 + 與 ans1.txt 比對 ===============
integer fout;                 // 輸出檔
integer fin_ans;              // 答案檔
integer ans_total;            // 答案總行數
integer cmp_idx;              // 已比對行數 (0-based)
integer pass_cnt, fail_cnt;   // 統計
integer first_fail_line;      // 第一個錯誤行 (1-based)
reg [WIDTH-1:0] ans_re, ans_im;
integer rcode;

// --- 開啟輸出檔 ---
initial begin
	fout = $fopen("FFT64_l1_1.txt", "w");
	if (fout == 0) begin
	    $display("ERROR: Failed to open FFT64_l1_1.txt");
	    $finish;
	end
end

// --- 統計 ans1.txt 行數並重新開啟供逐拍比對 ---
initial begin : COUNT_ANS_LINES
	integer tmp_re, tmp_im;
	ans_total = 0;

	fin_ans = $fopen("ans1.txt", "r");
	if (fin_ans == 0) begin
		$display("ERROR: Cannot open ans1.txt");
		$fclose(fout);
		$finish;
	end

	while (!$feof(fin_ans)) begin
		rcode = $fscanf(fin_ans, "%h %h\n", tmp_re, tmp_im);
		if (rcode == 2) ans_total = ans_total + 1;
	end
	$fclose(fin_ans);

	fin_ans = $fopen("ans1.txt", "r");
	if (fin_ans == 0) begin
		$display("ERROR: Cannot reopen ans1.txt");
		$fclose(fout);
		$finish;
	end

	cmp_idx         = 0;
	pass_cnt        = 0;
	fail_cnt        = 0;
	first_fail_line = 0;
end

// --- 每逢 do_en：寫出一行 + 從 ans1.txt 讀一行比對 ---
always @(posedge clk) begin
	if (do_en) begin
		// 1) 寫 DUT 輸出
		$fdisplay(fout, "%03X %03X", y_re, y_im);

		// 2) 讀一行答案
		if (!$feof(fin_ans)) begin
			rcode = $fscanf(fin_ans, "%h %h\n", ans_re, ans_im);
		end else begin
			rcode = 0; // 答案檔不足
		end

		// 3) 比對（使用 == 避免 X/Z 嚴格比對問題；要嚴格可換成 !==）
		if (rcode != 2) begin
			fail_cnt = fail_cnt + 1;
			if (first_fail_line == 0) first_fail_line = cmp_idx + 1;
			$display("MISMATCH/READERR @ line %0d : got=%03X %03X  exp=? ?", 
			          cmp_idx + 1, y_re, y_im);
		end else if ((y_re != ans_re) || (y_im != ans_im)) begin
			fail_cnt = fail_cnt + 1;
			if (first_fail_line == 0) first_fail_line = cmp_idx + 1;
			$display("MISMATCH @ line %0d : got=%03X %03X  exp=%03X %03X", 
			          cmp_idx + 1, y_re, y_im, ans_re, ans_im);
		end else begin
			pass_cnt = pass_cnt + 1;
		end

		cmp_idx = cmp_idx + 1;

		// 4) 比到與答案行數相同就收尾
		if (cmp_idx == ans_total) begin
			$display("\n===== Compare Summary =====");
			$display(" Total lines : %0d", ans_total);
			$display(" Pass        : %0d", pass_cnt);
			$display(" Fail        : %0d", fail_cnt);
			if (fail_cnt > 0)
				$display(" First fail  : line %0d", first_fail_line);
			else
				$display(" All matched!");

			$fclose(fin_ans);
			$fclose(fout);
			$finish;
		end
	end
end

// =============== 超時保護 ===============
initial begin
	#3000000; // 3 ms
	$display("TIMEOUT: force close.");
	$fclose(fin_ans);
	$fclose(fout);
	$finish;
end

endmodule

