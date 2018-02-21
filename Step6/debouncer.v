// Switch Debounce Module
// use your system clock for the clock input
// to produce a synchronous, debounced output
module debounce (clk, reset, noisy, clean);
parameter DELAY = 100000000;	//1 sec with a 100 Mhz clock at the start
input wire clk, reset, noisy;
output reg clean;

reg [27:0] count;
reg [27:0]delay;
reg [2:0]step;

always @ (posedge clk or posedge reset) begin
	if(reset == 1) begin
		clean 		<= 1'b0;
		count		<= 20'd0;
		delay		<= DELAY;	//max delay
		step		<= 3'b0;
	end
	else begin
		if (noisy == 1'b1) begin
			if (count == delay) begin	//every time delay gets halved
				clean		<= 1'b1;
				count		<= 20'd0;
				if (step < 7) begin
					delay <= delay >> 1;	//delay/2
					step <= step + 3'b1;
				end
			end
			else begin
				clean <= 1'b0;
				count <= count + 20'd1;
			end
		end
		else begin
			clean 		<= 1'b0;
			count		<= 20'd0;
			delay		<= DELAY;	//max delay
			step		<= 3'b0;
		end
	end
end
endmodule
