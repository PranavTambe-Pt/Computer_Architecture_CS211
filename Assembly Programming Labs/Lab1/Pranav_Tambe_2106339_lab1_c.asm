.text # tells assembler to switch to the text segment or succeeding lines contains instructions
.globl main  # assembler directive 

main: # start of code section
    ori $8, $0, 0x64 #100 in hexadecimal # 100 in hexadecimal is stored in reg 8 by immediate OR with 0
	addi $9, $0, 0xFFFFFFAE #-82 in hexadecimal as 16's complement stored in reg 9 with by add immidiate  with reg 0
	add $10, $8, $9 # add ignores overflow and store value in reg 10
	addu $11, $10,$10 # 2*x by adding value in reg 10 two times and storing in reg 11
	addi $12,$11,0x3  # adding 3 to reg 11 and storing in reg 12 
	multu $12,$12  # Multiplication of reg 12 and reg 12 ,x**2,value gets stored in LO
    mflo $13 # move from LO to reg 13 

##End of program