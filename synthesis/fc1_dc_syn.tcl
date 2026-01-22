#Read All Files
#read_file -format verilog  CONVEX.v
#read_file -format sverilog  fc1.sv

analyze -format sverilog fc1_column.sv
analyze -format sverilog fc1.sv
elaborate fc1
current_design fc1
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

write -format ddc     -hierarchy -output "fc1_syn.ddc"
write_sdf -version 1.0  fc1_syn.sdf
write -format verilog -hierarchy -output fc1_syn.v
report_area > fc1_area.log
report_timing > fc1_timing.log
report_qor   >  fc1_syn.qor
#write_parasitics -output CONVEX_syn.spef