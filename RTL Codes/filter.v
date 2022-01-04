module filter();

reg clk, rst;

reg [7:0] filter;
wire [7:0] repeatedfil;

filter_genDP filtb(.clk(clk), .rst(rst), . filter(filter), .repeatedfil(repeatedfil));

always
	#50 clk = ~clk;

initial
begin
	clk = 1'b0;
	rst = 1'b0;
	filter = 8'd1;
	#100 filter = 8'd2;
	#100 filter = 8'd3;
	#100 filter = 8'd4;
	#100 filter = 8'd0;
end

endmodule

