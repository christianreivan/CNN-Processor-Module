module mac_datapath(input [7:0] a,b,
		    input clk, rst, en,
	            output [18:0] muxer);

wire select_control1, select_control2;
wire [7:0] to_mult_a, to_mult_b;
wire [17:0] mult_res;
wire [18:0] add_res, add_Regout;


assign mult_res = to_mult_a*to_mult_b;
assign add_res = {1'b0,mult_res} + add_Regout;

register #(.N(7)) inputReg1(.clk(clk), .rst(rst), .en(en), .D(a), .Q(to_mult_a));
register #(.N(7)) inputReg2(.clk(clk), .rst(rst), .en(en), .D(b), .Q(to_mult_b));


register #(.N(18)) adderReg(.clk(clk), .rst(select_control1), .en(en), .D(add_res), .Q(add_Regout));

mac_cu MAC_controller(.clk(clk), .rst(rst), .sel1(select_control1), .sel2(select_control2));

//Mengeluarkan sinyal hasil konvolusi
assign muxer = select_control2 ? 19'b0000000000000000000 : add_res;

endmodule
