//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sat Feb 26 23:00:38 2022
//Host        : Rei running 64-bit major release  (build 9200)
//Command     : generate_target system2_wrapper.bd
//Design      : system2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module system2_wrapper
   (Q_0,
    clk_100MHz,
    reset_rtl);
  output [7:0]Q_0;
  input clk_100MHz;
  input reset_rtl;

  wire [7:0]Q_0;
  wire clk_100MHz;
  wire reset_rtl;

  system2 system2_i
       (.Q_0(Q_0),
        .clk_100MHz(clk_100MHz),
        .reset_rtl(reset_rtl));
endmodule

module system2_wrapper_tb();
reg clk,rst;
wire [7:0] Out;

system2_wrapper DUT (.Q_0(Out), .clk_100MHz(clk), .reset_rtl(rst));

initial begin
    clk = 1'b1;
    rst = 1'b1;
end

always begin
    #5 clk = ~clk;
end

initial begin
    repeat(1) @(posedge clk);
    rst <= 1'b0;
end

endmodule 
