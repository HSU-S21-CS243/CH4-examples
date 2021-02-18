(:main)

    //read first number
    //store return address into R0
    @:read_result_1 //
    D=A
    @R0
    M=D
 
    //call get from keyboard
    @:get_number_from_keyboard
    0;JMP

    (:read_result_1)
    //result should be in R1
    @R1
    D=M
    @first_result
    M=D

    //read second number
    //store return address into R0
    @:read_result_2
    D=A
    @R0
    M=D
 
    //call get from keyboard
    @:get_number_from_keyboard
    0;JMP

    (:read_result_2)
    //result should be in R1
    @R1
    D=M
    @second_result
    M=D

    //sum the two numbers together
    @first_result
    D=M+D
    
    @R0
    M=D

    @:program_end
    0;JMP

//the following code is used to grab a number from the user
//return value will be placed in R1
//function execution will resume on value placed in R0
(:get_number_from_keyboard)
    @last_key_press

    //"0" in ASCII is 48
    @48
    D=A
    @ascii_zero
    M=D
    @57
    D=A
    @ascii_nine
    M=D

    @current_number

    //listen for keyboard input until key press is the "enter" key
    (:get_number_from_keyboard_loop)

        //reads last key into last_key_press variable
        @KBD
        D=M
        @last_key_press
        M=D

        //The following JMPs are equivalent to the C++ of...
        //if(@last_key_press >= '0' && @last_key_press <= '9')
        //did we get a numeric key press
        @last_key_press
        D=M
        @ascii_zero
        D=D-M

        //if D is negative, definitely not a number
        @:check_for_exit
        D;JLT

        //if we get to this spot in the code, then 
        //the last key press MUST be greater than "0"
        @last_key_press
        D=M
        @ascii_nine
        D=D-M

        //greater than 0 means the key press was larger than "9"
        @:check_for_exit
        D;JGT

        //If we get here, @last_key_press MUST be at least "0"
        //and no greater than "9"

        //Convert last_key_press from ASCII into numeric version
        //store in current_number
        @last_key_press
        D=M
        @ascii_zero
        D=D-M
        @current_number
        M=D

        (:check_for_exit)
        //IF D == 128, then end program
        @last_key_press
        D=M
        @128 //value of "enter" in keyboard
        D=D-A
        @:function_end
        D;JEQ

        //ELSE, go back to start
        @:get_number_from_keyboard_loop
        0;JMP
    (:function_end)

    //storing the number we read into the return value
    @current_number
    D=M
    @R1
    M=D

    //jump to calling function (e.g. main())
    @R0
    A=M
    0;JMP

(:program_end)
    @:program_end
    0;JMP