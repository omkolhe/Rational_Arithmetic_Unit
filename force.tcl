 vsim work.rau 
# Start time: 17:43:18 on May 05,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.dadda_utils(body)
# Loading work.rationals(body)
# Loading work.rau(rtl)
# Loading work.gcd_1(slow_arch)
# Loading work.gcd_iter1(slow_arch)
# ** Warning: Design size of 12586 statements exceeds ModelSim-Intel FPGA Starter Edition recommended capacity.
# Expect performance to be adversely affected.
add wave -position insertpoint  \
sim:/rau/a \
sim:/rau/b \
sim:/rau/c \
sim:/rau/d \
sim:/rau/op \
sim:/rau/clk \
sim:/rau/reset \
sim:/rau/y_n \
sim:/rau/y_d \
sim:/rau/overflow_num \
sim:/rau/overflow_den \
sim:/rau/ready \
sim:/rau/num1 \
sim:/rau/num2 \
sim:/rau/temp \
sim:/rau/gcd_out \
sim:/rau/gcd \
sim:/rau/y_num \
sim:/rau/y_den \
sim:/rau/rst \
sim:/rau/reset_1 \
sim:/rau/rdy \
sim:/rau/start \
sim:/rau/gcd_ready \
sim:/rau/ready_1 \
sim:/rau/ready_2 \
sim:/rau/op1 \
sim:/rau/x \
sim:/rau/y \
sim:/rau/start_gcd \
sim:/rau/sign_bit \
sim:/rau/gcd_in_a \
sim:/rau/gcd_in_b \
sim:/rau/y_n_out \
sim:/rau/y_d_out \
sim:/rau/OP_ADD \
sim:/rau/OP_SUB \
sim:/rau/OP_MUL \
sim:/rau/OP_DIV
add wave -position insertpoint sim:/rau/GCD2/*
force -freeze sim:/rau/a 10#5 0
force -freeze sim:/rau/b 10#3 0
force -freeze sim:/rau/c 10#3 0
force -freeze sim:/rau/d 10#6 0
force -freeze sim:/rau/op 00 0
force -freeze sim:/rau/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/rau/reset 1 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'tn' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'td' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'tn1' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'td1' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'tn' IN REDUCE is 39
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Note: The value of 'td' IN REDUCE is 18
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Note: The value of 'tn1' IN REDUCE is 39
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Note: The value of 'td1' IN REDUCE is 18
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'tn' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'td' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'tn1' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'td1' IN REDUCE is 0
#    Time: 0 ps  Iteration: 0  Instance: /rau
# ** Note: The value of 'tn' IN REDUCE is 39
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Note: The value of 'td' IN REDUCE is 18
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Note: The value of 'tn1' IN REDUCE is 39
#    Time: 0 ps  Iteration: 1  Instance: /rau
# ** Note: The value of 'td1' IN REDUCE is 18
#    Time: 0 ps  Iteration: 1  Instance: /rau
force -freeze sim:/rau/reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run



force -freeze sim:/rau/a 1111111111111011 0
force -freeze sim:/rau/a 1111111111111011 0
run
# ** Note: The value of 'tn' IN REDUCE is 21
#    Time: 6500 ps  Iteration: 2  Instance: /rau
# ** Note: The value of 'td' IN REDUCE is 18
#    Time: 6500 ps  Iteration: 2  Instance: /rau
# ** Note: The value of 'tn1' IN REDUCE is 21
#    Time: 6500 ps  Iteration: 2  Instance: /rau
# ** Note: The value of 'td1' IN REDUCE is 18
#    Time: 6500 ps  Iteration: 2  Instance: /rau
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/rau/reset 1 0
run
force -freeze sim:/rau/reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run

