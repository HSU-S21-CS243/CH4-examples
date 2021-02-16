//use the keyboard to "paint" our screen

@last_key_press
@x_pos //defines x position of our paint cursor
@y_pos //defines y position of our paint cursor

//listen for keyboard input until key press is the "enter" key
(:program_start)

//reads last key into last_key_press variable
@KBD
D=M
@last_key_press
M=D

//paint at key
@SCREEN
A=A+D
M=-1

//IF D == 128, then end program
@last_key_press
D=M
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