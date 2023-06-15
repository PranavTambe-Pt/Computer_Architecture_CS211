.text  # tells assembler to switch to the text segment or succeeding lines contains instructions

main: # start of code section
  lb $t1, 5($zero)   # attempt to load a byte from address 5
 

