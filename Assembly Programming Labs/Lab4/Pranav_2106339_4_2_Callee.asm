.text
.globl max
max:
# Multiply contents of registers $t0 and $t0 and store result in $s0
mul $s0,$a0,$a0 # x*x
# Multiply contents of registers $t0 and $t1 and store result in $s1
mul $s1,$a0,$a1 # x*y

# Load immediate value 5 into register $t7
addi $t7,$0,5
# Multiply contents of registers $t1 and $t7 and store result in $lo
mult $a1,$t7 # 5*y

# Move contents of $s0 to $a0  
move $a0,$s0 # x*x
# Move contents of $s1 to $a1  
move $a1,$s1 # x*y
# Move contents of $lo to $a2  
mflo $a2 # 5*y
# compare $a0 and $a2, store the result in $t2 (1 if $a2 < $a0, 0 otherwise)
slt $t2,$a2,$a0
# if $t2 is 0 (i.e., $a2 >= $a0), branch to check_a1_a2
beq $t2,0,check_a1_a2
# compare $a0 and $a1, store the result in $t2 (1 if $a1 < $a0, 0 otherwise)
slt $t2,$a1,$a0
 # if $t2 is 0 (i.e., $a1 >= $a0), branch to a1_is_max
beq $t2,0,a1_is_max
# otherwise, jump to next
jal next

check_a1_a2:
  # compare $a1 and $a2, store the result in $t2 (1 if $a2 < $a1, 0 otherwise)
  slt $t2,$a1,$a2
  # if $t2 is 0 (i.e., $a2 >= $a1), branch to a1_is_max
  beq $t2,0,a1_is_max
  # otherwise, move the value in $a2 to $a0 and jump to next
  move $a0,$a2
  jal next

a1_is_max:
  # move the value in $a1 to $a0 and jump to next
  move $a0,$a1
  jal next


 
