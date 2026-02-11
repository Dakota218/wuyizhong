#Read All Files
#read_file -format verilog  CONVEX.v
#read_file -format sverilog  fc1.sv

analyze -format sverilog sr_conv_channel.sv
analyze -format sverilog sr_conv.sv
elaborate SR_CONV
current_design SR_CONV
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

write -format ddc     -hierarchy -output "sr_conv_syn.ddc"
write_sdf -version 1.0  sr_conv_syn.sdf
write -format verilog -hierarchy -output sr_conv_syn.v
report_area > sr_conv_area.log
report_timing > sr_conv_timing.log
report_qor   >  sr_conv_syn.qor
#write_parasitics -output CONVEX_syn.spef