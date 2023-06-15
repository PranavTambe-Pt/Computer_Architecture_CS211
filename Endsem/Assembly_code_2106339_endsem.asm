.data ##Declaration of data section
    out_string1: .asciiz "\nEnter x:"
        out_string2: .asciiz "\nAnswer is:"
.text
main:
   li $v0,4 # system call for printing string 4
    la $a0,out_string1 # load addresss of string to be eprinted in $a0
    syscall # call operating systenm to perfoem operation

    li $v0, 5 # System call code for read integer 
    syscall # Read integer from user and store in $v0
    move $t0, $v0 # Move input integer from $v0 to $t0
    
    addi $t1,$0,0 # initialize $t1 with 0
    multu $t0,$t0  
     mflo $t1
    addi $t2,$0,2
    multu $t1,$t2
    mflo $t1
   addi $t3,$0,5
    multu $t0,$t3
    mflo $t0
    add $t4,$t0,$t1
    addi $t5,$t4,7
  li $v0,4 # system call for printing string 4
    la $a0,out_string2 # load addresss of string to be eprinted in $a0
    syscall # call operating systenm to perfoem operation
 li $v0,1# system call for printing  integer 1
    addi $a0,$t5,0 # move $a0,$t6  load integer to $a0 
    syscall # call operating system to perform operation

   # Terminate program Exit program
    li $v0,10 # terminate progarm
    syscall 




 