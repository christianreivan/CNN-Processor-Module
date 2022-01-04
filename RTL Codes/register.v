module register #(parameter N=7) (input [N:0] D,
											 input clk, rst, en,
											 output [N:0] Q);

reg [N:0] temp;

always @(posedge clk or posedge rst)
begin
		if (rst)
			begin
				temp <= {(N+1){1'b0}};
			end
		else if (en == 1'b1)
			temp <= D;
		else
			temp <= temp;
end

assign Q = temp;

endmodule
