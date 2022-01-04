module mac_cu(input rst, clk,
	      output sel1,
	      output sel2);

reg [3:0] state, nextstate;
reg tempsel1, tempsel2;

initial
begin
	state = 4'd0;
	nextstate = 4'd0;
end

always @(posedge clk or posedge rst)
begin
	if (rst)
		begin 
			state <= 4'd0;
		end
	else
			state <= nextstate;
end

always @(state)
begin
	if (state == 4'd7)
		begin
		  nextstate = 4'd4;
		end
	else
		begin
		  nextstate = (state + 4'd1);
		end
end

always @(state)
begin
	case (state)
	4'd0: begin
		tempsel1 <= 1'b1;
		tempsel2 <= 1'b1;
	      end
	4'd1: begin
		tempsel1 <= 1'b1;
		tempsel2 <= 1'b1;
	      end
	4'd2: begin
		tempsel1 <= 1'b0;
		tempsel2 <= 1'b1;
	      end
	4'd3: begin
		tempsel1 <= 1'b0;
		tempsel2 <= 1'b1;
	      end
	4'd4: begin
		tempsel1 <= 1'b0;
		tempsel2 <= 1'b1;
	      end
	4'd5: begin
		tempsel1 <= 1'b0;
		tempsel2 <= 1'b1;
	      end
	4'd6: begin
		tempsel1 <= 1'b0;
		tempsel2 <= 1'b0;
	      end
	4'd7: begin
		tempsel1 <= 1'b1;
		tempsel2 <= 1'b1;
	      end
	default: begin
		 end
	endcase
end

assign sel1 = tempsel1;
assign sel2 = tempsel2;


endmodule