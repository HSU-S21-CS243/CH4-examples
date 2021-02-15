//Goal: look at R0 (memory address 0)  For N ... 0, put the corresponding 
//value of N into the corresponding memory address.

//E.g. if R0 = 5, then
//R1 = 4
//R2 = 3
//R3 = 2
//R4 = 1
//R5 = 0

@R0
M=M-1

//this loop counts up from the last register and works towards R1
(:loop_begin)

    //go to last register, read value from last + 1 register
    //store 1 more than that value.  Assumes last + 1 register is set to 0
    @R0
    A=M
    A=A+1
    D=M
    @R0
    A=M
    M=D+1

    //decrement counter
    @R0
    D=M-1
    M=D
    @:loop_begin
    D;JGT

(:end_of_program)
    @:end_of_program
    0;JMP