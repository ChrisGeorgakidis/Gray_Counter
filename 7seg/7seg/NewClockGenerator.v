module NewClockGenerator (clock, reset, newClock);

input wire clock, reset;
output reg newClock;

reg [2:0]counterClock;

always @ (posedge clock or posedge reset)
begin
	if (reset == 1)
		begin
			newClock <= 0;
			counterClock <= 0;
		end
	else
		begin
			counterClock <= counterClock + 3'b001;
			if (counterClock == 3'b000) newClock <= ~newClock;
		end
end
endmodule
