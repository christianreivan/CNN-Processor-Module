module mux8(input [2:0] sel,
            input [7:0] in0,in1,in2,in3,in4,in5,in6,in7,
				output [7:0] outmux8);



assign outmux8 = (sel == 3'd0) ? in0 : 
					  (
                 (sel == 3'd1) ? in1 : 
					  (
					  (sel == 3'd2) ? in2 : 
					  (
					  (sel == 3'd3) ? in3 :
					  (
					  (sel == 3'd4) ? in4 :
					  (
					  (sel == 3'd5) ? in5 :
					  (
					  (sel == 3'd6) ? in6 :
					  (
					  (sel == 3'd7) ? in7 :
					  in7)))))));

endmodule
