transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/pet/Documents/Nicolas/tarefas-logica-reconfiguravel/cronometro/BCD_7seg.vhd}
vcom -93 -work work {C:/Users/pet/Documents/Nicolas/tarefas-logica-reconfiguravel/cronometro/cronometro_digital.vhd}
vcom -93 -work work {C:/Users/pet/Documents/Nicolas/tarefas-logica-reconfiguravel/cronometro/cont16.vhd}
vcom -93 -work work {C:/Users/pet/Documents/Nicolas/tarefas-logica-reconfiguravel/cronometro/divisor.vhd}

