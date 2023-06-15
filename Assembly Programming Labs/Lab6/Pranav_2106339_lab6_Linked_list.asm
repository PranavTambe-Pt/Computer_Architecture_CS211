# Author-Pranav Tambe
# Roll No-2106339


.data
prompt1: .asciiz "Enter the number of nodes: "
prompt2: .asciiz "Enter a value: "
output: .asciiz "The sorted linked list is : "
space_char : .asciiz " "
.space 4
.text
.globl main

# main function
main:
    # prompt user for number of nodes
    li $v0, 4
    la $a0, prompt1
    syscall

    # read number of nodes
    li $v0, 5
    syscall
    move $t0, $v0 # store number of nodes in $t0
    addi $t4,$t0,0
	addi $t5,$zero,0
    # initialize linked list
    li $t1, 0 # head of linked list
    li $t2, 0 # current node of linked list
    
loop:
    # prompt user for value
    li $v0, 4
    la $a0, prompt2
    syscall

    # read value
    li $v0, 5
    syscall
    move $t3, $v0 # store value in $t3
    
    # create new node
    li $v0, 9 # allocate memory for a new node
    li $a0, 8 # size of node is 8 bytes (4 for value, 4 for pointer)
    syscall

    sw $t3, ($v0) # store value in node
    sw $t1, 4($v0) # store address of next node in node
    move $t1, $v0

    addi $t0,$t0,-1

    # add node to linked list
    beq $t0, $zero, end_loop # if head of linked list is null, set head to new node

    j loop

end_loop:
    # print linked list
    li $v0, 4
    la $a0, output
    syscall
    la $t2, 0($t1) # start at head of linked list
    addi $t6,$zero,1
bubble_sort_outer_loop:
    beq $t6,$t4,print_loop # exit the function if $t6 == $t4
    la $t2, 0($t1) # load the address of the head of the linked list into $t2
    addi $t6,$t6,1 # increment the outer loop counter ($t6)

bubble_sort_inner_loop:
    lw $t7,0($t2) # load the value at the current node of the linked list into $t7
    lw $t8,4($t2) # load the address of the next node in the linked list into $t8
    beq $t8,$0,bubble_sort_outer_loop # if the next node is NULL, exit the inner loop
    lw $t9,($t8) # load the value at the next node into $t9
    slt $s0,$t7,$t9 # if $t7<$t8, set $s0 to 1, otherwise set it to 0
    beq $s0,$0,swap_function # if $t7>=$t8, skip the swap_function and continue with the inner loop
    addi $s1, $s1,-1 # decrement the inner loop counter ($s1)
    lw $t2, 4($t2) # move to the next node in the linked list
    j bubble_sort_inner_loop # jump back to the beginning of the inner loop
 


swap_function:
    sw $t9,($t2) # store the value of the next node into the current node
    sw $t7,($t8) # store the value of the current node into the next node
    addi $s1, $s1,1 # increment the inner loop counter
    lw $t2, 4($t2) # move to the next node in the linked list
    j bubble_sort_inner_loop # jump back to the beginning of the inner loop



print_loop:
    beq $t4,$t5,end_print_loop # exit the function if $t4 == $t5
    lw $a0, ($t1) # load the value at the current node of the linked list into $a0
    li $v0, 1 # load the print integer system call code into $v0
    syscall # print the integer value in $a0
    li $v0, 4 # load the print string system call code into $v0
    la $a0,space_char # load the address of the space character into $a0
    syscall # print a space character
    addi $t5,$t5,1 # increment the print loop counter ($t5)
    lw $t1, 4($t1) # move to the next node in the linked list
    j print_loop # jump back to the beginning of the print loop

end_print_loop:
    li $v0, 10 # load the exit system call code into $v0
    syscall # exit the program
