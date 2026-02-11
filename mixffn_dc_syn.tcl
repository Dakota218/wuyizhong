#Read All Files
#read_file -format verilog  CONVEX.v
#read_file -format sverilog  fc1.sv

analyze -format sverilog fc1_column.sv
analyze -format sverilog fc1.sv
analyze -format sverilog fc2_column.sv
analyze -format sverilog fc2.sv
analyze -format sverilog dwconv_channel.sv
analyze -format sverilog dwconv.sv
analyze -format sverilog gelu_lut.sv
analyze -format sverilog mixffn.sv
elaborate mixffn
current_design mixffn
link
#Setting Clock Constraints
source -echo -verbose fc1.sdc

set_fix_hold                [all_clocks]
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
#set_max_area 0
#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile_ultra -incremental

write -format ddc     -hierarchy -output "mixffn_syn.ddc"
write_sdf -version 1.0  mixffn_syn.sdf
write -format verilog -hierarchy -output mixffn_syn.v
report_area > mixffn_area.log
report_timing > mixffn_timing.log
report_qor   >  mixffn_syn.qor
#write_parasitics -output CONVEX_syn.spef