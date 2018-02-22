module AnodeSelector (counter, an);

input wire [2:0]counter;
output reg an;

always @ (counter)
begin
	case (counter)
		3'b000:		an <= 1'b0;
		3'b001:		an <= 1'b0;
		3'b010:		an <= 1'b0;
		3'b011:		an <= 1'b0;
		default:	an <= 1'b1;
	endcase
end
endmodule
