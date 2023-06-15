# tan(x) evaluates any real number
# Infinity is taken as 103
.data
string_one: .asciiz "Enter the value of x for calculating the tan :"
string_two: .asciiz " tan(x) is :"
bin_tan: .word 0, 0 , 0, 2, 30, 50 , -2, 0, 0, 0, 0, 0, 0, 2, 30, 50, -2, 0, 0, 0
length : .word 20
.text # tells assembler to switch to the text segment or succeeding lines contains instructions
main:
    # for printing   string 
    li $v0, 4
    la $a0,string_one
    syscall
    # Read integer from user
    li $v0, 5 # System call code for read integer 
    syscall # Read integer from user and store in $v0
    move $t0, $v0 # Move input integer from $v0 to $t
    addi $t1,$0,18 # add bin size to $t0
    div   $t0,$t1 # get the bin number by dividing input by 18
    mflo $t2 # take bin number
    # addi $t2,$t2,-1
    la $t3, bin_tan # load base address of the array
    addi $t7,$0,4  # add 4 to $t7
    multu $t2,$t7 # multiply bin number by 4
    mflo $t6  # take the value for increasing array index 
    add $t3,$t3,$t6 # increment array index by adding to base address
    lw $t4,($t3) # load number from that memory address
     # for printing   string 
    li $v0, 4
    la $a0,string_two
    syscall
    li $v0,1 # system call for printing number
    move $a0,$t4
    syscall # call operating system to perform operation
    li $v0,10 # terminate progarm
    syscall 
