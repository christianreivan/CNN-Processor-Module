module tmg (input clk, rst,
				output en, muxcontrol1, muxcontrol2,
				output [3:0] muxout);

reg temp_en;
reg [7:0] state;
reg [7:0] nextstate;
reg [3:0] temp_muxout;
reg temp_muxcontrol1, temp_muxcontrol2;


initial
begin
	state = 8'h00;
	nextstate = 8'h00;
end		

always @(posedge clk or posedge rst)
begin
		if (rst)
			begin
				state <= 8'h00;
			end
		else
			state <= nextstate;
end

always @(state)
begin
		temp_en = 1'b1;
		case (state)
			8'h00: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b1111;
					 end
					 
			8'h01: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0001;
					 end
			
			8'h02: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0001;
						
					 end
			
			8'h03: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0000;
						
					 end
					 
			8'h04: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0000;
						
					 end
			
			8'h05: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0100;
						
					 end
			
			8'h06: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0100;
						
					 end
			
			8'h07: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0011;
						
					 end
			
			8'h08: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0011;
						
					 end
			
			8'h09: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0110;
						
					 end
			
			8'h0a: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0110;
						
					 end
			
			8'h0b: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0101;
						
					 end
			
			8'h0c: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b1;
						temp_muxout = 4'b0101;
						
					 end
			
			8'h0d: begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0111;
						
					 end
			
			8'h0e: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0101;
						
					 end
			
			8'h0f: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b1000;
						
					 end
			
			8'h10: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b1000;
						
					 end
			
			8'h11: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0001;
						
					 end
			
			8'h12: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 1'b0;
						temp_muxout = 4'b0001;
						
					 end
			
			default: begin
							temp_muxcontrol1 = 1'b0;
							temp_muxcontrol2 = 1'b0;
							temp_muxout = 4'b0000;
							temp_en = 1'b0;
						end
		endcase
end

always @(state)
begin
		if (state == 8'h12)
			begin
			nextstate = 8'h03;
			end
		else
			begin
			nextstate = (state + 8'h01);
			end
end

assign muxcontrol1 = temp_muxcontrol1;
assign muxcontrol2 = temp_muxcontrol2;
assign muxout = temp_muxout;

assign en = temp_en;

endmodule
