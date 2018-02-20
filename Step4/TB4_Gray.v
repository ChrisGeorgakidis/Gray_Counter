/*                                -
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- File           : TB1_Gray.v
-----------------------------------------------------------------------------
-- Description    : Verilog testbench for Gray_4bits
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
 */

`timescale 1ns/1ps
`define cycle 10   // this is equivalent to defines in C

module TB4();
parameter N = 8;
parameter distance = 1000;  //
reg clk, reset;
wire [N-1:0] leds;

// Drive the reset and the EndOfSimulation signal
initial begin
// Your code goes here
	clk <= 1'b1;
	reset <= 1'b1;
	#50 reset <= 1'b0;
end

// Drive the clk
always begin
	#5 clk <= ~clk;
end


// Instantiate the System in the testbench
// Your code goes here
GrayCounter_System #(N, distance) GrayCounter_System(
	.clk	(clk),
	.reset	(reset),
	.leds	(leds)
);

endmodule
