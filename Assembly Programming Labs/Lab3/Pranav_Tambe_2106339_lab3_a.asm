.data
    input_string: .space 128 # allocate space for the input string
    output_string: .space 128 # allocate space for the reversed string
    string_one: .asciiz "Enter the string :"
    string_two: .asciiz "Reverse  string :"

.text # tells assembler to switch to the text segment or succeeding lines contains instructions

main:  # start of code section

    # for printing   string 
    li $v0, 4
    la $a0,string_one
    syscall

    # read the string into the input buffer
    li $v0, 8 # Load the value 8 into the register $v0  
    la $a0, input_string  # Load the address of the string "input_string" into the register $a0
    li $a1, 128 # Load the value 128 into the register $a1
    syscall # Call the system call with number stored in $v0, using the values stored in $a0 and $a1 as arguments

    # find the length of the string
    la $t0, input_string # load address of input_string in $t0
    add $t1, $t0, $0 # t1 = t0 = address of input_string
    add $t2, $t1, 128 # t2 = address of end of input_string
    li $t3, 0 # t3 = length of string

    loop:
        beq $t1, $t2, end_loop # if t1 == t2, end loop
        lb $t4, 0($t1) # t4 = value at memory location t1
        beq $t4, 0, end_loop # if t4 == 0, end loop
        addi $t1, $t1, 1 # t1 = t1 + 1
        addi $t3, $t3, 1 # t3 = t3 + 1
        j loop

    end_loop:
        # copy the string in reversed order to the output buffer
        add $t1, $t0, $t3 # t1 = address of end of input_string
        add $t2, $t0, 0 # t2 = address of start of input_string
        la $t5, output_string
        li $t6, 0 # t6 = length of output_string

    reverse_loop:
        beq $t1, $t2, end_reverse_loop # if t1 == t2, end loop
        addi $t1, $t1, -1 # t1 = t1 - 1
        lb $t4, 0($t1) # t4 = value at memory location t1
        sb $t4, 0($t5) # store t4 at memory location t5
        addi $t5, $t5, 1 # t5 = t5 + 1
        addi $t6, $t6, 1 # t6 = t6 + 1
        j reverse_loop

    end_reverse_loop:

        li $v0, 4
        la $a0,string_two
        syscall
        # print the reversed string
        li $v0, 4
        la $a0, output_string
        syscall

    # exit program
    li $v0, 10
    syscall
