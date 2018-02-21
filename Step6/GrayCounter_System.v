`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Design Name:
// Module Name:    GrayCounter_System
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Instantiation of the GrayCounter_Nbits and GrayCounter_Pulse models
//
//////////////////////////////////////////////////////////////////////////////////
module GrayCounter_System (clk, reset, noisy, leds);
parameter N = 8;
input wire clk, reset, noisy;
output [N-1:0] leds;
wire clean;

// Instantiation of the debouncer
// Here
debounce debounce(
	.clk	(clk),
	.reset	(reset),
	.noisy	(noisy),
	.clean	(clean)
);
// Instantiation of the gray_Nbits
// Here
gray_Nbits #(N) gray_Nbits (
	.clk		(clk),
	.reset		(reset),
	.enable		(clean),
	.gray_out	(leds)
);

endmodule
