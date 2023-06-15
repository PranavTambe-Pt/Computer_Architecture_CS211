# This program prompts the user to enter a value for x, and calculates and displays the result of a mathematical expression

    .data
string_one:  .asciiz   "Enter a value for x: "   # Prompt for user input
result:      .asciiz   "The result is: "         # Message to display the result
two_point_five: .float 2.5                       # Initialize a floating-point constant
four_point_three: .float 4.3                      
five:        .float    5.0                        
.text
.globl main

main:
    
    li $v0, 4
    la $a0, string_one
    syscall  # Print the prompt for user input
    
    li $v0, 6
    syscall
    mov.s $f0, $f0   # Read a floating-point value from the user and store it in $f0

    mul.s  $f1, $f0, $f0     # Calculate $f1 = x^2
    l.s $f2, two_point_five    # Load the constant 2.5 into $f2
    mul.s $f3, $f1, $f2       # Calculate $f3 = 2.5 * x^2
    l.s $f4, four_point_three   # Load the constant 4.3 into $f4
    mul.s $f5, $f4, $f0    # Calculate $f5 = 4.3 * x
    add.s $f6, $f5, $f3      # Calculate $f6 = 4.3 * x + 2.5 * x^2
    l.s $f7, five     # Load the constant 5.0 into $f7
    add.s $f8, $f6, $f7    # Calculate the final result $f8 = 4.3 * x + 2.5 * x^2 + 5.0

    li $v0, 4
    la $a0, result
    syscall      # Print the message indicating the result will be printed
    li $v0, 2
    mov.s $f12, $f8
    syscall    # Print the final result value in $f8 using syscall 2 (print float)

    li $v0, 10
    syscall    # Terminate the program
