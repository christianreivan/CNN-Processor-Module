onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xlconstant_v1_1_7 -L blk_mem_gen_v8_4_4 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.system2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {system2.udo}

run -all

quit -force
