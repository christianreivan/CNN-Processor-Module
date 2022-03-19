module filter_genCU (input clk, rst,
						   output en, wr, muxcontrol1,
							output [1:0] muxcontrol2,
				         output [2:0] muxout,
							output [7:0] addr,
							inout [4:0] state, next_state);

reg temp_en, temp_wr;
reg [7:0] temp_addr;
reg [4:0] nextstate;
reg [2:0] temp_muxout;
reg temp_muxcontrol1;
reg [1:0] temp_muxcontrol2;
wire [4:0] state_comb;

assign state = state_comb;
assign next_state = nextstate;

register #(.N(4)) regFilterCU(.clk(clk), .rst(rst), .en(1'b1), .D(nextstate), .Q(state_comb));

always @(posedge clk)
begin
	if (rst)
		begin
			temp_addr <= 8'h00;
		end
	else
		begin
			temp_addr <= temp_addr + 8'h01;
		end
end

always @(*)
begin
		temp_en = 1'b1;
		temp_wr = 1'b0;
		case (state_comb)
			5'd0: begin
						temp_en = 1'b0;
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd7;
					 end
			5'd1: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd7;
					 end
			5'd2: begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd7;
					end
			5'd3:	begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd3;
					end
			5'd4:	begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd3;
					end
			5'd5: begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd3;
					end
			5'd6:	begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd7:	begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd8:	begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd9:	begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd10: begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd11:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd12:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd13:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd14:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd15:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd16:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd17:begin
						temp_muxcontrol1 = 1'b1;
						temp_muxcontrol2 = 2'b11;
						temp_muxout = 3'd3;
					end
			5'd18:begin
						temp_muxcontrol1 = 1'b0;
						temp_muxcontrol2 = 2'b00;
						temp_muxout = 3'd3;
					end
					
			default: begin
							temp_en = 1'b0;
							temp_muxcontrol1 = 1'b0;
							temp_muxcontrol2 = 2'b00;
							temp_muxout = 3'd7;
						end
		endcase
end

always @(*)
begin
		if (state_comb == 5'd18)
			begin
				nextstate = 5'd1;
			end
		else
			begin
				nextstate = (state_comb + 5'd1);
			end
end

assign muxcontrol1 = temp_muxcontrol1;
assign muxcontrol2 = temp_muxcontrol2;
assign muxout = temp_muxout;
assign en = temp_en;
assign wr = temp_wr;
assign addr = temp_addr;

endmodule

///////////////TESTBENCH/////////////////

module filterCU_TB();

reg clk;
reg rst;
wire en;
wire muxcontrol1;
wire [1:0] muxcontrol2;
wire [2:0] muxout;

filter_genCU filterCU_DUT(clk, rst, en, muxcontrol1, muxcontrol2, muxout);

initial begin
    clk = 1'b1;
    rst = 1'b1;
end

always begin
    #50
    clk = ~clk;
end

initial begin
    #100
    rst = 1'b0;
end

endmodule
