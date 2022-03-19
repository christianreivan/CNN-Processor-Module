onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib system2_opt

do {wave.do}

view wave
view structure
view signals

do {system2.udo}

run -all

quit -force
