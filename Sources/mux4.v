module mux4 #(parameter N=7) (input [1:0] sel,
										input [N:0] in0,in1,in2,in3,
										output [N:0] outmux4);

assign outmux4 = (sel == 2'd0) ? in0 :
					  (
					  (sel == 2'd1) ? in1 :
					  (
					  (sel == 2'd2) ? in2 :
					  (
					  (sel == 2'd3) ? in3 : in3)));

endmodule

module mux4_TB();

reg [1:0] sel;
reg [7:0] in0, in1, in2, in3;
wire [7:0] outmux4;

mux4 MUX4_DUT(sel, in0, in1, in2, in3, outmux4);

initial begin
    sel = 2'b00;
    in0   = 8'd1;
	 in1   = 8'd4;
	 in2   = 8'd9;
	 in3	  = 8'd15;
end

initial begin
    #100
	 sel = 2'b01;
	 #100
	 sel = 2'b10;
	 #100
	 sel = 2'b11;
	 #200;
end

endmodule
