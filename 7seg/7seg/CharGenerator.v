module CharGenerator (clock, counter, Data_in, char);

input clock;
input [2:0]counter;
input [7:0]Data_in;
output [3:0]char;

wire [2:0]counter;
reg [3:0]char;

always @ (posedge clock)
begin
	case (counter)
		3'b000:	char <= Data_in[7:4];
		3'b001:	char <= Data_in[7:4];
		3'b010:	char <= Data_in[7:4];

		3'b100:	char <= Data_in[3:0];
		3'b101:	char <= Data_in[3:0];
		3'b110:	char <= Data_in[3:0];

		default: char <= 3'b000;
	endcase
end

endmodule
