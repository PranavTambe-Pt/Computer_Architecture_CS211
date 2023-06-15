.data
    vector_1: .word 0 , 0, 0, 0, 0 
    vector_2: .word 0 , 0, 0, 0, 0
    string_1: .asciiz "Enter the value in 1st vector at the index "
    string_2: .asciiz "Enter the value in 2nd vector at the index "
    string_3: .asciiz " :"
    string_4: .asciiz "The dot product is :"

.text # tells assembler to switch to the text segment or succeeding lines contains instructions

main: # start of code section
        li $t0, 0 # initialize loop counter
        li $t1,0 # index of element in the vector

        # take use input for the first vector
    input_vector_1:
        li $v0, 4 # print string syscall
        la $a0,string_1 # load string address
        syscall # call operating system to perform the operation

        li $v0,1 # print the integer
        move $a0,$t1 # move value in $a0 from $t1
        syscall # call operating system to perform the operation

        li $v0, 4 # print string  
        la $a0,string_3# load string address
        syscall # call operating system to perform the operation

        li $v0, 5 # read int syscall
        syscall # call operating system to perform the operation

        addi $t1,$t1,1 # increment the vector index
        sw $v0,vector_1($t0) # store input in vector_1
        addi $t0, $t0, 4 # increment loop counter by 4 bytes 
        bne $t0, 20, input_vector_1 # repeat until all values are entered by branch if not equal command 

        li $t0, 0 # initialize loop counter
        li $t1,0  # index of element in the vector

    # take use input for the second vector
    input_vector_2:
        li $v0, 4 # print string syscall
        la $a0,string_2 # load string address
        syscall # call operating system to perform the operation

        li $v0,1 # system call for printing the integer 
        move $a0,$t1 # move that integer from $t1 to $a0
        syscall # call operating system to perform the operation

        li $v0, 4 # print string syscall
        la $a0,string_3# load string address
        syscall # call operating system to perform the operation

        li $v0, 5 # read int syscall
        syscall # call operating system to perform the operation

        addi $t1,$t1,1 # increment index of vector 
        sw $v0,vector_2($t0) # store input in vec1
        addi $t0, $t0, 4 # increment loop counter
        bne $t0, 20, input_vector_2 # repeat until all values are entered

        li $t0, 0 # initialize loop counter
        li $t1, 0 # initialize accumulator

    # block to execute the dot product
    dot_product:
        lw $t2, vector_1($t0) # load element from vec1
        lw $t3, vector_2($t0) # load element from vec2
        mul $t4, $t2, $t3 # multiply elements
        add $t1, $t1, $t4 # add result to accumulator
        addi $t0, $t0, 4 # increment loop counter
        bne $t0, 20, dot_product # repeat until all values are multiplied

    li $v0, 4 # print string syscall
    la $a0,string_4# load string address
    syscall # call operating system to perform the operation

    li $v0,1 # system call for printing the integer 
    move $a0,$t1 # move that integer from $t1 to $a0
    syscall # call operating system to perform the operation

    li $v0, 10 # System call code for exit
    syscall # Exit program