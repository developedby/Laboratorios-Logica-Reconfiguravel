transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/DAELN/Downloads/laboratorios-logica-reconfiguravel/maquina_estados/cont8.vhd}
vcom -93 -work work {C:/Users/DAELN/Downloads/laboratorios-logica-reconfiguravel/maquina_estados/cont64.vhd}
vcom -93 -work work {C:/Users/DAELN/Downloads/laboratorios-logica-reconfiguravel/maquina_estados/maquina_estados.vhd}
vcom -93 -work work {C:/Users/DAELN/Downloads/laboratorios-logica-reconfiguravel/maquina_estados/divisor.vhd}

