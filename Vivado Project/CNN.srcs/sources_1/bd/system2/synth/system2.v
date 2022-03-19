//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sat Feb 26 23:00:38 2022
//Host        : Rei running 64-bit major release  (build 9200)
//Command     : generate_target system2.bd
//Design      : system2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "system2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "system2.hwdef" *) 
module system2
   (Q_0,
    clk_100MHz,
    reset_rtl);
  output [7:0]Q_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN system2_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;

  wire [7:0]blk_mem_gen_0_douta;
  wire clk_100MHz_1;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire [7:0]registers_0_Q;
  wire reset_rtl_1;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;
  wire [0:0]xlconstant_0_dout;

  assign Q_0[7:0] = registers_0_Q;
  assign clk_100MHz_1 = clk_100MHz;
  assign reset_rtl_1 = reset_rtl;
  system2_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clk_wiz_clk_out1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(blk_mem_gen_0_douta),
        .ena(xlconstant_0_dout),
        .wea(1'b0));
  system2_clk_wiz_0 clk_wiz
       (.clk_in1(clk_100MHz_1),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(reset_rtl_1));
  system2_registers_0_0 registers_0
       (.D(blk_mem_gen_0_douta),
        .Q(registers_0_Q),
        .clk(clk_wiz_clk_out1),
        .en(xlconstant_0_dout),
        .rst(rst_clk_wiz_100M_peripheral_aresetn));
  system2_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_rtl_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_out1));
  system2_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
