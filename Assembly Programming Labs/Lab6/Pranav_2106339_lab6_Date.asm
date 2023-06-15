# Author-Pranav Tambe
# Roll No-2106339

.data
date: .asciiz "Enter the date : "
month:.asciiz "Enter the month : "
year :.asciiz "Enter the year : "
next_date: .asciiz "\nThe next date is: "
slash : .asciiz"/"

.text
main:
  # Dynamically allocate memory for storing date and next date
  li $a0, 24  
  li $v0, 9  
  syscall
  move $s1, $v0  

  
  la $a0, date
  li $v0, 4 
  syscall
  li $v0, 5  
  syscall 
  sw $v0, 0($s1)  

  la $a0, month
  li $v0, 4 
  syscall
  li $v0, 5  
 syscall  
  sw $v0, 4($s1)  

  la $a0, year
  li $v0, 4  
  syscall
  li $v0, 5  
  syscall 
  sw $v0, 8($s1)

# calculate next date
  lw $t0, 0($s1) # load date
  lw $t1, 4($s1) # load month
  lw $t2, 8($s1) # load year

  beq $t1, 2, febCheck

  addi $t0, $t0, 1 # increment date
  beq $t0, 32, next_month # check if date overflows
  # 4, 6, 9, 11 are months with 30 days
  beq $t1,4,April_June_sept_Nov
  beq $t1,6,April_June_sept_Nov
  beq $t1,9,April_June_sept_Nov
  beq $t1,11,April_June_sept_Nov

  j print_next_date


next_month:
  addi $t1, $t1, 1 # increment month
  li $t0, 1 # set date to 1
  beq $t1, 13, next_year # check if date overflows
  j print_next_date

next_year:
  addi $t2, $t2, 1 # increment year
  li $t0, 1 # set date to 1
  li $t1,1
  j print_next_date



febCheck:
    # check if it's a leap year
    li $t3, 0 # initialize $t3 to 0
    rem $t3, $t2, 400 # check if the year is divisible by 400
    beq  $t3, 0, leap_year # if it's divisible by 400, it's a leap year
    rem $t3, $t2, 100 # check if the year is divisible by 100
    beq $t3, 0, not_leap_year # if it's not divisible by 100, it's a leap year
    rem $t3, $t2, 4 # check if the year is divisible by 4
    beq $t3, 0, leap_year # if it's not divisible by 4, it's not a leap year
    j not_leap_year

not_leap_year:
  addi $t0, $t0, 1 # increment date
  beq $t0,29,next_month
  j print_next_date


leap_year:
  addi $t0, $t0, 1 # increment date
  beq $t0,30,next_month   
  j print_next_date 
   
April_June_sept_Nov:
  beq $t0,31,next_month
  j print_next_date

print_next_date:
  # prompt user for input
  la $a0, next_date
  li $v0, 4 # print string syscall
  syscall

  li $v0,1 # system call for printing the integer 
  move $a0,$t0 # move that integer from $t1 to $a0
  sw $t0, 12($s1) 
  syscall # call operating system to perform the operation

  la $a0, slash
  li $v0, 4 # print string syscall
  syscall

  li $v0,1 # system call for printing the integer 
  move $a0,$t1 # move that integer from $t1 to $a0
  sw $t1, 16($s1)  
  syscall # call operating system to perform the operation

  la $a0, slash
  li $v0, 4 # print string syscall
  syscall

  li $v0,1 # system call for printing the integer 
  move $a0,$t2 # move that integer from $t1 to $a0
  sw $t2, 20($s1)  
  syscall # call operating system to perform the operation

  li $v0, 10 # System call code for exit
  syscall # Exit program