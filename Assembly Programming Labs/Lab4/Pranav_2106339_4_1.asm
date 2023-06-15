.data
a_var : .word 10
b_var : .word 20
result: .asciiz "The result of ab-10a+20b+16 is: "

.text

main:
  # calculate 10*a==a*a
  lw $t0,a_var # store a_var in $t0
  mult $t0,$t0 
  mflo $t0
  # use stack for storing 10a
  subu $sp,$sp,4 # subtract 4 from  stack pointer
  sw $t0,($sp) # store 10*a in stack 

 # calculate ab 
  lw $t0,a_var # store a_var in $t0
  lw $t1,b_var  # store b_var in $t1
  mult $t0,$t1 # multiply $t0 and $t1
  mflo $t0 # Move from low register to $t0

   # use stack for storing ab
  subu $sp,$sp,4 # subtract 4 from  stack pointer
  sw $t0,($sp) # store ab in stack 
  
  
  # calculate 20*b
  # $t1 contains b_var = 20
  mult $t1,$t1 # 20*20
  mflo  $t0 # Move from low register to $t0

  # use stack for storing 10a
  subu $sp,$sp,4 # subtract 4 from  stack pointer
  sw $t0,($sp) # store 20b in stack 

  addi $t0,$0,0x10 # store 16 in $t0
  lw $t1,($sp) # load 20b from stack in $t1
  addu $sp,$sp,4 # pop out 20b by  incrementing  stack pointer 
  # add 20b +16 and store it in $t0
  addu $t0,$t0,$t1
  
  lw $t1,($sp) # load ab from stack in $t1
  addu $sp,$sp,4 # pop out ab by  incrementing  stack pointer 
   addu $t0,$t0,$t1  # add (20b +16)+ab and store it in $t0
   lw $t1,($sp) # load 10a in $t1
   addu $sp,$sp,4  # pop out 10a by  incrementing  stack pointer 
   sub $t0,$t0,$t1 # subtract 10a from yhe value and we get (20b +16)+ab-10a 
    # Print result string   
    li $v0, 4
    la $a0, result
    syscall
   # Load immediate value 1 into register $v0
   li $v0,1 
   # Copy the contents of register $t0 to register $a0
   move $a0,$t0
   # Print the value stored in $a0 (which was copied from $t0)
   # using system call with service number 1 (print integer)
   syscall
  # Load immediate value 10 into register $v0
   li $v0,10
  # Exit the program using system call with service number 10 (exit)
   syscall





