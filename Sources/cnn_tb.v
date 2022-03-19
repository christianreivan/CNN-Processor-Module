module cnn_tb();

reg clock, reset, enable;
reg [7:0] filtermap, inputFmap;

wire [18:0] convolution;

cnn CNN_tb(.clock(clock), .reset(reset), .enable(enable), .filtermap(filtermap), .inputFmap(inputFmap), .convolution(convolution));

always
	#50 clock = ~clock;

initial
begin
	clock = 1'b0;
	reset = 1'b0;
	enable = 1'b1;
	filtermap      = 8'd1; inputFmap = 8'd1;
	#100 filtermap = 8'd2; inputFmap = 8'd2;
	#100 filtermap = 8'd3; inputFmap = 8'd3;
	#100 filtermap = 8'd4; inputFmap = 8'd4;
	#100 filtermap = 8'd0; inputFmap = 8'd5;
	#100 filtermap = 8'd0; inputFmap = 8'd6;
	#100 filtermap = 8'd0; inputFmap = 8'd7;
	#100 filtermap = 8'd0; inputFmap = 8'd8;
	#100 filtermap = 8'd0; inputFmap = 8'd9;
	#100 filtermap = 8'd0; inputFmap = 8'd0;
end

endmodule