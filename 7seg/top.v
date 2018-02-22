module top (clk, reset, noisy, leds, an, a, b, c, d, e, f, g);

parameter N = 8;

input wire clk, reset, noisy;

output wire an, a, b, c, d, e, f, g;
output wire [N-1:0]leds;

assign leds = leds_w;
wire [N-1:0]leds_w;

GrayCounter_System #(N) GrayCounter_System (
	.clk		(clk),
	.reset		(reset),
	.noisy		(noisy),
	.leds		(leds_w)
);


												//NA TSEKAROUME TA TIMING STO 7SEG


FourDigitLEDdriver FourDigitLEDdriver (
	.reset		(reset),
	.clock		(clk),
	.Data_in	(leds_w),
	.an			(an),
	.a			(a),
	.b			(b),
	.c			(c),
	.d			(d),
	.e			(e),
	.f			(f),
	.g			(g)
);

endmodule
