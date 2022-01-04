module tmg_tb();

reg clk, rst;

reg [7:0] fmap;
wire [7:0] teomatrix;

tmgall tmgtb(.clk(clk), .rst(rst), . fmap(fmap), .teomatrix(teomatrix));

always
	#50 clk = ~clk;

initial
begin
	clk = 1'b0;
	rst = 1'b0;
	fmap = 8'd1;
	#100 fmap = 8'd2;
	#100 fmap = 8'd3;
	#100 fmap = 8'd4;
	#100 fmap = 8'd5;
	#100 fmap = 8'd6;
	#100 fmap = 8'd7;
	#100 fmap = 8'd8;
	#100 fmap = 8'd9;
	#100 fmap = 8'd0;
end

endmodule

