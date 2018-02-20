// Switch Debounce Module
// use your system clock for the clock input
// to produce a synchronous, debounced output
module debounce (clk, reset, noisy, clean);
parameter DELAY = 1000000;		// .01 sec with a 100 Mhz clock
input wire clk, reset, noisy;
output reg clean;

reg [19:0] count;
reg isPressed;

always @ (posedge clk or posedge reset) begin
	if(reset == 1) begin
		isPressed	<= 1'b0;
		clean 		<= 1'b0;
		count		<= 20'd0;
	end
	else begin
		if (noisy == 1'b1) begin
			if (count == DELAY) begin
				if (isPressed == 1'b0) begin
					clean		<= 1'b1;
					isPressed	<= 1'b1;
				end
				else begin
					clean		<= 1'b0;
				end
			end
			else begin
				clean <= 1'b0;
				count <= count + 20'd1;
			end
		end
		else begin
			clean		<= 1'b0;
			count		<= 20'd0;
			isPressed	<= 1'b0;
		end
	end
end
endmodule
