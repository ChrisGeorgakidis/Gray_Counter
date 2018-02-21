module AnodeSelector (counter, an);

input wire [2:0]counter;
output reg an;

always @ (counter)
begin
	case (counter)
		3'b001:
			begin
				an <= 1'b0;
			end
		3'b101:
			begin
				an <= 1'b1;
			end
	endcase
end
endmodule
