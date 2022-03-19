module mac_cu(input clk, rst,
				  output [7:0] addr, nextaddr,
				  output [1:0] sel,
				  output [5:0] state, next_state,
				  output mac_reset, wrFilter, wrTMG, rdFilter, rdTMG
				 );

reg [5:0] nextstate;
wire [5:0] state_comb;
reg [7:0] temp_nextaddr;
wire [7:0] temp_addr;
reg temp_wrFilter, temp_wrTMG, temp_rdFilter, temp_rdTMG, temp_mac_reset;
reg [1:0] temp_sel;

register #(.N(5)) regSTATE(.clk(clk), .rst(rst), .en(1'b1), .D(nextstate), .Q(state_comb));
register #(.N(7)) regADDR(.clk(clk), .rst(rst), .en(1'b1), .D(temp_nextaddr), .Q(temp_addr));


always @(*)
begin
	if (state_comb > 6'd3)
		begin
		  temp_nextaddr = temp_addr + 8'h01;
		end
	else
		begin
		  temp_nextaddr = temp_addr;
		end
end

always @(*)
begin
	if (state_comb == 6'd19)
		begin
		  nextstate = 6'd3;
		end
	else
		begin
		  nextstate = (state_comb + 6'd1);
		end
end

always @(*)
begin
	temp_sel = 2'b11;
	temp_wrFilter  = 1'b1;
	temp_wrTMG		= 1'b1;
	temp_rdFilter  = 1'b1;
	temp_rdTMG     = 1'b1;
	temp_mac_reset = 1'b0;
	
	case (state_comb)
		6'd0: begin				     //output is still unknown because MAC block is still inactive
					temp_mac_reset = 1'b1;
					temp_sel = 2'b00;
					temp_wrFilter  = 1'b0;
					temp_wrTMG		= 1'b0;
					temp_rdFilter  = 1'b0;
					temp_rdTMG     = 1'b0;
				end
		6'd1: begin
					temp_mac_reset = 1'b1;
					temp_sel = 2'b00;
					temp_wrFilter  = 1'b0;
					temp_wrTMG		= 1'b0;
					temp_rdFilter  = 1'b0;
					temp_rdTMG     = 1'b0;
				end
		6'd2: begin
					temp_mac_reset = 1'b1;
					temp_sel = 2'b00;
					temp_wrFilter  = 1'b0;
					temp_wrTMG		= 1'b0;
					temp_rdFilter  = 1'b0;
					temp_rdTMG     = 1'b0;
				end
		6'd3: begin
					temp_mac_reset = 1'b1;
					temp_sel = 2'b00;
				end
		6'd4: begin						//MAC block is idle, but still cannot output anything, so sel is assigned with 'z'
					temp_sel = 2'b01;
				end
		6'd5: begin
					temp_sel = 2'b01;
				end
		6'd6: begin
					temp_sel = 2'b01;
				end
		6'd7: begin
					temp_mac_reset = 1'b1;
				end
		6'd8: begin
					temp_sel = 2'b01;
				end
		6'd9: begin
					temp_sel = 2'b01;
				end
		6'd10: begin
					temp_sel = 2'b01;
				end
		6'd11: begin
					temp_mac_reset = 1'b1;
				 end
		6'd12: begin
					temp_sel = 2'b01;
				end
		6'd13: begin
					temp_sel = 2'b01;
				end
		6'd14: begin
					temp_sel = 2'b01;
				end		
		6'd15: begin
					temp_mac_reset = 1'b1;
				 end	
		6'd16: begin
					temp_sel = 2'b01;
				end
		6'd17: begin
					temp_sel = 2'b01;
				end
		6'd18: begin
					temp_sel = 2'b01;
				end
		6'd19: begin
					temp_mac_reset = 1'b1;
					temp_wrFilter  = 1'b0;
					temp_wrTMG		= 1'b0;
					temp_rdFilter  = 1'b1;
					temp_rdTMG     = 1'b1;
				 end
		default: begin
						temp_wrFilter  = 1'b0;
						temp_wrTMG		= 1'b0;
						temp_rdFilter  = 1'b0;
						temp_rdTMG     = 1'b0;
					end
	endcase
end

assign addr = temp_addr;
assign nextaddr = temp_nextaddr;
assign mac_reset = temp_mac_reset;
assign wrFilter = temp_wrFilter;
assign wrTMG = temp_wrTMG;
assign rdFilter = temp_rdFilter;
assign rdTMG = temp_rdTMG;
assign sel = temp_sel;
assign state = state_comb;
assign next_state = nextstate;

endmodule

/////////////////TESTBENCH///////////////////

module macCU_TB();

reg clk, rst;

wire [7:0] addr, nextaddr;
wire [1:0] sel;
wire [5:0] state, next_state;
wire mac_reset, wrFilter, wrTMG, rdFilter, rdTMG;

mac_cu MAC_CU_DUT(clk, rst, addr, nextaddr, sel, state, next_state, mac_reset, wrFilter, wrTMG, rdFilter, rdTMG);

always begin
	#50 clk = ~clk;
end

initial begin
	clk = 1'b1;
	rst = 1'b1;
end

initial begin
	#100
	rst = 1'b0;
end

endmodule
