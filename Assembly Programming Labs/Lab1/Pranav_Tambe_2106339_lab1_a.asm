.text # tells assembler to switch to the text segment or succeeding lines contains instructions
.globl main # assembler directive 
 
main: # start of code section
	ori $8, $0, 0x64 #100 in hexadecimal # 100 in hexadecimal is stored in reg 8 by immediate OR with 0
	addi $9, $0, 0xFFFFFFAE #-82 in hexadecimal as 16's complement stored in reg 9 with by add immidiate  with reg 0
	add $10, $8, $9 # add ignores overflow and store value in reg 10

##End of program