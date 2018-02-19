/*                                
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- File           : TB1_Gray.v
-----------------------------------------------------------------------------
-- Description    : Verilog testbench for Gray_4bits
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
*/


module TB2();
reg clk, reset /*, clk_en*/;
wire [3:0]leds;
//integer EndOfSimulation;
//integer i;

//parameter ONE = 1'b1;

// Instantiation of the gray_Nbits
gray_Nbits DUT(
	.clk		(clk),
	.reset		(reset),
	.gray_out	(leds)
);

// Initial statement for signal initialization (reset, clk, EndOfSimulation)
initial begin
	clk <= 1;
	reset <= 1;
	#20reset <= 0;
	#300$finish;
end

// Always statement to drive the clock goes here
always begin
	#5 clk <= ~clk;
end

  
endmodule
