# operating conditions and boundary conditions #

set cycle_time 5.1
create_clock -name clk  -period $cycle_time   [get_ports  clk] 

set_dont_touch_network      [all_clocks]
set_clock_uncertainty  -setup 0.1  [all_clocks]
set_clock_uncertainty  -hold 0.1  [all_clocks]
set_clock_latency      0.5  [all_clocks]
set_ideal_network           [get_ports clk]
#set_boundary_optimization [get_designs fc1_column] false
#set_ungroup [get_designs fc1_column] false
set_critical_range 1.0 [current_design]
#Don't touch the basic env setting as below

set_input_delay  -max 1   -clock clk -clock_fall [remove_from_collection [all_inputs] [get_ports clk]] 
set_input_delay  -min 0   -clock clk -clock_fall [remove_from_collection [all_inputs] [get_ports clk]] 
set_output_delay 1    -clock clk [all_outputs]  
#set_min_delay 0.2 -from [get_regs sum_temp[*]] -to [get_regs sum_temp[*]]
set_load         1   [all_outputs]
set_drive        0.1   [all_inputs]

set_operating_conditions -max_library slow -max slow
set_wire_load_model -name tsmc13_wl10 -library slow                        
set_max_fanout 10 [all_inputs]
                     

