
`include "define.v"


module alu(
   a,   //1st operand
   b,   //2nd operand
   op,   //3-bit operation
   out   //output
   );

   parameter DSIZE = 4;
   
   input [DSIZE-1:0] a, b;
   input [2:0] op;
   
   output [DSIZE-1:0] out;
   

	reg [DSIZE-1:0] out; 
      
always @(a or b or op )
begin
   case(op)
       `ADD: out = a+b;
       `SUB: out = a - b;
       `AND: out = a & b;
       `XOR:  out = a^b;
       `COM: out = a<=b;
       `MUL: out = a*b;
	   `ADDI: out = a+b;
	   default: out = 0;  
       

   endcase
end

endmodule
   
       
