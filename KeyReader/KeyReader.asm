//listen for keyboard input until key press is the "enter" key
(:program_start)
@KBD
D=M
@R0
M=D

//IF D == 128, then end program
@128 //value of "enter" in keyboard
D=D-A
@:program_end
D;JEQ

//ELSE, go back to start
@:program_start
0;JMP

(:program_end)
@:program_end
0;JMP