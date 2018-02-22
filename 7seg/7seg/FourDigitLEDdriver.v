module FourDigitLEDdriver (reset, clock, Data_in, an, a, b, c, d, e, f, g);

input wire clock, reset;
input [7:0]Data_in;
output wire an;
output wire a, b, c, d, e, f, g;

wire [3:0]char;
wire [2:0]counter;
wire [6:0]LED;
wire newClock;


assign a = ~LED[6];
assign b = ~LED[5];
assign c = ~LED[4];
assign d = ~LED[3];
assign e = ~LED[2];
assign f = ~LED[1];
assign g = ~LED[0];

NewClockGenerator NewClockGenerator (
	.clock (clock),
	.reset (reset),
	.newClock (newClock)
);

CharGenerator CharGenerator(
	.clock		(clock),
	.counter 	(counter),
	.Data_in	(Data_in),
	.char		(char)
);

CounterGenerator CounterGenerator(
	.clock			(newClock),
	.reset			(reset),
	.counter		(counter)
);

LEDdecoder LEDdecoder(
	.char	(char),
	.LED	(LED)
);

AnodeSelector AnodeSelector(
	.counter	(counter),
	.an			(an)
);

endmodule
