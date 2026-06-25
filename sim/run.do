vlib work
vlog "../tb/testbench.v"
vsim -debugDB -voptargs=+acc work.tb;
do wave.do
run -all
view schematic 
add schematic /tb/DUT