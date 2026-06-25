vlib work
 
vlog elevator.v
vlog elevator_tb.v
 
vsim work.elevator_tb
 
add wave -divider "Inputs"
add wave clk
add wave rst
add wave req
 
add wave -divider "Outputs"
add wave current_floor
add wave direction
add wave door_open
 
 
run -all