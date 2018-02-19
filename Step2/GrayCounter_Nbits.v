 /*
 -----------------------------------------------------------------------------
 -- File           : Gray_Nbits_RTL.v
 -----------------------------------------------------------------------------
 */ 

module gray_Nbits (clk, reset, gray_out);
 
parameter N = 4;
parameter SIZE =(N+1);
parameter Zeros = {SIZE{1'b0}};

integer i, j;
// Place the definition of wires and regs here
input wire clk, reset;
output wire [N-1:0]gray_out;

reg [N:0]toggle;
reg prev;
reg [SIZE-1:0]state;

wire [SIZE-1:0]gray_out_aux;

assign gray_out = gray_out_aux[SIZE-1:1];
assign gray_out_aux = state;
  
// The state of the Gray counter
always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        state <= Zeros;
	end
	else begin
	   state[0] <= ~gray_out_aux[0];
	   for (i=1; i<=N; i=i+1) begin
	       if (toggle[i] == 1'b1) begin
	           state[i] <= ~gray_out_aux[i];
	       end
	   end
	end
end
  
// The combinational logic produces the toggle[N:0] signals
always @ (state) begin
    if (reset == 1'b1) begin
        toggle = 'b0;
    end
    else begin    
        toggle[0] =  1'b1;
        toggle[1] = state[0];	//checks aux bit
        for (i=2; i<N; i=i+1) begin
            prev = state[i-2];
            for (j = i-3; j >= 0; j = j-1) begin
                prev = prev | state[j]; 
            end
            toggle[i] = state[i-1] & (~prev);
        end
        toggle[N] = ~(|state[N-2:0]);
    end
end 
	 
endmodule
