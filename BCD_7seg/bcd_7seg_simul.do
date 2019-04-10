vcom -reportprogress 300 -work work C:/Users/pet/Documents/Nicolas/BCD_7seg/BCD_7seg.vhd
vcom -reportprogress 300 -work work C:/Users/pet/Documents/Nicolas/BCD_7seg/BCD_7seg_tb.vhd
vsim rtl_work.bcd_7seg_tb(arch_bcd_7seg_tb)
add wave -r /*
run 2 us