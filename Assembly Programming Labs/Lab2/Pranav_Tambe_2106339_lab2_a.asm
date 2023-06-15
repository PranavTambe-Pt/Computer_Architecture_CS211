.data
array : .word 10, 12, 15, -10, 13, 82, -9, 4, 3, -7  # load the array
length: .word 10 # load the length of the array as 10
sum: .word 0 # initialize sum to 0
out_s: .asciiz "\nSum of elements in the array is :"
out_st: .asciiz "\n------This program does the sum of all the  elements in an array------\n"

.text  # tells assembler to switch to the text segment or succeeding lines contains instructions

main:  # start of code section 

li $v0,4   # system call for  the printing string 
la $a0,out_st    # load address of string to printed in $a0
syscall    # call operating system to perform operation
la $t3, array   # load base address of the array
# $t3 has the base address of data. All the subsequent data can be accessed using respective offset values
lw $t4,length # load array size
li $t5,0  # for index of array, i=0
li $t6,0 # load sum initialized with 0

sumloop:
    lw $t7 ,($t3) # get array's  number at ith position  or array[i]
    add $t6,$t6,$t7 # do sum+=array[i]
    add $t5,$t5,1 # i++ increment in i
    add $t3,$t3,4 # update array address by adding 4 as every integer is stored  consecutively after 4 bytes 
    bne $t5,$t4,sumloop # if $t5 is not equal to $t4 loop again
    sw $t6,sum # store  $t6 in sum 
    li $v0,4 # system call for printing string 
    la $a0,out_s # load address of string to be printed in a0
    syscall # call OS to  execute the operation
    li $v0,1 # system call for printing the integer
    move $a0,$t6 # move result to $ a0
    syscall # call OS to  execute the operation
    li $v0,10 # terminate program
    syscall 


