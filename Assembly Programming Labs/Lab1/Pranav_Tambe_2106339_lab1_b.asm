.text # tells assembler to switch to the text segment or succeeding lines contains instructions
.globl main # assembler directive 

main:  # start of code section 
	ori $8, $0, 0xFFFF  # immidiate OR between  0 from $0 and FFFF, FFFF || 0==FFFF ,stored value in reg 8
	sll $9, $8,2 # shift left logical ,shift number from reg8 leftwards by 2 bits and apppends 0s from left and stores in reg 9
	add $10, $0, 0x10000000 # address stored in reg 10 by 
	sw $9,($10) # store word takes value from reg 9 and stores in the address  specified by reg 10 ,value in () is treated as memory address  

##End of program

   