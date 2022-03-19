module TMG_DP (input clk, rst,
					output [7:0] teomatrix,
					output [4:0] state, nextstate);
	 
	 wire [7:0] fmap;
	 wire ena;
	 wire [2:0] muxout;
	 wire wr;
	 wire [7:0] addr;
    wire [1:0] muxcontrol1;
	 wire [1:0] muxcontrol2;
	 wire [7:0] in;
	 wire [7:0] muxReg1_Reg2OUTPUT;
    wire [7:0] reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out;
	 

    tmg_CU TMGcontroller(.clk(clk), .rst(rst), .en(ena), .wr(wr), .muxcontrol1(muxcontrol1), .addr(addr),
	                      .muxcontrol2(muxcontrol2), .muxout(muxout), .state(state), .next_state(nextstate));
	 
	 RAM_InterfaceTMG RAM_INPUT(clk, wr, addr, 8'd0, fmap);

    mux4 muxToREG1(muxcontrol1, fmap, reg5_out, reg6_out, 8'd0, in);
	 mux4 muxReg1_Reg2(muxcontrol2, reg1_out, reg5_out, reg6_out, 8'd0, muxReg1_Reg2OUTPUT);
    mux8 mux8out(muxout, in, muxReg1_Reg2OUTPUT, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, 8'bxxxxxxxx,
	              teomatrix);

 
    register #(.N(7)) reg1(.clk(clk), .rst(rst), .en(ena), .D(in),     .Q(reg1_out));
    register #(.N(7)) reg2(.clk(clk), .rst(rst), .en(ena), .D(muxReg1_Reg2OUTPUT), .Q(reg2_out));
    register #(.N(7)) reg3(.clk(clk), .rst(rst), .en(ena), .D(reg2_out), .Q(reg3_out));
    register #(.N(7)) reg4(.clk(clk), .rst(rst), .en(ena), .D(reg3_out), .Q(reg4_out));
    register #(.N(7)) reg5(.clk(clk), .rst(rst), .en(ena), .D(reg4_out), .Q(reg5_out));
	 register #(.N(7)) reg6(.clk(clk), .rst(rst), .en(ena), .D(reg5_out), .Q(reg6_out));
	 
endmodule

//////////////////////////////////////////

module RAM_InterfaceTMG(clk, wr, addr, data_in, data_out);

input clk, wr;
input [7:0] addr;
input [7:0] data_in;
output [7:0] data_out;

reg [7:0] memory[0:255];
reg [7:0] dataout;

initial begin
		$readmemh("FMAP_RAM.txt", memory);
end

always @(posedge clk) begin
	dataout <= dataout;
	
	if (wr)
		begin
			memory[addr] <= data_in;
			$writememh("FMAP_RAM.txt", memory);
		end
	else
		begin
			dataout <= memory[addr];
		end
end

assign data_out = dataout;

endmodule

////////////////TESTBENCH/////////////////

module TMG_TB();

reg clk, rst;
wire [7:0] teomatrix;
wire [7:0] state, nextstate;

TMG_DP TMGDP_DU(.clk(clk), .rst(rst), .teomatrix(teomatrix), .state(state), 
                               .nextstate(nextstate));

always begin
	#50 clk = ~clk;
end

initial begin
	clk = 1'b1;
	rst = 1'b1;
end

initial begin
	#100 rst = 1'b0;
end

/**
always begin
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd2;
	#100.5 fmap = 8'd3;
	#100.5 fmap = 8'd4;
	#100.5 fmap = 8'd5;
	#100.5 fmap = 8'd6;
	#100.5 fmap = 8'd7;
	#100.5 fmap = 8'd8;
	#100.5 fmap = 8'd9;
	// New Sequence of Inputs Filler //
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
	#100.5 fmap = 8'd1;
end
**/

endmodule

