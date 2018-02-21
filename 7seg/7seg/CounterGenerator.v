module CounterGenerator(clock, reset, counter);

input wire clock, reset;
output reg [2:0]counter;

always @ (posedge clock or posedge reset) begin
	if (reset == 1) begin
		counter <= 3'b000;
	end
	else begin
		counter <= counter + 3'b001;
	end
end

endmodule
