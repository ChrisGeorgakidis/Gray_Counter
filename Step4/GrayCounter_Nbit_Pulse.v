`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// This is the code that generates a pulse for a single cycle every "distance"
// cycles. Note that "distance" * clk period = 1 sec
//////////////////////////////////////////////////////////////////////////////////
module GrayCounter_Pulse(clk, reset, pulse);
input wire clk, reset;
output reg pulse;

parameter distance = 100000000;// How much for 1 Hz when clk period is 10 ns? ==>  (10^8) 10 million cc
reg [26:0]counter;

always @(posedge clk or posedge reset) begin
	if (reset == 1'b1) begin
		// Your code for asynchronous reset goes here
		counter <= 27'd0; 	//reset counter
		pulse 	<= 1'b0;		//reset pulse
	end
	else begin
			// and for regular functionality goes here
			if (counter == distance) begin		//on the 10millionth cycle make pulse 1 and reset counter
				pulse 	<= 1'b1;
				counter <= 27'd0;
			end
			else begin							//keep it at 0 otherwise nad increase counter
				pulse 	<= 1'b0;
				counter <= counter + 27'd1;
			end
	end
end

endmodule
