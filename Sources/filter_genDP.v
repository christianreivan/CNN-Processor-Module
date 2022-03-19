module filter_genDP (input clk, rst,
						   output [7:0] repeatedfil,
							output [4:0] state, nextstate);
	 
	 wire [7:0] filter;
	 
	 wire [7:0] filterAFTERmuxed, reg1outAFTERmuxed;
	 
	 wire ena;
	 wire wr;
	 wire [7:0] addr;
    wire muxcontrol1;
	 wire [1:0] muxcontrol2;
    wire [2:0] muxout;

    wire [7:0] reg1_out, reg2_out, reg3_out, reg4_out, reg5_out;

    filter_genCU filtercontroller(.clk(clk), .rst(rst), .en(ena), .wr(wr), .muxcontrol1(muxcontrol1),
	                               .muxcontrol2(muxcontrol2), .addr(addr), .muxout(muxout), .state(state),
											 .next_state(nextstate));
											 
	 RAM_InterfaceFILTER RAM_FILTER(clk, wr, addr, 8'd0, filter);
	 
    mux2 MUX_ToReg1(muxcontrol1, filter, 8'd0, filterAFTERmuxed);
	 mux4 MUXReg1_Reg2(muxcontrol2, reg1_out, reg3_out, reg4_out, reg5_out, reg1outAFTERmuxed);
	 mux8 MUX_OUT(muxout, filterAFTERmuxed, reg1_out, reg1outAFTERmuxed, reg2_out, reg3_out, 
	              reg4_out, reg5_out, 8'bxxxxxxxx, repeatedfil);


    register #(.N(7)) reg1(.clk(clk), .rst(rst), .en(ena), .D(filterAFTERmuxed),   .Q(reg1_out));
    register #(.N(7)) reg2(.clk(clk), .rst(rst), .en(ena), .D(reg1outAFTERmuxed),   .Q(reg2_out));
    register #(.N(7)) reg3(.clk(clk), .rst(rst), .en(ena), .D(reg2_out), .Q(reg3_out));
    register #(.N(7)) reg4(.clk(clk), .rst(rst), .en(ena), .D(reg3_out), .Q(reg4_out));
    register #(.N(7)) reg5(.clk(clk), .rst(rst), .en(ena), .D(reg4_out), .Q(reg5_out));

	 
endmodule

///////////////////////////////////////////

module RAM_InterfaceFILTER(clk, wr, addr, data_in, data_out);

input clk, wr;
input [7:0] addr;
input [7:0] data_in;
output [7:0] data_out;

reg [7:0] memory[0:255];
reg [7:0] dataout;

initial begin
		$readmemh("FILTER_RAM.mem", memory);
end

always @(posedge clk) begin
	dataout <= dataout;
	
	if (wr)
		begin
			memory[addr] <= data_in;
			$writememh("FILTER_RAM.mem", memory);
		end
	else
		begin
			dataout <= memory[addr];
		end
end

assign data_out = dataout;

endmodule

////////////////TESTBENCH/////////////////

module filter_genDP_TB();

reg clk, rst;
wire [7:0] repeatedfil;
wire [4:0] state, nextstate;

filter_genDP filterRepeaterDUT(.clk(clk), .rst(rst), .repeatedfil(repeatedfil), .state(state), 
                               .nextstate(nextstate));

always begin
	#50 clk = ~clk;
end

initial begin
	clk = 1'b1;
	rst = 1'b1;
end

initial begin
	repeat(1) @(posedge clk);
	rst <= 1'b0;
end

/**
always begin
	#100.5 filter = 8'd1;
	#100.5 filter = 8'd2;
	#100.5 filter = 8'd3;
	#100.5 filter = 8'd4;
	#1300;
end
**/

endmodule

