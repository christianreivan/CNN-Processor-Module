module mux2(input sel,
				input [7:0] a,b,
				output [7:0] outmux2);

assign outmux2 = sel ? b : a;

endmodule