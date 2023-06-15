
`include "define.v"


module alu(
   a,   //1st operand
  
   out   //output
   
   );

   parameter DSIZE = 8;
   
   input [DSIZE-1:0] a;
   
   
   output [DSIZE-1:0] out;
   
  	reg [DSIZE-1:0] b; 
	reg [DSIZE-1:0] out; 
      
always @(a )
begin
 assign b= a * a; // multiply x*x
  assign out= 2 * b; //then by 2
   
       

  
end

endmodule
   
       
