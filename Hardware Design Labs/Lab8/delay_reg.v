`include "define.v"

module delay_reg(
	
	input  clk, 
input rst,	
	input [`DSIZE-1:0] wdatain,
	input [`ASIZE-1:0]waddrin, 

	output reg [`DSIZE-1:0] wdataout,
	output reg[`ASIZE-1:0]waddrout
	
);




always @ (posedge clk) begin
	if (rst)
	begin
		waddrout <= 0;
		wdataout <= 0;
	end
	else
	begin
		waddrout <= waddrin;
		wdataout <= wdatain;
	
	end
end 

endmodule



