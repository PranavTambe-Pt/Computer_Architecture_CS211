.data
prompt: .asciiz "Enter a number: "  # Declares a string for user prompt
result: .asciiz "The square root is: "  # Declares a string for result output
one: .float 1.0  # Declares a float value of 1.0
half: .float 0.5  # Declares a float value of 0.5
.text
main:
  li $v0, 4  # Loads 4 into register $v0, which is the system call code for printing a string
  la $a0, prompt  # Loads the address of the prompt string into register $a0, which is the argument
  syscall  # Executes the system call to print the prompt string

  li $v0, 6  # Loads 6 into register $v0, which is the system call code for reading a float
  syscall  # Executes the system call to read a float from the user
  mov.s $f0, $f0  # Moves the float value read by the user from register $f0 to $f0

  l.s $f1, one  # Loads the float value 1.0 from memory into register $f1
  l.s $f7, half  # Loads the float value 0.5 from memory into register $f7

  add.s $f2, $f0, $f1  # Adds the float value read by the user and 1.0, and stores the result in register $f2
  mul.s $f3, $f2, $f7  # Multiplies the result in register $f2 by 0.5, and stores the result in register $f3

loop:
  div.s $f4, $f0, $f3  # Divides the float value read by the user by the result in register $f3, and stores the result in register $f4
  add.s $f5, $f3, $f4  # Adds the result in register $f3 and $f4, and stores the result in register $f5
  mul.s $f6, $f5, $f7  # Multiplies the result in register $f5 by 0.5, and stores the result in register $f6

  c.eq.s $f3, $f6  # Compares the results in registers $f3 and $f6 for equality
  bc1t done  # Branches to the label "done" if the result of the comparison was true
  mov.s $f3, $f6  # Moves the result in register $f6 to register $f3
  j loop  # Jumps to the label "loop" to repeat the loop

done:
  li $v0, 4  # Loads 4 into register $v0, which is the system call code for printing a string
  la $a0, result  # Loads the address of the result string into register $a0, which is the argument
  syscall  # Executes the system call to print the result string

  mov.s $f12, $f3  # Moves the result in register $f3 to register $f12
  li $v0, 2  # Loads 2 into register $v0, which is the system call code for printing a float
  syscall  # Executes the system call to print the square root value

  li $v0, 10  # Loads 10 into
  syscall