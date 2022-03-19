module mac_datapath(input clk, rst,
						  output [5:0] state, next_state,
	                 output [63:0] macOUT);

/**Wires needed from mac_cu module**/
wire mac_reset;
wire wrFilter, wrTMG, rdFilter, rdTMG;
wire [1:0] sel;
wire [7:0] addr, nextaddr;

/**Wires needed from mac_datapath module**/
wire [31:0] TMGtobeMult, FILTERtobeMult;
wire [63:0] mult_out;
wire [63:0] sum_out, intoReg;
wire [63:0] outfromReg;

/**Wires needed from TMG_Datapath module**/
wire [7:0] teomatrix;

/**Wires needed from FILTER_Datapath module**/
wire [7:0] repeatedfil;

assign mult_out = TMGtobeMult*FILTERtobeMult;
assign sum_out = mult_out + outfromReg;
assign intoReg = sum_out;

mux4 #(.N(63)) MUXtoOUT(sel, {64{1'bx}}, {64{1'bz}}, mult_out, sum_out, macOUT);

register #(.N(63)) tempSumREG(.clk(clk), .rst(mac_reset), .en(1'b1), .D(intoReg), .Q(outfromReg));

mac_cu MAC_Controller(clk, rst, addr, nextaddr, sel, state, next_state,
                      mac_reset, wrFilter, wrTMG, rdFilter, rdTMG);

TGM_to_RAM fromTMGtoRAM(clk, wrTMG, rdTMG, addr, nextaddr, teomatrix, TMGtobeMult);
FILTER_to_RAM fromFILTERtoRAM(clk, wrFilter, rdFilter, addr, nextaddr, repeatedfil, FILTERtobeMult);


TMG_DP TMG_Datapath(clk, rst, teomatrix);
filter_genDP FILTER_Datapath(clk, rst, repeatedfil);

endmodule

//////////////////TESTBENCH///////////////////

module MAC_TESTBENCH();

reg clk, rst;

wire [5:0] state, next_state;
wire [63:0] macOUT;

mac_datapath MAC_DatapathDUT (clk, rst, state, next_state, macOUT);

always begin
	#100 clk = ~clk;
end

initial begin
	clk = 1'b1;
	rst = 1'b1;
end

initial begin
	#200
	rst = 1'b0;
end

endmodule
