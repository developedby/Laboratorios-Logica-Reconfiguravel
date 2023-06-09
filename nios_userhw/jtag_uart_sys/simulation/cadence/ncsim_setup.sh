
# (C) 2001-2019 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0 156 win32 2019.06.12.10:41:58

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="jtag_uart_sys"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/13.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/rsp_xbar_mux_001/
mkdir -p ./libraries/rsp_xbar_mux/
mkdir -p ./libraries/rsp_xbar_demux_002/
mkdir -p ./libraries/cmd_xbar_mux/
mkdir -p ./libraries/cmd_xbar_demux_001/
mkdir -p ./libraries/cmd_xbar_demux/
mkdir -p ./libraries/id_router_002/
mkdir -p ./libraries/id_router/
mkdir -p ./libraries/addr_router_001/
mkdir -p ./libraries/addr_router/
mkdir -p ./libraries/cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/cpu/
mkdir -p ./libraries/memory/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/cycloneii/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_rf_ram_b.mif ./
  cp -f $QSYS_SIMDIR/submodules/jtag_uart_sys_memory.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera      
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm         
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm         
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate       
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate       
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf   
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf   
  ncvlog -sv  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_atoms.vhd"              -work cycloneii   
  ncvhdl -v93 "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneii_components.vhd"         -work cycloneii   
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_irq_mapper.vho"                                                               -work irq_mapper                                                               -cdslib ./cds_libs/irq_mapper.cds.lib                                                              
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_rsp_xbar_mux_001.vho"                                                         -work rsp_xbar_mux_001                                                         -cdslib ./cds_libs/rsp_xbar_mux_001.cds.lib                                                        
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_rsp_xbar_mux.vho"                                                             -work rsp_xbar_mux                                                             -cdslib ./cds_libs/rsp_xbar_mux.cds.lib                                                            
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_rsp_xbar_demux_002.vho"                                                       -work rsp_xbar_demux_002                                                       -cdslib ./cds_libs/rsp_xbar_demux_002.cds.lib                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cmd_xbar_mux.vho"                                                             -work cmd_xbar_mux                                                             -cdslib ./cds_libs/cmd_xbar_mux.cds.lib                                                            
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cmd_xbar_demux_001.vho"                                                       -work cmd_xbar_demux_001                                                       -cdslib ./cds_libs/cmd_xbar_demux_001.cds.lib                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cmd_xbar_demux.vho"                                                           -work cmd_xbar_demux                                                           -cdslib ./cds_libs/cmd_xbar_demux.cds.lib                                                          
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_id_router_002.vho"                                                            -work id_router_002                                                            -cdslib ./cds_libs/id_router_002.cds.lib                                                           
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_id_router.vho"                                                                -work id_router                                                                -cdslib ./cds_libs/id_router.cds.lib                                                               
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_addr_router_001.vho"                                                          -work addr_router_001                                                          -cdslib ./cds_libs/addr_router_001.cds.lib                                                         
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_addr_router.vho"                                                              -work addr_router                                                              -cdslib ./cds_libs/addr_router.cds.lib                                                             
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.vho" -work cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -cdslib ./cds_libs/cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.cds.lib
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_jtag_uart.vhd"                                                                -work jtag_uart                                                                -cdslib ./cds_libs/jtag_uart.cds.lib                                                               
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu.vhd"                                                                      -work cpu                                                                      -cdslib ./cds_libs/cpu.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_jtag_debug_module_sysclk.vhd"                                             -work cpu                                                                      -cdslib ./cds_libs/cpu.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_jtag_debug_module_tck.vhd"                                                -work cpu                                                                      -cdslib ./cds_libs/cpu.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_jtag_debug_module_wrapper.vhd"                                            -work cpu                                                                      -cdslib ./cds_libs/cpu.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_oci_test_bench.vhd"                                                       -work cpu                                                                      -cdslib ./cds_libs/cpu.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_cpu_test_bench.vhd"                                                           -work cpu                                                                      -cdslib ./cds_libs/cpu.cds.lib                                                                     
  ncvhdl -v93 "$QSYS_SIMDIR/submodules/jtag_uart_sys_memory.vhd"                                                                   -work memory                                                                   -cdslib ./cds_libs/memory.cds.lib                                                                  
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys.vhd"                                                                                                                                                                                                                                                                       
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_cpu_jtag_debug_module_translator.vhd"                                                                                                                                                                                                                                      
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_memory_s1_translator.vhd"                                                                                                                                                                                                                                                  
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_jtag_uart_avalon_jtag_slave_translator.vhd"                                                                                                                                                                                                                                
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_rst_controller.vhd"                                                                                                                                                                                                                                                        
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_rst_controller_001.vhd"                                                                                                                                                                                                                                                    
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_cpu_data_master_translator.vhd"                                                                                                                                                                                                                                            
  ncvhdl -v93 "$QSYS_SIMDIR/jtag_uart_sys_cpu_instruction_master_translator.vhd"                                                                                                                                                                                                                                     
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen -relax $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
