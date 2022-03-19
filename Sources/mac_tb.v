module mac_tb();

reg clk, rst, en;
reg [7:0] a,b;
wire [18:0] muxer;

mac_datapath mactb(.clk(clk), .rst(rst), .en(en), .a(a), .b(b), .muxer(muxer));

always
	#50 clk = ~clk;

initial
begin
	clk = 1'b0;
	rst = 1'b0;
	en  = 1'b1;
	a   = 8'd0; b = 8'd0;
	#150 a = 8'd1; b = 8'd1;
	#100 a = 8'd2; b = 8'd2;
	#100 a = 8'd3; b = 8'd4;
	#100 a = 8'd4; b = 8'd5;
	#100 a = 8'd1; b = 8'd2;
	#100 a = 8'd2; b = 8'd3;
	#100 a = 8'd3; b = 8'd5;
	#100 a = 8'd4; b = 8'd6;
	#100 a = 8'd1; b = 8'd4;
	#100 a = 8'd2; b = 8'd5;
	#100 a = 8'd3; b = 8'd7;
	#100 a = 8'd4; b = 8'd8;
	#100 a = 8'd1; b = 8'd5;
	#100 a = 8'd2; b = 8'd6;
	#100 a = 8'd3; b = 8'd8;
	#100 a = 8'd4; b = 8'd9;
	#100 a = 8'd0; b = 8'd0;
end

endmodule

