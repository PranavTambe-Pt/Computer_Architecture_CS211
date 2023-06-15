.data 
num1: .word 21 # num1 as 21
num2: .word 1 # num2 as 1
ans: .word 0 # initialise ans from  0
input_s: .asciiz "\nEnter a number n :"
out_s: .asciiz "\nphi(n)is :"
out_st: .asciiz "\n------This program computes the Euler Phi function for the number------\n"

.text  # tells assembler to switch to the text segment or succeeding lines contains instructions

main:  # start of code section 
    li $v0,4 # system call for printing string =4
    la $a0,out_st # load address  of string to be printed in $a0
    syscall # call operating system to perform operation
    li $v0, 4 # System call code for print_str
    la $a0, input_s # Load address of prompt string
    syscall # Print the input_s

    # Read integer from user
    li $v0, 5 # System call code for read integer 
    syscall # Read integer from user and store in $v0
    move $t4, $v0 # Move input integer from $v0 to $t
    lw $t1,num2 # store 1 in $t1
    lw $t3,ans # store ans in $t3

    loop:
        add $a0,$t4,0 # Load n into $a0
        add $a1,$t1,0 # Load 0 into $a1
        jal gcd # Jump to gcd subroutine
        check:
            beq $a0,1,equal # if gcd is equal to 1 jump to the equal block
        keep:
            add $t1,$t1,1 # increment $t1 by 1
            bne $t1,$t4,loop # branch if $t1 is not equal to $t4 i.e. n
     
      li $v0,4 # system call for printing string = 4
      la $a0,out_s # load address of string to be printed in $a0
      syscall # call operating system to perform operation
      
      li $v0, 1 # System call code for print_int
      move $a0, $t3 # Load result into $a0 from $t3
      syscall # Print the result

      li $v0, 10 # System call code for exit
      syscall # Exit program

    # ---------------------------------------------------------------------------------------------------------------------------------#
    # gcd function 
    # Recursive definition
    # gcd(m,n)==gcd(n,(m%n))
    # ---------------------------------------------------------------------------------------------------------------------------------#
    gcd:
      # Base case 
      beq $a1, $0, end # If second number is 0, return first number
      move $t0, $a0 # Save first number
      move $a0,$a1 # move second  number in $a0 it is now our first number 
      div $t0, $a1 # Divide first number by second number 
      mfhi $a1 # Store the remainder in $a1(remainder is now second number)
      
      j gcd # Recursively call the gcd function

    end:
      j check # Return to check block  our gcd is stored in $a0
    equal:
          add $t3,$t3,1 # increment $t3 by 1
          j keep # jump to keep block
    