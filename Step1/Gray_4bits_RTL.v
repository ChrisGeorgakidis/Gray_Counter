 /*
 -----------------------------------------------------------------------------
 -- File           : Gray_4bits_RTL.v
 -----------------------------------------------------------------------------
 -- Description    : Verilog code for the 4-bit Gray
 --  with asynchronous reset
 -- 4 bit gray code :
  --  bin     hex
  --  0000    0
  --  0001    1
  --  0011    3
  --  0010    2
  --  0110    6
  --  0111    7
  --  0101    5
  --  0100    4
  --  1100    C
  --  1101    D
  --  1111    F
  --  1110    E
  --  1010    A
  --  1011    B
  --  1001    9
  --  1000    8
 -- --------------------------------------------------------------------------
 */

module gray_4bits (clk, reset, gray_out);
input wire clk, reset;
output wire [3:0]gray_out;

reg [3:0]state;

assign gray_out = state;

always @(posedge clk or posedge reset)
begin
	if (reset == 1'b1) begin
		state <= 4'b0000;
	end
	else begin
		case (gray_out)
			4'b0000: state <= 4'b0001;
			4'b0001: state <= 4'b0011;
			4'b0011: state <= 4'b0010;
			4'b0010: state <= 4'b0110;
			4'b0110: state <= 4'b0111;
			4'b0111: state <= 4'b0101;
			4'b0101: state <= 4'b0100;
			4'b0100: state <= 4'b1100;
			4'b1100: state <= 4'b1101;
			4'b1101: state <= 4'b1111;
			4'b1111: state <= 4'b1110;
			4'b1110: state <= 4'b1010;
			4'b1010: state <= 4'b1011;
			4'b1011: state <= 4'b1001;
			4'b1001: state <= 4'b1000;
			4'b1000: state <= 4'b0000;
			default: state <= 4'b0000;
		endcase
	end
end

endmodule
