module tmgall (input clk, rst,
					input [7:0] fmap,
					output [7:0] teomatrix);

	 wire ena;
    wire [7:0] tempmux8outholder;
    reg [7:0] tempteomatrix = 8'h00;

    wire muxcontrol1, muxcontrol2;
    wire [3:0] muxout;

    wire [7:0] reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, reg8_out, dataReg5, dataReg7;


    always @(posedge clk or posedge rst)
    begin
		if(rst) tempteomatrix <= 8'h00;
		else if (muxout == 4'b1111)
			begin
				tempteomatrix <= tempteomatrix;
			end
		else
			tempteomatrix <= tempmux8outholder;
    end


    tmg controller(.clk(clk), .rst(rst), .en(ena), .muxcontrol1(muxcontrol1), .muxcontrol2(muxcontrol2), .muxout(muxout));

    mux2 mux2a(.sel(muxcontrol1), .a(reg4_out), .b(reg8_out), .outmux2(dataReg5));
    mux2 mux2b(.sel(muxcontrol2), .a(reg6_out), .b(reg8_out), .outmux2(dataReg7));
    mux8 mux8out(.sel(muxout), .a(fmap), .b(reg1_out), .c(reg2_out), .d(reg3_out), .e(reg4_out), .f(reg5_out), .g(reg6_out), .h(reg7_out), .i(reg8_out), .outmux9(tempmux8outholder));

 
    register #(.N(7)) reg1(.clk(clk), .rst(rst), .en(ena), .D(fmap),     .Q(reg1_out));
    register #(.N(7)) reg2(.clk(clk), .rst(rst), .en(ena), .D(reg1_out), .Q(reg2_out));
    register #(.N(7)) reg3(.clk(clk), .rst(rst), .en(ena), .D(reg2_out), .Q(reg3_out));
    register #(.N(7)) reg4(.clk(clk), .rst(rst), .en(ena), .D(reg3_out), .Q(reg4_out));
    register #(.N(7)) reg5(.clk(clk), .rst(rst), .en(ena), .D(dataReg5), .Q(reg5_out));
    register #(.N(7)) reg6(.clk(clk), .rst(rst), .en(ena), .D(reg5_out), .Q(reg6_out));
    register #(.N(7)) reg7(.clk(clk), .rst(rst), .en(ena), .D(dataReg7), .Q(reg7_out));
    register #(.N(7)) reg8(.clk(clk), .rst(rst), .en(ena), .D(reg7_out), .Q(reg8_out));

    assign teomatrix = tempteomatrix;
	 
endmodule