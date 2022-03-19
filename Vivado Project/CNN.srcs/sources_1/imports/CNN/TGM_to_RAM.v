module TGM_to_RAM(clk, wr, rd, addr, nextaddr, data_in, data_out);

input clk, wr, rd;
input [7:0] addr, nextaddr;
input [7:0] data_in;
output [31:0] data_out;

reg [31:0] memory[0:255];
reg [31:0] dataout;
wire [31:0] data_inExtd;

assign data_inExtd = {24'd0, data_in};

initial begin
	$readmemh("TMGOut_RAM.txt", memory);
end

always @(posedge clk) begin
	if (wr)
		begin
			memory[nextaddr] <= data_inExtd;
			$writememh("TMGOut_RAM.txt", memory);
		end
	else
		begin
			dataout <= dataout;
		end

	if (rd)
		begin
			dataout <= memory[addr];
		end
	else
		begin
			dataout <= dataout;
		end
end

assign data_out = dataout;

endmodule

////////////TESTBENCH/////////////

module TGM_to_RAM_TB();

reg clk, wr, rd;
reg [7:0] addr, nextaddr, data_in;
wire [31:0] data_out;

TGM_to_RAM DUT(clk, wr, rd, addr, nextaddr, data_in, data_out);

always begin
	#50 clk = ~clk;
end

initial begin
	clk = 1'b1;
end

initial begin
	rd = 1'b0;
	wr = 1'b0;
	addr = 8'h00;
	nextaddr = 8'h00;
	data_in = 8'd0;
	#100 
	wr = 1'b1;
	rd = 1'b1;
	addr = 8'h00;
	nextaddr = 8'h00;
	data_in = 8'd1;
	#100 
	wr = 1'b1;
	addr = 8'h00;
	nextaddr = 8'h01;
	data_in = 8'd2;
	#100
	wr = 1'b1;
	addr = 8'h01;
	nextaddr = 8'h02;
	data_in = 8'd3;
	#100
	wr = 1'b1;
	addr = 8'h02;
	nextaddr = 8'h03;
	data_in = 8'd4;
	#100
	wr = 1'b1;
	addr = 8'h03;
	nextaddr = 8'h04;
	data_in = 8'd1;
	#100
	wr = 1'b1;
	addr = 8'h05;
	data_in = 8'd2;
	#100
	wr = 1'b0;
	addr = 8'h00;
	data_in = 8'd9;
	#100
	wr = 1'b0;
	addr = 8'h03;
	data_in = 8'd11;
	#100;
end

endmodule
