//use the keyboard to "paint" our screen

//key_right = 132
//left_key = 130

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

//if right key was pressed, increment X pos
@132
D=D-A
@:paint_screen
D;JNE

//this code only executes when right key was pressed
@x_pos
M=M+1

//paint at key
(:paint_screen)
@SCREEN
D=A
@x_pos
A=D+M
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