transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/DAELN/Downloads/laboratorios-logica-reconfiguravel/sinais_e_variaveis/sinais_e_variaveis.vhd}

