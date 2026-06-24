vlib work
vlog "../tb/testbench.v"
vsim -debugDB -voptargs=+acc work.tb;
add wave -r /tb/*
run -all
view schematic 
add schematic /tb/DUT