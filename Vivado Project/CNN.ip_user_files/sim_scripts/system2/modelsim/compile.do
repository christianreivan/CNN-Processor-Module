vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/xlconstant_v1_1_7
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4

vlog -work xil_defaultlib  -incr "+incdir+../../../../CNN.srcs/sources_1/bd/system2/ipshared/8b3d" \
"../../../bd/system2/sim/system2.v" \
"../../../bd/system2/ip/system2_registers_0_0/sim/system2_registers_0_0.v" \
"../../../bd/system2/ip/system2_clk_wiz_0/system2_clk_wiz_0_clk_wiz.v" \
"../../../bd/system2/ip/system2_clk_wiz_0/system2_clk_wiz_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../CNN.srcs/sources_1/bd/system2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../CNN.srcs/sources_1/bd/system2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/system2/ip/system2_rst_clk_wiz_100M_0/sim/system2_rst_clk_wiz_100M_0.vhd" \

vlog -work xlconstant_v1_1_7  -incr "+incdir+../../../../CNN.srcs/sources_1/bd/system2/ipshared/8b3d" \
"../../../../CNN.srcs/sources_1/bd/system2/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../CNN.srcs/sources_1/bd/system2/ipshared/8b3d" \
"../../../bd/system2/ip/system2_xlconstant_0_0/sim/system2_xlconstant_0_0.v" \

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../CNN.srcs/sources_1/bd/system2/ipshared/8b3d" \
"../../../../CNN.srcs/sources_1/bd/system2/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../CNN.srcs/sources_1/bd/system2/ipshared/8b3d" \
"../../../bd/system2/ip/system2_blk_mem_gen_0_0/sim/system2_blk_mem_gen_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

