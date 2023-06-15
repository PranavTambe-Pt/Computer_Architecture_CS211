        # Hello,World!
       .data ##Declaration of data section
        out_string: .asciiz "\nHello , World!\n" # String to be printed
        .text # Assembly language instruction go in text sewction
main:
    li $v0,4 # system call for printing string =4
    la $a0,out_string # load addresss of string to be eprinted in $a0
    syscall # call operating systenm to perfoem operation
    li $v0,10 # terminate progarm
    syscall 
    