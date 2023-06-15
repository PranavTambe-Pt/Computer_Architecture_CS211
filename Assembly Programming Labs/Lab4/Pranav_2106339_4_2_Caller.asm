 .data
  string_one: .asciiz "Enter the number x:"
  string_two: .asciiz "Enter the number y:"
  result :.asciiz "  is the maximum of x*x , x*y and y*5."
.text 
.globl next
# Load immediate value 10 into register $t0
addi $t0, $zero, 10 

main:
# Load immediate value 4 into register $v0 (used for printing strings)
li $v0, 4 
# Load address of string_one into register $a0 (used as an argument for syscall to print string)
la $a0,string_one  
# Print the string stored at address in $a0
syscall 

# Load immediate value 5 into register $v0 (used for taking integer input x)
li $v0, 5   
# Read integer from input and store in register $v0
syscall  
# Copy integer from $v0 to $t0
move $t0, $v0  

# Load immediate value 4 into register $v0 (used for printing strings)
li $v0, 4 
# Load address of string_two into register $a0 (used as an argument for syscall to print string)
la $a0,string_two 
# Print the string stored at address in $a0
syscall 

# Load immediate value 5 into register $v0 (used for taking integer input y)
li $v0, 5  
# Read integer from input and store in register $v0
syscall  
# Copy integer from $v0 to $t1
move $t1, $v0  
# Move contents of $t0 to $a0 (used as an argument for jal to call max function)
move $a0,$t0
# Move contents of $t1 to $a0 (used as an argument for jal to call max function)
move $a1,$t1
# Jump to max function using jal instruction
jal max

next:
# max value is in $a0 itself 
# just print the result
li $v0,1
syscall
# Print result string  
# Load immediate value 4 into register $v0 (used for printing strings)
li $v0, 4 
# Load address of string result into register $a0 (used as an argument for syscall to print string)
la $a0, result
# Print the string stored at address in $a0
syscall 
# Load immediate value 10 into register $v0 (used for terminating the program)
li $v0, 10
# Terminate the program
syscall






