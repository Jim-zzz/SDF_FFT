# 設定 top-level 名稱
set top_level "FFT64"

sh mkdir work
# 設定唯一使用的 design library（避免重複）
define_design_lib work -path ./work

# 設定 search_path（找 RTL 檔）
set_app_var search_path "../rtl $search_path"

# 載入 RTL
analyze -format verilog {
	../rtl/FFT64.v
	../rtl/sdfunit1.v
	../rtl/sdfunit2.v
	../rtl/sdfunit3.v
	../rtl/sdfunit4.v
	../rtl/sdfunit5.v
	../rtl/sdfunit6.v
	../rtl/multiply.v
	../rtl/carry_select_adder2.v
	../rtl/ha.v
	../rtl/full_adder.v
	../rtl/carry_generator.v
	../rtl/twiddle2.v 
	../rtl/twiddle3.v
	../rtl/FSM.v
	../rtl/FSM2.v
	../rtl/delaybuffer.v
	../rtl/delaybuffer2.v
	../rtl/signal_control.v
	../rtl/signal_control2.v
	../rtl/signal_control3.v
	../rtl/signal_control4.v
	../rtl/butterfly.v
	../rtl/butterfly2.v
	
}

# 建立設計階層
elaborate $top_level
uniquify
# 顯示目前有哪些設計
list_designs

