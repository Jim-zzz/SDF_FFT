`timescale 1ns/1ps
module test;


parameter WIDTH = 12; 
parameter DEPTH1 = 31;
parameter DEPTH2 = 15;
parameter DEPTH3 = 7;
parameter DEPTH4 = 3;
parameter DEPTH5 = 1;
parameter N = 64;

reg clk;
reg di_en;
reg reset;
reg [WIDTH-1:0] x_re;
reg [WIDTH-1:0] x_im;
wire [WIDTH-1:0] y_re;
wire [WIDTH-1:0] y_im;
wire do_en;

reg [WIDTH-1:0] y_re_mem [0:N-1];
reg [WIDTH-1:0] y_im_mem [0:N-1];	
reg [WIDTH-1:0] x_data [0:N] [0:1];
reg [WIDTH-1:0] y_data [0:N-1] [0:1];

function [WIDTH-1:0] abs;
    input signed [WIDTH-1:0] val;
    begin
        if (val < 0) abs = -val;
        else         abs = val;
    end
endfunction


FFT64 s0 
(
	.clk(clk),
	.di_en(di_en),
	.reset(reset),
	.x_re(x_re),
	.x_im(x_im),
	.y_re(y_re),
	.y_im(y_im),
	.do_en(do_en)

);

initial begin
    $sdf_annotate("chip_top.sdf", s0);
end

initial begin
	$fsdbDumpfile("wave.fsdb");
	$fsdbDumpvars(0,test);
end

initial begin
	$readmemh("input10.txt", x_data);
	$readmemh("output10_FFT64.txt", y_data);
end
// load
integer fout;
integer counter;

initial begin
	fout = $fopen("FFT64_output10.txt", "w");
	if (fout == 0) begin
	    $display("Failed to open output.txt");
	    $finish;
	end
	counter = 0;
end

//124Mhz
always #4.032 clk = ~clk;

initial begin
	clk = 0;
	di_en = 0;
	x_re = 0;
	x_im = 0;
	reset = 1;
	repeat (20) @(posedge clk);
	reset = 0;
	#3;
	di_en = 1;
	#20000;

	$finish;
end

integer i;
initial begin
	@(posedge di_en);
	#1;
	for (i=0; i<=N; i=i+1) begin
		@(posedge clk); 
			x_re <= x_data[i][0];
			x_im <= x_data[i][1];
	end
end
//load y to mem for comparing
reg [6:0] cnt;
reg mem_en;
initial begin
	mem_en = 0;
	@(posedge do_en);
	mem_en = 1;
	repeat (65) @(posedge clk);
	mem_en = 0;
end

always @(posedge clk) begin
	if(do_en && mem_en) begin
		y_re_mem[cnt] = y_re;
		y_im_mem[cnt] = y_im;
		cnt <= cnt + 1;
		$display ("index: %d y_re_mem = %h  y_im_mem = %h", cnt, y_re_mem[cnt], y_im_mem[cnt]);
		
		if (cnt == 7'd64) begin
			$fclose (fout);
		end				
		else begin
			$fwrite (fout, "%h %h\n", $signed(y_re_mem[cnt]), $signed(y_im_mem[cnt]));
		end
	end
	else begin
		cnt <= 7'd0;
	end
end


	
// compare 
wire en;
reg [63:0] out;
initial begin 
    #10000;
    for (i = 0; i < N; i = i + 1) begin
        if (abs(y_re_mem[i] - y_data[i][0]) <= 20 || abs(y_im_mem[i] - y_data[i][1]) <= 20) begin
            out[i] = 1;
            if (abs(y_re_mem[i] - y_data[i][0]) <= 20  && abs(y_re_mem[i] - y_data[i][0]) > 0 || abs(y_im_mem[i] - y_data[i][1]) <= 20 && abs(y_im_mem[i] - y_data[i][1]) > 0) begin
                $display ("your_index: %d y_re_mem = %h  y_im_mem = %h", i, y_re_mem[i], y_im_mem[i]);
                $display ("true_index: %d     y_re = %h      y_im = %h ", i, y_data[i][0], y_data[i][1]);
                $display ("error_value_re: %d | error_value_re: %d", abs(y_re_mem[i] - y_data[i][0]), abs(y_im_mem[i] - y_data[i][1]));				
            end
        end else begin
            $display ("error_index: %d y_re_mem = %h  y_im_mem = %h", i, y_re_mem[i], y_im_mem[i]);
            $display (" true_index: %d     y_re = %h      y_im = %h ", i, y_data[i][0], y_data[i][1]);
            out[i] = 0;
        end
    end
end
// when out = 1111..., en = true
assign en = (&out);	
	
initial begin
	#15000;

	if(en == 1) begin
		$display("\n");
		$display("=====================");
		$display("⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡀");
		$display("⠀⠀⠀⢀⡞⠉⠳⢤⣀⣤⣤⣀⣀⡤⠞⠀⠸⡄");
		$display("⠀⠀⠀⣸⠀⠀⠀⠀⢀⣠⠔⠳⣄⡀⠀⠀⢀⣓");
		$display("⠀⡰⠋⠉⠛⠛⠛⢛⠉⠀⠀⠀⠀⠌⠉⠉⠁⠀⠉⢦");
		$display("⣰⠁⠀⠀⠀⠀⢀⡔⢢⠀⠀⠀⢠⡖⣢⠀⠀⠀⠀⠈⣧");
		$display("⡇⠀⠀⠀⢀⢀⡈⠛⠋⠀⢀⠀⠈⠛⢋⣀⡀⡀⠀⠀⣹");
		$display("⠹⣴⠲⡀⠉⠁⠁⠀⠀⠸⣛⡺⠀⠀⠈⠁⠁⠁⠀⢠⠇");
		$display("⠀⠈⢇⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠋");
		$display("⠀⠀⠈⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡦⣑⡆");
		$display("⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠞");
		$display("⠀⠀⠀⠀⠀⠈⠳⢤⣀⡀⠀⠀⠀⢀⢴⣛⣛⡷");
		$display("⠀⠀⠀⠀⠀⠀⠀⠀⠘⠭⠋⠲⠽");
		$display("       successful    ");
		$display("=====================");
		$display("\n");
	end
	else begin
		$display("\n");
		$display("==============================");
		$display("⠀⠀⠀⠀⠀⠀⢀⡤⢤⣀⣤⠤⠤⠶⠶⠶⠶⠤⠤⣤⡶⠶⣄");
		$display("⠀⠀⠀⠀⠀⠀⠺⣇⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠠⠟⢤⡀");
		$display("⠀⠀⠀⠀⢠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦");
		$display("⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧");
		$display("⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⢹");
		$display("⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣉⣁⠀⠀⠀⠀⢈⣙⡀⠀⠙⠀⠀⠀⠀⠀⢸⠃");
		$display("⠀⠀⠀⠈⣇⠀⠀⣀⣀⢀⣗⡺⠀⠀⠀⠀⠺⣒⡇⠀⠀⠀⠀⠀⠀⠀⣾");
		$display("⠀⠀⠀⠀⠘⢧⡀⠁⠃⠉⠀⠀⠀⠲⣳⠶⠀⠀⠀⠃⠃⠁⠀⠀⢀⡼⠃");
		$display("⠀⠀⠀⠀⠀⠀⠙⡖⠀⠀⢀⣀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎");
		$display("⡄⡠⠂⣠⡄⠀⠀⣧⠠⣄⣙⣻⡇⠀⠀⠀⣤⠤⠖⠀⠀⠀⠀⢀⡇");
		$display("⠩⠂⠊⠞⠂⠂⠀⠘⢧⠀⠉⢹⠄⢀⣀⢠⡌⠙⠋⠁⠀⠀⣠⡾⠃");
		$display("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠶⠬⢥⣤⢸⡏⢠⣤⣤⣤⠴⠾⠋");
		$display("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠆");
		$display ("             false");
		$display("==============================");
		$display("\n");
	end

end

endmodule
