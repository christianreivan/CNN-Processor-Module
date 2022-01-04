module mux8(input [3:0] sel,
            input [7:0] a,b,c,d,e,f,g,h,i,
				output [7:0] outmux9);

reg [7:0] temp;

always @*
begin
	case (sel)
	4'b0000: temp = a;
	4'b0001: temp = b;
	4'b0010: temp = c;
	4'b0011: temp = d;
	4'b0100: temp = e;
	4'b0101: temp = f;
	4'b0110: temp = g;
	4'b0111: temp = h;
	4'b1000: temp = i;
	default: begin
					temp = 8'h00;
				end
	endcase
end

assign outmux9 = temp;

endmodule