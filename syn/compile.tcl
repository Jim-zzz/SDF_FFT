

set toplevel chip_top

#settng operating condition & wire load
set_operating_conditions -min_library fast -min fast  -max_library slow -max slow
set_wire_load_model -name tsmc18_wl10 -library slow

#set driving and load
set_drive 0.1 [all_inputs]
set_load 6 [all_outputs]

#constraints
# 145MHz main clk
create_clock -name clk -period 7.142 -waveform {0 3.571} [get_ports clk]
# create_clock -name clk -period 7.142 -waveform {0 3.571} [get_ports clk]
set_fix_hold [get_clocks clk]
set_dont_touch_network [get_clocks clk]
set_ideal_network         [get_ports clk]


#uncertainty
set_clock_uncertainty 0.2 [get_clocks clk]


#clk lantency
set_clock_latency 	  0.5 [get_clocks clk]

#clk transition time
set_input_transition 0.3 [all_inputs]
set_clock_transition 0.1 [all_clocks]

#setting input / output delay
set_input_delay -clock clk -max 4.285 [remove_from_collection [all_inputs] [get_ports "clk"]]
set_input_delay -clock clk -min 0 [remove_from_collection [all_inputs] [get_ports "clk"]]
set_output_delay -clock clk 4.285 [all_outputs]

#setting DRC & check design 
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
set_max_area 0
set_max_fanout 20 [all_inputs]
set_max_transition 0.3 [all_inputs]
set_max_capacitance 0.2 [all_inputs]


check_design -multiple_designs
compile -incremental_mapping -map_effort high -area_effort high -power_effort high
# compile_ultra -retime
#save design 
set filename [format "%s%s" $toplevel "_opt.ddc"]
write -format ddc -hierarchy -output $filename

# save delay and parasitic data
set filename [format "%s%s" $toplevel ".sdf"]
write_sdf -version 2.1 -load_delay net $filename

# save synthesized verilog netlist
set filename [format "%s%s" $toplevel "_syn.v"]
write -format verilog -hierarchy -output $filename

# this file is necessary for P&R with Encounter
set filename [format "%s%s" $toplevel ".sdc"]
write_sdc $filename

redirect [format "%s%s" $toplevel _design.repC] { report_design }
redirect [format "%s%s" $toplevel _area.repC] { report_area }
redirect -append [format "%s%s" $toplevel _area.repC] { report_area  -hierarchy }
redirect [format "%s%s" $toplevel _reference.repC] { report_reference }
redirect [format "%s%s" $toplevel _latches.repC] { report_register -level_sensitive }
redirect [format "%s%s" $toplevel _flops.repC] { report_register -edge }
redirect [format "%s%s" $toplevel _violators.repC] { report_constraint -all_violators }
redirect [format "%s%s" $toplevel _power.repC] { report_power }
redirect [format "%s%s" $toplevel _max_timing.repC] { report_timing -delay max -nworst 3 -max_paths 20 -greater_path 0 -path full -nosplit }
redirect [format "%s%s" $toplevel _min_timing.repC] { report_timing -delay min -nworst 3 -max_paths 20 -greater_path 0 -path full -nosplit }
redirect [format "%s%s" $toplevel _out_min_timing.repC] { report_timing -to [all_outputs] -delay min -nworst 3 -max_paths 1000 -greater_path 0 -path full -nosplit}






