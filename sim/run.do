vlib work
vlog "../tb/testbench.v"
vsim -debugDB -voptargs=+acc work.tb;
# do wave.do
add wave -r *
run -all
# view schematic 
# add schematic /tb/DUT