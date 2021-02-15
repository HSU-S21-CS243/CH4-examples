//Loop R0 times
@R0
D=M

//store current loop value in variable
@loop_counter
M=D

//only loop when loop counter is positive
@:loop_end
D;JLT

(:loop_start)
@loop_counter
MD=M-1 //sub 1 from loop counter
@:loop_start
D;JGT

(:loop_end)
@:loop_end
0;JMP