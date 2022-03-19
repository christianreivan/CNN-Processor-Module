module cnn(input [7:0] filtermap, inputFmap,
			  input clock, reset, enable,
			  output [18:0] convolution);
			  

wire [7:0] savedteoplitzmat;
wire [7:0] savedrepeatedfill;

filter_genDP FILTER(.filter(filtermap), .repeatedfil(savedrepeatedfill), .clk(clock), .rst(reset));
mac_datapath MAC(.a(savedrepeatedfill), .b(savedteoplitzmat), .clk(clock), .rst(reset), .en(enable), .muxer(convolution));
tmgall TMG(.fmap(inputFmap), .teomatrix(savedteoplitzmat), .clk(clock), .rst(reset));

endmodule
