--Legal Notice: (C)2019 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.all;

entity jtag_uart_sys_cpu_register_bank_a_module is 
        generic (
                 lpm_file : STRING := "UNUSED"
                 );
        port (
              -- inputs:
                 signal clock : IN STD_LOGIC;
                 signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity jtag_uart_sys_cpu_register_bank_a_module;


architecture europa of jtag_uart_sys_cpu_register_bank_a_module is
  component altsyncram is
GENERIC (
      address_reg_b : STRING;
        init_file : STRING;
        maximum_depth : NATURAL;
        numwords_a : NATURAL;
        numwords_b : NATURAL;
        operation_mode : STRING;
        outdata_reg_b : STRING;
        ram_block_type : STRING;
        rdcontrol_reg_b : STRING;
        read_during_write_mode_mixed_ports : STRING;
        width_a : NATURAL;
        width_b : NATURAL;
        widthad_a : NATURAL;
        widthad_b : NATURAL
      );
    PORT (
    signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal wren_a : IN STD_LOGIC;
        signal clock0 : IN STD_LOGIC;
        signal address_a : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal address_b : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component altsyncram;
                signal ram_q :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  q <= ram_q;
  the_altsyncram : altsyncram
    generic map(
      address_reg_b => "CLOCK0",
      init_file => lpm_file,
      maximum_depth => 0,
      numwords_a => 32,
      numwords_b => 32,
      operation_mode => "DUAL_PORT",
      outdata_reg_b => "UNREGISTERED",
      ram_block_type => "AUTO",
      rdcontrol_reg_b => "CLOCK0",
      read_during_write_mode_mixed_ports => "DONT_CARE",
      width_a => 32,
      width_b => 32,
      widthad_a => 5,
      widthad_b => 5
    )
    port map(
            address_a => wraddress,
            address_b => rdaddress,
            clock0 => clock,
            data_a => data,
            q_b => ram_q,
            wren_a => wren
    );


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.all;

entity jtag_uart_sys_cpu_register_bank_b_module is 
        generic (
                 lpm_file : STRING := "UNUSED"
                 );
        port (
              -- inputs:
                 signal clock : IN STD_LOGIC;
                 signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                 signal wren : IN STD_LOGIC;

              -- outputs:
                 signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity jtag_uart_sys_cpu_register_bank_b_module;


architecture europa of jtag_uart_sys_cpu_register_bank_b_module is
  component altsyncram is
GENERIC (
      address_reg_b : STRING;
        init_file : STRING;
        maximum_depth : NATURAL;
        numwords_a : NATURAL;
        numwords_b : NATURAL;
        operation_mode : STRING;
        outdata_reg_b : STRING;
        ram_block_type : STRING;
        rdcontrol_reg_b : STRING;
        read_during_write_mode_mixed_ports : STRING;
        width_a : NATURAL;
        width_b : NATURAL;
        widthad_a : NATURAL;
        widthad_b : NATURAL
      );
    PORT (
    signal q_b : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal wren_a : IN STD_LOGIC;
        signal clock0 : IN STD_LOGIC;
        signal address_a : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal address_b : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        signal data_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component altsyncram;
                signal ram_q :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  q <= ram_q;
  the_altsyncram : altsyncram
    generic map(
      address_reg_b => "CLOCK0",
      init_file => lpm_file,
      maximum_depth => 0,
      numwords_a => 32,
      numwords_b => 32,
      operation_mode => "DUAL_PORT",
      outdata_reg_b => "UNREGISTERED",
      ram_block_type => "AUTO",
      rdcontrol_reg_b => "CLOCK0",
      read_during_write_mode_mixed_ports => "DONT_CARE",
      width_a => 32,
      width_b => 32,
      widthad_a => 5,
      widthad_b => 5
    )
    port map(
            address_a => wraddress,
            address_b => rdaddress,
            clock0 => clock,
            data_a => data,
            q_b => ram_q,
            wren_a => wren
    );


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jtag_uart_sys_cpu is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal d_irq : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d_waitrequest : IN STD_LOGIC;
                 signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal i_waitrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal d_address : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
                 signal d_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal d_read : OUT STD_LOGIC;
                 signal d_write : OUT STD_LOGIC;
                 signal d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal i_address : OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
                 signal i_read : OUT STD_LOGIC;
                 signal no_ci_readra : OUT STD_LOGIC
              );
end entity jtag_uart_sys_cpu;


architecture europa of jtag_uart_sys_cpu is
component jtag_uart_sys_cpu_test_bench is 
           port (
                 -- inputs:
                    signal D_iw : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal D_iw_op : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
                    signal D_iw_opx : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
                    signal D_valid : IN STD_LOGIC;
                    signal E_valid : IN STD_LOGIC;
                    signal F_pcb : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
                    signal F_valid : IN STD_LOGIC;
                    signal R_ctrl_ld : IN STD_LOGIC;
                    signal R_ctrl_ld_non_io : IN STD_LOGIC;
                    signal R_dst_regnum : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal R_wr_dst_reg : IN STD_LOGIC;
                    signal W_valid : IN STD_LOGIC;
                    signal W_vinst : IN STD_LOGIC_VECTOR (55 DOWNTO 0);
                    signal W_wr_data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal av_ld_data_aligned_unfiltered : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal d_address : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
                    signal d_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal d_read : IN STD_LOGIC;
                    signal d_write_nxt : IN STD_LOGIC;
                    signal i_address : IN STD_LOGIC_VECTOR (13 DOWNTO 0);
                    signal i_read : IN STD_LOGIC;
                    signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_waitrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal av_ld_data_aligned_filtered : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_write : OUT STD_LOGIC;
                    signal test_has_ended : OUT STD_LOGIC
                 );
end component jtag_uart_sys_cpu_test_bench;

component jtag_uart_sys_cpu_register_bank_a_module is 
           generic (
                    lpm_file : STRING := "UNUSED"
                    );
           port (
                 -- inputs:
                    signal clock : IN STD_LOGIC;
                    signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component jtag_uart_sys_cpu_register_bank_a_module;

component jtag_uart_sys_cpu_register_bank_b_module is 
           generic (
                    lpm_file : STRING := "UNUSED"
                    );
           port (
                 -- inputs:
                    signal clock : IN STD_LOGIC;
                    signal data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal rdaddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wraddress : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
                    signal wren : IN STD_LOGIC;

                 -- outputs:
                    signal q : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component jtag_uart_sys_cpu_register_bank_b_module;

                signal D_compare_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_ctrl_alu_force_xor :  STD_LOGIC;
                signal D_ctrl_alu_signed_comparison :  STD_LOGIC;
                signal D_ctrl_alu_subtract :  STD_LOGIC;
                signal D_ctrl_b_is_dst :  STD_LOGIC;
                signal D_ctrl_br :  STD_LOGIC;
                signal D_ctrl_br_cmp :  STD_LOGIC;
                signal D_ctrl_br_uncond :  STD_LOGIC;
                signal D_ctrl_break :  STD_LOGIC;
                signal D_ctrl_crst :  STD_LOGIC;
                signal D_ctrl_custom :  STD_LOGIC;
                signal D_ctrl_custom_multi :  STD_LOGIC;
                signal D_ctrl_exception :  STD_LOGIC;
                signal D_ctrl_force_src2_zero :  STD_LOGIC;
                signal D_ctrl_hi_imm16 :  STD_LOGIC;
                signal D_ctrl_ignore_dst :  STD_LOGIC;
                signal D_ctrl_implicit_dst_eretaddr :  STD_LOGIC;
                signal D_ctrl_implicit_dst_retaddr :  STD_LOGIC;
                signal D_ctrl_jmp_direct :  STD_LOGIC;
                signal D_ctrl_jmp_indirect :  STD_LOGIC;
                signal D_ctrl_ld :  STD_LOGIC;
                signal D_ctrl_ld_io :  STD_LOGIC;
                signal D_ctrl_ld_non_io :  STD_LOGIC;
                signal D_ctrl_ld_signed :  STD_LOGIC;
                signal D_ctrl_logic :  STD_LOGIC;
                signal D_ctrl_rdctl_inst :  STD_LOGIC;
                signal D_ctrl_retaddr :  STD_LOGIC;
                signal D_ctrl_rot_right :  STD_LOGIC;
                signal D_ctrl_shift_logical :  STD_LOGIC;
                signal D_ctrl_shift_right_arith :  STD_LOGIC;
                signal D_ctrl_shift_rot :  STD_LOGIC;
                signal D_ctrl_shift_rot_right :  STD_LOGIC;
                signal D_ctrl_src2_choose_imm :  STD_LOGIC;
                signal D_ctrl_st :  STD_LOGIC;
                signal D_ctrl_uncond_cti_non_br :  STD_LOGIC;
                signal D_ctrl_unsigned_lo_imm16 :  STD_LOGIC;
                signal D_ctrl_wrctl_inst :  STD_LOGIC;
                signal D_dst_regnum :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_inst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal D_iw :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal D_iw_a :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_b :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_c :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_control_regnum :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal D_iw_custom_n :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal D_iw_custom_readra :  STD_LOGIC;
                signal D_iw_custom_readrb :  STD_LOGIC;
                signal D_iw_custom_writerc :  STD_LOGIC;
                signal D_iw_imm16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal D_iw_imm26 :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal D_iw_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_memsz :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_iw_op :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal D_iw_opx :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal D_iw_shift_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_iw_trap_break_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal D_jmp_direct_target_waddr :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal D_logic_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_logic_op_raw :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal D_mem16 :  STD_LOGIC;
                signal D_mem32 :  STD_LOGIC;
                signal D_mem8 :  STD_LOGIC;
                signal D_op_add :  STD_LOGIC;
                signal D_op_addi :  STD_LOGIC;
                signal D_op_and :  STD_LOGIC;
                signal D_op_andhi :  STD_LOGIC;
                signal D_op_andi :  STD_LOGIC;
                signal D_op_beq :  STD_LOGIC;
                signal D_op_bge :  STD_LOGIC;
                signal D_op_bgeu :  STD_LOGIC;
                signal D_op_blt :  STD_LOGIC;
                signal D_op_bltu :  STD_LOGIC;
                signal D_op_bne :  STD_LOGIC;
                signal D_op_br :  STD_LOGIC;
                signal D_op_break :  STD_LOGIC;
                signal D_op_bret :  STD_LOGIC;
                signal D_op_call :  STD_LOGIC;
                signal D_op_callr :  STD_LOGIC;
                signal D_op_cmpeq :  STD_LOGIC;
                signal D_op_cmpeqi :  STD_LOGIC;
                signal D_op_cmpge :  STD_LOGIC;
                signal D_op_cmpgei :  STD_LOGIC;
                signal D_op_cmpgeu :  STD_LOGIC;
                signal D_op_cmpgeui :  STD_LOGIC;
                signal D_op_cmplt :  STD_LOGIC;
                signal D_op_cmplti :  STD_LOGIC;
                signal D_op_cmpltu :  STD_LOGIC;
                signal D_op_cmpltui :  STD_LOGIC;
                signal D_op_cmpne :  STD_LOGIC;
                signal D_op_cmpnei :  STD_LOGIC;
                signal D_op_crst :  STD_LOGIC;
                signal D_op_custom :  STD_LOGIC;
                signal D_op_div :  STD_LOGIC;
                signal D_op_divu :  STD_LOGIC;
                signal D_op_eret :  STD_LOGIC;
                signal D_op_flushd :  STD_LOGIC;
                signal D_op_flushda :  STD_LOGIC;
                signal D_op_flushi :  STD_LOGIC;
                signal D_op_flushp :  STD_LOGIC;
                signal D_op_hbreak :  STD_LOGIC;
                signal D_op_initd :  STD_LOGIC;
                signal D_op_initda :  STD_LOGIC;
                signal D_op_initi :  STD_LOGIC;
                signal D_op_intr :  STD_LOGIC;
                signal D_op_jmp :  STD_LOGIC;
                signal D_op_jmpi :  STD_LOGIC;
                signal D_op_ldb :  STD_LOGIC;
                signal D_op_ldbio :  STD_LOGIC;
                signal D_op_ldbu :  STD_LOGIC;
                signal D_op_ldbuio :  STD_LOGIC;
                signal D_op_ldh :  STD_LOGIC;
                signal D_op_ldhio :  STD_LOGIC;
                signal D_op_ldhu :  STD_LOGIC;
                signal D_op_ldhuio :  STD_LOGIC;
                signal D_op_ldl :  STD_LOGIC;
                signal D_op_ldw :  STD_LOGIC;
                signal D_op_ldwio :  STD_LOGIC;
                signal D_op_mul :  STD_LOGIC;
                signal D_op_muli :  STD_LOGIC;
                signal D_op_mulxss :  STD_LOGIC;
                signal D_op_mulxsu :  STD_LOGIC;
                signal D_op_mulxuu :  STD_LOGIC;
                signal D_op_nextpc :  STD_LOGIC;
                signal D_op_nor :  STD_LOGIC;
                signal D_op_opx :  STD_LOGIC;
                signal D_op_or :  STD_LOGIC;
                signal D_op_orhi :  STD_LOGIC;
                signal D_op_ori :  STD_LOGIC;
                signal D_op_rdctl :  STD_LOGIC;
                signal D_op_rdprs :  STD_LOGIC;
                signal D_op_ret :  STD_LOGIC;
                signal D_op_rol :  STD_LOGIC;
                signal D_op_roli :  STD_LOGIC;
                signal D_op_ror :  STD_LOGIC;
                signal D_op_rsv02 :  STD_LOGIC;
                signal D_op_rsv09 :  STD_LOGIC;
                signal D_op_rsv10 :  STD_LOGIC;
                signal D_op_rsv17 :  STD_LOGIC;
                signal D_op_rsv18 :  STD_LOGIC;
                signal D_op_rsv25 :  STD_LOGIC;
                signal D_op_rsv26 :  STD_LOGIC;
                signal D_op_rsv33 :  STD_LOGIC;
                signal D_op_rsv34 :  STD_LOGIC;
                signal D_op_rsv41 :  STD_LOGIC;
                signal D_op_rsv42 :  STD_LOGIC;
                signal D_op_rsv49 :  STD_LOGIC;
                signal D_op_rsv57 :  STD_LOGIC;
                signal D_op_rsv61 :  STD_LOGIC;
                signal D_op_rsv62 :  STD_LOGIC;
                signal D_op_rsv63 :  STD_LOGIC;
                signal D_op_rsvx00 :  STD_LOGIC;
                signal D_op_rsvx10 :  STD_LOGIC;
                signal D_op_rsvx15 :  STD_LOGIC;
                signal D_op_rsvx17 :  STD_LOGIC;
                signal D_op_rsvx21 :  STD_LOGIC;
                signal D_op_rsvx25 :  STD_LOGIC;
                signal D_op_rsvx33 :  STD_LOGIC;
                signal D_op_rsvx34 :  STD_LOGIC;
                signal D_op_rsvx35 :  STD_LOGIC;
                signal D_op_rsvx42 :  STD_LOGIC;
                signal D_op_rsvx43 :  STD_LOGIC;
                signal D_op_rsvx44 :  STD_LOGIC;
                signal D_op_rsvx47 :  STD_LOGIC;
                signal D_op_rsvx50 :  STD_LOGIC;
                signal D_op_rsvx51 :  STD_LOGIC;
                signal D_op_rsvx55 :  STD_LOGIC;
                signal D_op_rsvx56 :  STD_LOGIC;
                signal D_op_rsvx60 :  STD_LOGIC;
                signal D_op_rsvx63 :  STD_LOGIC;
                signal D_op_sll :  STD_LOGIC;
                signal D_op_slli :  STD_LOGIC;
                signal D_op_sra :  STD_LOGIC;
                signal D_op_srai :  STD_LOGIC;
                signal D_op_srl :  STD_LOGIC;
                signal D_op_srli :  STD_LOGIC;
                signal D_op_stb :  STD_LOGIC;
                signal D_op_stbio :  STD_LOGIC;
                signal D_op_stc :  STD_LOGIC;
                signal D_op_sth :  STD_LOGIC;
                signal D_op_sthio :  STD_LOGIC;
                signal D_op_stw :  STD_LOGIC;
                signal D_op_stwio :  STD_LOGIC;
                signal D_op_sub :  STD_LOGIC;
                signal D_op_sync :  STD_LOGIC;
                signal D_op_trap :  STD_LOGIC;
                signal D_op_wrctl :  STD_LOGIC;
                signal D_op_wrprs :  STD_LOGIC;
                signal D_op_xor :  STD_LOGIC;
                signal D_op_xorhi :  STD_LOGIC;
                signal D_op_xori :  STD_LOGIC;
                signal D_valid :  STD_LOGIC;
                signal D_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal D_wr_dst_reg :  STD_LOGIC;
                signal E_alu_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_alu_sub :  STD_LOGIC;
                signal E_arith_result :  STD_LOGIC_VECTOR (32 DOWNTO 0);
                signal E_arith_src1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_arith_src2 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_ci_multi_stall :  STD_LOGIC;
                signal E_ci_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_cmp_result :  STD_LOGIC;
                signal E_control_rd_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_eq :  STD_LOGIC;
                signal E_invert_arith_src_msb :  STD_LOGIC;
                signal E_ld_stall :  STD_LOGIC;
                signal E_logic_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_logic_result_is_0 :  STD_LOGIC;
                signal E_lt :  STD_LOGIC;
                signal E_mem_baddr :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal E_mem_byte_en :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal E_new_inst :  STD_LOGIC;
                signal E_shift_rot_cnt :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal E_shift_rot_cnt_nxt :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal E_shift_rot_done :  STD_LOGIC;
                signal E_shift_rot_fill_bit :  STD_LOGIC;
                signal E_shift_rot_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_shift_rot_result_nxt :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_shift_rot_stall :  STD_LOGIC;
                signal E_src1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_src2 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_st_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal E_st_stall :  STD_LOGIC;
                signal E_stall :  STD_LOGIC;
                signal E_valid :  STD_LOGIC;
                signal E_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal E_wrctl_bstatus :  STD_LOGIC;
                signal E_wrctl_estatus :  STD_LOGIC;
                signal E_wrctl_ienable :  STD_LOGIC;
                signal E_wrctl_status :  STD_LOGIC;
                signal F_av_iw :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal F_av_iw_a :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_b :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_c :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_control_regnum :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal F_av_iw_custom_n :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal F_av_iw_custom_readra :  STD_LOGIC;
                signal F_av_iw_custom_readrb :  STD_LOGIC;
                signal F_av_iw_custom_writerc :  STD_LOGIC;
                signal F_av_iw_imm16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal F_av_iw_imm26 :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal F_av_iw_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_memsz :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal F_av_iw_op :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_av_iw_opx :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_av_iw_shift_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_iw_trap_break_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_av_mem16 :  STD_LOGIC;
                signal F_av_mem32 :  STD_LOGIC;
                signal F_av_mem8 :  STD_LOGIC;
                signal F_inst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal F_iw :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal F_iw_a :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_b :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_c :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_control_regnum :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal F_iw_custom_n :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal F_iw_custom_readra :  STD_LOGIC;
                signal F_iw_custom_readrb :  STD_LOGIC;
                signal F_iw_custom_writerc :  STD_LOGIC;
                signal F_iw_imm16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal F_iw_imm26 :  STD_LOGIC_VECTOR (25 DOWNTO 0);
                signal F_iw_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_memsz :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal F_iw_op :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_iw_opx :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal F_iw_shift_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_iw_trap_break_imm5 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal F_mem16 :  STD_LOGIC;
                signal F_mem32 :  STD_LOGIC;
                signal F_mem8 :  STD_LOGIC;
                signal F_op_add :  STD_LOGIC;
                signal F_op_addi :  STD_LOGIC;
                signal F_op_and :  STD_LOGIC;
                signal F_op_andhi :  STD_LOGIC;
                signal F_op_andi :  STD_LOGIC;
                signal F_op_beq :  STD_LOGIC;
                signal F_op_bge :  STD_LOGIC;
                signal F_op_bgeu :  STD_LOGIC;
                signal F_op_blt :  STD_LOGIC;
                signal F_op_bltu :  STD_LOGIC;
                signal F_op_bne :  STD_LOGIC;
                signal F_op_br :  STD_LOGIC;
                signal F_op_break :  STD_LOGIC;
                signal F_op_bret :  STD_LOGIC;
                signal F_op_call :  STD_LOGIC;
                signal F_op_callr :  STD_LOGIC;
                signal F_op_cmpeq :  STD_LOGIC;
                signal F_op_cmpeqi :  STD_LOGIC;
                signal F_op_cmpge :  STD_LOGIC;
                signal F_op_cmpgei :  STD_LOGIC;
                signal F_op_cmpgeu :  STD_LOGIC;
                signal F_op_cmpgeui :  STD_LOGIC;
                signal F_op_cmplt :  STD_LOGIC;
                signal F_op_cmplti :  STD_LOGIC;
                signal F_op_cmpltu :  STD_LOGIC;
                signal F_op_cmpltui :  STD_LOGIC;
                signal F_op_cmpne :  STD_LOGIC;
                signal F_op_cmpnei :  STD_LOGIC;
                signal F_op_crst :  STD_LOGIC;
                signal F_op_custom :  STD_LOGIC;
                signal F_op_div :  STD_LOGIC;
                signal F_op_divu :  STD_LOGIC;
                signal F_op_eret :  STD_LOGIC;
                signal F_op_flushd :  STD_LOGIC;
                signal F_op_flushda :  STD_LOGIC;
                signal F_op_flushi :  STD_LOGIC;
                signal F_op_flushp :  STD_LOGIC;
                signal F_op_hbreak :  STD_LOGIC;
                signal F_op_initd :  STD_LOGIC;
                signal F_op_initda :  STD_LOGIC;
                signal F_op_initi :  STD_LOGIC;
                signal F_op_intr :  STD_LOGIC;
                signal F_op_jmp :  STD_LOGIC;
                signal F_op_jmpi :  STD_LOGIC;
                signal F_op_ldb :  STD_LOGIC;
                signal F_op_ldbio :  STD_LOGIC;
                signal F_op_ldbu :  STD_LOGIC;
                signal F_op_ldbuio :  STD_LOGIC;
                signal F_op_ldh :  STD_LOGIC;
                signal F_op_ldhio :  STD_LOGIC;
                signal F_op_ldhu :  STD_LOGIC;
                signal F_op_ldhuio :  STD_LOGIC;
                signal F_op_ldl :  STD_LOGIC;
                signal F_op_ldw :  STD_LOGIC;
                signal F_op_ldwio :  STD_LOGIC;
                signal F_op_mul :  STD_LOGIC;
                signal F_op_muli :  STD_LOGIC;
                signal F_op_mulxss :  STD_LOGIC;
                signal F_op_mulxsu :  STD_LOGIC;
                signal F_op_mulxuu :  STD_LOGIC;
                signal F_op_nextpc :  STD_LOGIC;
                signal F_op_nor :  STD_LOGIC;
                signal F_op_opx :  STD_LOGIC;
                signal F_op_or :  STD_LOGIC;
                signal F_op_orhi :  STD_LOGIC;
                signal F_op_ori :  STD_LOGIC;
                signal F_op_rdctl :  STD_LOGIC;
                signal F_op_rdprs :  STD_LOGIC;
                signal F_op_ret :  STD_LOGIC;
                signal F_op_rol :  STD_LOGIC;
                signal F_op_roli :  STD_LOGIC;
                signal F_op_ror :  STD_LOGIC;
                signal F_op_rsv02 :  STD_LOGIC;
                signal F_op_rsv09 :  STD_LOGIC;
                signal F_op_rsv10 :  STD_LOGIC;
                signal F_op_rsv17 :  STD_LOGIC;
                signal F_op_rsv18 :  STD_LOGIC;
                signal F_op_rsv25 :  STD_LOGIC;
                signal F_op_rsv26 :  STD_LOGIC;
                signal F_op_rsv33 :  STD_LOGIC;
                signal F_op_rsv34 :  STD_LOGIC;
                signal F_op_rsv41 :  STD_LOGIC;
                signal F_op_rsv42 :  STD_LOGIC;
                signal F_op_rsv49 :  STD_LOGIC;
                signal F_op_rsv57 :  STD_LOGIC;
                signal F_op_rsv61 :  STD_LOGIC;
                signal F_op_rsv62 :  STD_LOGIC;
                signal F_op_rsv63 :  STD_LOGIC;
                signal F_op_rsvx00 :  STD_LOGIC;
                signal F_op_rsvx10 :  STD_LOGIC;
                signal F_op_rsvx15 :  STD_LOGIC;
                signal F_op_rsvx17 :  STD_LOGIC;
                signal F_op_rsvx21 :  STD_LOGIC;
                signal F_op_rsvx25 :  STD_LOGIC;
                signal F_op_rsvx33 :  STD_LOGIC;
                signal F_op_rsvx34 :  STD_LOGIC;
                signal F_op_rsvx35 :  STD_LOGIC;
                signal F_op_rsvx42 :  STD_LOGIC;
                signal F_op_rsvx43 :  STD_LOGIC;
                signal F_op_rsvx44 :  STD_LOGIC;
                signal F_op_rsvx47 :  STD_LOGIC;
                signal F_op_rsvx50 :  STD_LOGIC;
                signal F_op_rsvx51 :  STD_LOGIC;
                signal F_op_rsvx55 :  STD_LOGIC;
                signal F_op_rsvx56 :  STD_LOGIC;
                signal F_op_rsvx60 :  STD_LOGIC;
                signal F_op_rsvx63 :  STD_LOGIC;
                signal F_op_sll :  STD_LOGIC;
                signal F_op_slli :  STD_LOGIC;
                signal F_op_sra :  STD_LOGIC;
                signal F_op_srai :  STD_LOGIC;
                signal F_op_srl :  STD_LOGIC;
                signal F_op_srli :  STD_LOGIC;
                signal F_op_stb :  STD_LOGIC;
                signal F_op_stbio :  STD_LOGIC;
                signal F_op_stc :  STD_LOGIC;
                signal F_op_sth :  STD_LOGIC;
                signal F_op_sthio :  STD_LOGIC;
                signal F_op_stw :  STD_LOGIC;
                signal F_op_stwio :  STD_LOGIC;
                signal F_op_sub :  STD_LOGIC;
                signal F_op_sync :  STD_LOGIC;
                signal F_op_trap :  STD_LOGIC;
                signal F_op_wrctl :  STD_LOGIC;
                signal F_op_wrprs :  STD_LOGIC;
                signal F_op_xor :  STD_LOGIC;
                signal F_op_xorhi :  STD_LOGIC;
                signal F_op_xori :  STD_LOGIC;
                signal F_pc :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal F_pc_en :  STD_LOGIC;
                signal F_pc_no_crst_nxt :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal F_pc_nxt :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal F_pc_plus_one :  STD_LOGIC_VECTOR (11 DOWNTO 0);
                signal F_pc_sel_nxt :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal F_pcb :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal F_pcb_nxt :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal F_pcb_plus_four :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal F_valid :  STD_LOGIC;
                signal F_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal R_compare_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal R_ctrl_alu_force_xor :  STD_LOGIC;
                signal R_ctrl_alu_force_xor_nxt :  STD_LOGIC;
                signal R_ctrl_alu_signed_comparison :  STD_LOGIC;
                signal R_ctrl_alu_signed_comparison_nxt :  STD_LOGIC;
                signal R_ctrl_alu_subtract :  STD_LOGIC;
                signal R_ctrl_alu_subtract_nxt :  STD_LOGIC;
                signal R_ctrl_b_is_dst :  STD_LOGIC;
                signal R_ctrl_b_is_dst_nxt :  STD_LOGIC;
                signal R_ctrl_br :  STD_LOGIC;
                signal R_ctrl_br_cmp :  STD_LOGIC;
                signal R_ctrl_br_cmp_nxt :  STD_LOGIC;
                signal R_ctrl_br_nxt :  STD_LOGIC;
                signal R_ctrl_br_uncond :  STD_LOGIC;
                signal R_ctrl_br_uncond_nxt :  STD_LOGIC;
                signal R_ctrl_break :  STD_LOGIC;
                signal R_ctrl_break_nxt :  STD_LOGIC;
                signal R_ctrl_crst :  STD_LOGIC;
                signal R_ctrl_crst_nxt :  STD_LOGIC;
                signal R_ctrl_custom :  STD_LOGIC;
                signal R_ctrl_custom_multi :  STD_LOGIC;
                signal R_ctrl_custom_multi_nxt :  STD_LOGIC;
                signal R_ctrl_custom_nxt :  STD_LOGIC;
                signal R_ctrl_exception :  STD_LOGIC;
                signal R_ctrl_exception_nxt :  STD_LOGIC;
                signal R_ctrl_force_src2_zero :  STD_LOGIC;
                signal R_ctrl_force_src2_zero_nxt :  STD_LOGIC;
                signal R_ctrl_hi_imm16 :  STD_LOGIC;
                signal R_ctrl_hi_imm16_nxt :  STD_LOGIC;
                signal R_ctrl_ignore_dst :  STD_LOGIC;
                signal R_ctrl_ignore_dst_nxt :  STD_LOGIC;
                signal R_ctrl_implicit_dst_eretaddr :  STD_LOGIC;
                signal R_ctrl_implicit_dst_eretaddr_nxt :  STD_LOGIC;
                signal R_ctrl_implicit_dst_retaddr :  STD_LOGIC;
                signal R_ctrl_implicit_dst_retaddr_nxt :  STD_LOGIC;
                signal R_ctrl_jmp_direct :  STD_LOGIC;
                signal R_ctrl_jmp_direct_nxt :  STD_LOGIC;
                signal R_ctrl_jmp_indirect :  STD_LOGIC;
                signal R_ctrl_jmp_indirect_nxt :  STD_LOGIC;
                signal R_ctrl_ld :  STD_LOGIC;
                signal R_ctrl_ld_io :  STD_LOGIC;
                signal R_ctrl_ld_io_nxt :  STD_LOGIC;
                signal R_ctrl_ld_non_io :  STD_LOGIC;
                signal R_ctrl_ld_non_io_nxt :  STD_LOGIC;
                signal R_ctrl_ld_nxt :  STD_LOGIC;
                signal R_ctrl_ld_signed :  STD_LOGIC;
                signal R_ctrl_ld_signed_nxt :  STD_LOGIC;
                signal R_ctrl_logic :  STD_LOGIC;
                signal R_ctrl_logic_nxt :  STD_LOGIC;
                signal R_ctrl_rdctl_inst :  STD_LOGIC;
                signal R_ctrl_rdctl_inst_nxt :  STD_LOGIC;
                signal R_ctrl_retaddr :  STD_LOGIC;
                signal R_ctrl_retaddr_nxt :  STD_LOGIC;
                signal R_ctrl_rot_right :  STD_LOGIC;
                signal R_ctrl_rot_right_nxt :  STD_LOGIC;
                signal R_ctrl_shift_logical :  STD_LOGIC;
                signal R_ctrl_shift_logical_nxt :  STD_LOGIC;
                signal R_ctrl_shift_right_arith :  STD_LOGIC;
                signal R_ctrl_shift_right_arith_nxt :  STD_LOGIC;
                signal R_ctrl_shift_rot :  STD_LOGIC;
                signal R_ctrl_shift_rot_nxt :  STD_LOGIC;
                signal R_ctrl_shift_rot_right :  STD_LOGIC;
                signal R_ctrl_shift_rot_right_nxt :  STD_LOGIC;
                signal R_ctrl_src2_choose_imm :  STD_LOGIC;
                signal R_ctrl_src2_choose_imm_nxt :  STD_LOGIC;
                signal R_ctrl_st :  STD_LOGIC;
                signal R_ctrl_st_nxt :  STD_LOGIC;
                signal R_ctrl_uncond_cti_non_br :  STD_LOGIC;
                signal R_ctrl_uncond_cti_non_br_nxt :  STD_LOGIC;
                signal R_ctrl_unsigned_lo_imm16 :  STD_LOGIC;
                signal R_ctrl_unsigned_lo_imm16_nxt :  STD_LOGIC;
                signal R_ctrl_wrctl_inst :  STD_LOGIC;
                signal R_ctrl_wrctl_inst_nxt :  STD_LOGIC;
                signal R_dst_regnum :  STD_LOGIC_VECTOR (4 DOWNTO 0);
                signal R_en :  STD_LOGIC;
                signal R_logic_op :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal R_rf_a :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_rf_b :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_src1 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_src2 :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal R_src2_hi :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal R_src2_lo :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal R_src2_use_imm :  STD_LOGIC;
                signal R_stb_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal R_sth_data :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal R_valid :  STD_LOGIC;
                signal R_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal R_wr_dst_reg :  STD_LOGIC;
                signal W_alu_result :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_br_taken :  STD_LOGIC;
                signal W_bstatus_reg :  STD_LOGIC;
                signal W_bstatus_reg_inst_nxt :  STD_LOGIC;
                signal W_bstatus_reg_nxt :  STD_LOGIC;
                signal W_cmp_result :  STD_LOGIC;
                signal W_control_rd_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_estatus_reg :  STD_LOGIC;
                signal W_estatus_reg_inst_nxt :  STD_LOGIC;
                signal W_estatus_reg_nxt :  STD_LOGIC;
                signal W_ienable_reg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_ienable_reg_nxt :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_ipending_reg :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_ipending_reg_nxt :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_mem_baddr :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal W_rf_wr_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_rf_wren :  STD_LOGIC;
                signal W_status_reg :  STD_LOGIC;
                signal W_status_reg_pie :  STD_LOGIC;
                signal W_status_reg_pie_inst_nxt :  STD_LOGIC;
                signal W_status_reg_pie_nxt :  STD_LOGIC;
                signal W_valid :  STD_LOGIC;
                signal W_vinst :  STD_LOGIC_VECTOR (55 DOWNTO 0);
                signal W_wr_data :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal W_wr_data_non_zero :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal av_fill_bit :  STD_LOGIC;
                signal av_ld_align_cycle :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal av_ld_align_cycle_nxt :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal av_ld_align_one_more_cycle :  STD_LOGIC;
                signal av_ld_aligning_data :  STD_LOGIC;
                signal av_ld_aligning_data_nxt :  STD_LOGIC;
                signal av_ld_byte0_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte0_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte1_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte1_data_en :  STD_LOGIC;
                signal av_ld_byte1_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte2_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte2_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte3_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_byte3_data_nxt :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal av_ld_data_aligned_filtered :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal av_ld_data_aligned_unfiltered :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal av_ld_done :  STD_LOGIC;
                signal av_ld_extend :  STD_LOGIC;
                signal av_ld_getting_data :  STD_LOGIC;
                signal av_ld_rshift8 :  STD_LOGIC;
                signal av_ld_waiting_for_data :  STD_LOGIC;
                signal av_ld_waiting_for_data_nxt :  STD_LOGIC;
                signal av_sign_bit :  STD_LOGIC;
                signal d_read_nxt :  STD_LOGIC;
                signal d_write_nxt :  STD_LOGIC;
                signal hbreak_req :  STD_LOGIC;
                signal i_read_nxt :  STD_LOGIC;
                signal iactive :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal internal_d_address :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal internal_d_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal internal_d_read :  STD_LOGIC;
                signal internal_d_write :  STD_LOGIC;
                signal internal_i_address :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal internal_i_read :  STD_LOGIC;
                signal intr_req :  STD_LOGIC;
                signal oci_ienable :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal test_has_ended :  STD_LOGIC;
attribute ALTERA_IP_DEBUG_VISIBLE : boolean;
attribute ALTERA_IP_DEBUG_VISIBLE of D_iw : signal is true;
attribute ALTERA_IP_DEBUG_VISIBLE of F_pc : signal is true;
attribute ALTERA_IP_DEBUG_VISIBLE of R_dst_regnum : signal is true;
attribute ALTERA_IP_DEBUG_VISIBLE of W_valid : signal is true;
  --synthesis translate_off
constant jtag_uart_sys_cpu_register_bank_a_lpm_file : string := "jtag_uart_sys_cpu_rf_ram_a.hex";
--synthesis translate_on
--synthesis read_comments_as_HDL on
--constant jtag_uart_sys_cpu_register_bank_a_lpm_file : string := "jtag_uart_sys_cpu_rf_ram_a.mif";
--synthesis read_comments_as_HDL off

  --synthesis translate_off
constant jtag_uart_sys_cpu_register_bank_b_lpm_file : string := "jtag_uart_sys_cpu_rf_ram_b.hex";
--synthesis translate_on
--synthesis read_comments_as_HDL on
--constant jtag_uart_sys_cpu_register_bank_b_lpm_file : string := "jtag_uart_sys_cpu_rf_ram_b.mif";
--synthesis read_comments_as_HDL off


begin

  --the_jtag_uart_sys_cpu_test_bench, which is an e_instance
  the_jtag_uart_sys_cpu_test_bench : jtag_uart_sys_cpu_test_bench
    port map(
      av_ld_data_aligned_filtered => av_ld_data_aligned_filtered,
      d_write => internal_d_write,
      test_has_ended => test_has_ended,
      D_iw => D_iw,
      D_iw_op => D_iw_op,
      D_iw_opx => D_iw_opx,
      D_valid => D_valid,
      E_valid => E_valid,
      F_pcb => F_pcb,
      F_valid => F_valid,
      R_ctrl_ld => R_ctrl_ld,
      R_ctrl_ld_non_io => R_ctrl_ld_non_io,
      R_dst_regnum => R_dst_regnum,
      R_wr_dst_reg => R_wr_dst_reg,
      W_valid => W_valid,
      W_vinst => W_vinst,
      W_wr_data => W_wr_data,
      av_ld_data_aligned_unfiltered => av_ld_data_aligned_unfiltered,
      clk => clk,
      d_address => internal_d_address,
      d_byteenable => internal_d_byteenable,
      d_read => internal_d_read,
      d_write_nxt => d_write_nxt,
      i_address => internal_i_address,
      i_read => internal_i_read,
      i_readdata => i_readdata,
      i_waitrequest => i_waitrequest,
      reset_n => reset_n
    );


  F_av_iw_a <= F_av_iw(31 DOWNTO 27);
  F_av_iw_b <= F_av_iw(26 DOWNTO 22);
  F_av_iw_c <= F_av_iw(21 DOWNTO 17);
  F_av_iw_custom_n <= F_av_iw(13 DOWNTO 6);
  F_av_iw_custom_readra <= F_av_iw(16);
  F_av_iw_custom_readrb <= F_av_iw(15);
  F_av_iw_custom_writerc <= F_av_iw(14);
  F_av_iw_opx <= F_av_iw(16 DOWNTO 11);
  F_av_iw_op <= F_av_iw(5 DOWNTO 0);
  F_av_iw_shift_imm5 <= F_av_iw(10 DOWNTO 6);
  F_av_iw_trap_break_imm5 <= F_av_iw(10 DOWNTO 6);
  F_av_iw_imm5 <= F_av_iw(10 DOWNTO 6);
  F_av_iw_imm16 <= F_av_iw(21 DOWNTO 6);
  F_av_iw_imm26 <= F_av_iw(31 DOWNTO 6);
  F_av_iw_memsz <= F_av_iw(4 DOWNTO 3);
  F_av_iw_control_regnum <= F_av_iw(8 DOWNTO 6);
  F_av_mem8 <= to_std_logic((F_av_iw_memsz = std_logic_vector'("00")));
  F_av_mem16 <= to_std_logic((F_av_iw_memsz = std_logic_vector'("01")));
  F_av_mem32 <= to_std_logic((std_logic'(F_av_iw_memsz(1)) = std_logic'(std_logic'('1'))));
  F_iw_a <= F_iw(31 DOWNTO 27);
  F_iw_b <= F_iw(26 DOWNTO 22);
  F_iw_c <= F_iw(21 DOWNTO 17);
  F_iw_custom_n <= F_iw(13 DOWNTO 6);
  F_iw_custom_readra <= F_iw(16);
  F_iw_custom_readrb <= F_iw(15);
  F_iw_custom_writerc <= F_iw(14);
  F_iw_opx <= F_iw(16 DOWNTO 11);
  F_iw_op <= F_iw(5 DOWNTO 0);
  F_iw_shift_imm5 <= F_iw(10 DOWNTO 6);
  F_iw_trap_break_imm5 <= F_iw(10 DOWNTO 6);
  F_iw_imm5 <= F_iw(10 DOWNTO 6);
  F_iw_imm16 <= F_iw(21 DOWNTO 6);
  F_iw_imm26 <= F_iw(31 DOWNTO 6);
  F_iw_memsz <= F_iw(4 DOWNTO 3);
  F_iw_control_regnum <= F_iw(8 DOWNTO 6);
  F_mem8 <= to_std_logic((F_iw_memsz = std_logic_vector'("00")));
  F_mem16 <= to_std_logic((F_iw_memsz = std_logic_vector'("01")));
  F_mem32 <= to_std_logic((std_logic'(F_iw_memsz(1)) = std_logic'(std_logic'('1'))));
  D_iw_a <= D_iw(31 DOWNTO 27);
  D_iw_b <= D_iw(26 DOWNTO 22);
  D_iw_c <= D_iw(21 DOWNTO 17);
  D_iw_custom_n <= D_iw(13 DOWNTO 6);
  D_iw_custom_readra <= D_iw(16);
  D_iw_custom_readrb <= D_iw(15);
  D_iw_custom_writerc <= D_iw(14);
  D_iw_opx <= D_iw(16 DOWNTO 11);
  D_iw_op <= D_iw(5 DOWNTO 0);
  D_iw_shift_imm5 <= D_iw(10 DOWNTO 6);
  D_iw_trap_break_imm5 <= D_iw(10 DOWNTO 6);
  D_iw_imm5 <= D_iw(10 DOWNTO 6);
  D_iw_imm16 <= D_iw(21 DOWNTO 6);
  D_iw_imm26 <= D_iw(31 DOWNTO 6);
  D_iw_memsz <= D_iw(4 DOWNTO 3);
  D_iw_control_regnum <= D_iw(8 DOWNTO 6);
  D_mem8 <= to_std_logic((D_iw_memsz = std_logic_vector'("00")));
  D_mem16 <= to_std_logic((D_iw_memsz = std_logic_vector'("01")));
  D_mem32 <= to_std_logic((std_logic'(D_iw_memsz(1)) = std_logic'(std_logic'('1'))));
  F_op_call <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000000")));
  F_op_jmpi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000001")));
  F_op_ldbu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000011")));
  F_op_addi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000100")));
  F_op_stb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000101")));
  F_op_br <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000110")));
  F_op_ldb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000111")));
  F_op_cmpgei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001000")));
  F_op_ldhu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001011")));
  F_op_andi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001100")));
  F_op_sth <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001101")));
  F_op_bge <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001110")));
  F_op_ldh <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001111")));
  F_op_cmplti <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010000")));
  F_op_initda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010011")));
  F_op_ori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010100")));
  F_op_stw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010101")));
  F_op_blt <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010110")));
  F_op_ldw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010111")));
  F_op_cmpnei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011000")));
  F_op_flushda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011011")));
  F_op_xori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011100")));
  F_op_stc <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011101")));
  F_op_bne <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011110")));
  F_op_ldl <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011111")));
  F_op_cmpeqi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100000")));
  F_op_ldbuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100011")));
  F_op_muli <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100100")));
  F_op_stbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100101")));
  F_op_beq <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100110")));
  F_op_ldbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100111")));
  F_op_cmpgeui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101000")));
  F_op_ldhuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101011")));
  F_op_andhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101100")));
  F_op_sthio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101101")));
  F_op_bgeu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101110")));
  F_op_ldhio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101111")));
  F_op_cmpltui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110000")));
  F_op_initd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110011")));
  F_op_orhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110100")));
  F_op_stwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110101")));
  F_op_bltu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110110")));
  F_op_ldwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110111")));
  F_op_rdprs <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111000")));
  F_op_flushd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111011")));
  F_op_xorhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111100")));
  F_op_rsv02 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000000010")));
  F_op_rsv09 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001001")));
  F_op_rsv10 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000001010")));
  F_op_rsv17 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010001")));
  F_op_rsv18 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000010010")));
  F_op_rsv25 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011001")));
  F_op_rsv26 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000011010")));
  F_op_rsv33 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100001")));
  F_op_rsv34 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000100010")));
  F_op_rsv41 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101001")));
  F_op_rsv42 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000101010")));
  F_op_rsv49 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110001")));
  F_op_rsv57 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111001")));
  F_op_rsv61 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111101")));
  F_op_rsv62 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111110")));
  F_op_rsv63 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111111")));
  F_op_eret <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000001"))));
  F_op_roli <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000010"))));
  F_op_rol <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000011"))));
  F_op_flushp <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000100"))));
  F_op_ret <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000101"))));
  F_op_nor <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000110"))));
  F_op_mulxuu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000111"))));
  F_op_cmpge <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001000"))));
  F_op_bret <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001001"))));
  F_op_ror <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001011"))));
  F_op_flushi <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001100"))));
  F_op_jmp <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001101"))));
  F_op_and <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001110"))));
  F_op_cmplt <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010000"))));
  F_op_slli <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010010"))));
  F_op_sll <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010011"))));
  F_op_wrprs <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010100"))));
  F_op_or <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010110"))));
  F_op_mulxsu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010111"))));
  F_op_cmpne <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011000"))));
  F_op_srli <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011010"))));
  F_op_srl <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011011"))));
  F_op_nextpc <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011100"))));
  F_op_callr <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011101"))));
  F_op_xor <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011110"))));
  F_op_mulxss <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011111"))));
  F_op_cmpeq <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100000"))));
  F_op_divu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100100"))));
  F_op_div <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100101"))));
  F_op_rdctl <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100110"))));
  F_op_mul <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100111"))));
  F_op_cmpgeu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101000"))));
  F_op_initi <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101001"))));
  F_op_trap <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101101"))));
  F_op_wrctl <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101110"))));
  F_op_cmpltu <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110000"))));
  F_op_add <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110001"))));
  F_op_break <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110100"))));
  F_op_hbreak <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110101"))));
  F_op_sync <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110110"))));
  F_op_sub <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111001"))));
  F_op_srai <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111010"))));
  F_op_sra <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111011"))));
  F_op_intr <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111101"))));
  F_op_crst <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111110"))));
  F_op_rsvx00 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000000000"))));
  F_op_rsvx10 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001010"))));
  F_op_rsvx15 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000001111"))));
  F_op_rsvx17 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010001"))));
  F_op_rsvx21 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000010101"))));
  F_op_rsvx25 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000011001"))));
  F_op_rsvx33 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100001"))));
  F_op_rsvx34 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100010"))));
  F_op_rsvx35 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000100011"))));
  F_op_rsvx42 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101010"))));
  F_op_rsvx43 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101011"))));
  F_op_rsvx44 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101100"))));
  F_op_rsvx47 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000101111"))));
  F_op_rsvx50 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110010"))));
  F_op_rsvx51 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110011"))));
  F_op_rsvx55 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000110111"))));
  F_op_rsvx56 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111000"))));
  F_op_rsvx60 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111100"))));
  F_op_rsvx63 <= F_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (F_iw_opx)) = std_logic_vector'("00000000000000000000000000111111"))));
  F_op_opx <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000111010")));
  F_op_custom <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (F_iw_op)) = std_logic_vector'("00000000000000000000000000110010")));
  D_op_call <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000000")));
  D_op_jmpi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000001")));
  D_op_ldbu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000011")));
  D_op_addi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000100")));
  D_op_stb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000101")));
  D_op_br <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000110")));
  D_op_ldb <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000111")));
  D_op_cmpgei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001000")));
  D_op_ldhu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001011")));
  D_op_andi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001100")));
  D_op_sth <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001101")));
  D_op_bge <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001110")));
  D_op_ldh <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001111")));
  D_op_cmplti <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010000")));
  D_op_initda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010011")));
  D_op_ori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010100")));
  D_op_stw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010101")));
  D_op_blt <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010110")));
  D_op_ldw <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010111")));
  D_op_cmpnei <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011000")));
  D_op_flushda <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011011")));
  D_op_xori <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011100")));
  D_op_stc <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011101")));
  D_op_bne <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011110")));
  D_op_ldl <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011111")));
  D_op_cmpeqi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100000")));
  D_op_ldbuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100011")));
  D_op_muli <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100100")));
  D_op_stbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100101")));
  D_op_beq <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100110")));
  D_op_ldbio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100111")));
  D_op_cmpgeui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101000")));
  D_op_ldhuio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101011")));
  D_op_andhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101100")));
  D_op_sthio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101101")));
  D_op_bgeu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101110")));
  D_op_ldhio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101111")));
  D_op_cmpltui <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110000")));
  D_op_initd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110011")));
  D_op_orhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110100")));
  D_op_stwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110101")));
  D_op_bltu <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110110")));
  D_op_ldwio <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110111")));
  D_op_rdprs <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111000")));
  D_op_flushd <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111011")));
  D_op_xorhi <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111100")));
  D_op_rsv02 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000000010")));
  D_op_rsv09 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001001")));
  D_op_rsv10 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000001010")));
  D_op_rsv17 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010001")));
  D_op_rsv18 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000010010")));
  D_op_rsv25 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011001")));
  D_op_rsv26 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000011010")));
  D_op_rsv33 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100001")));
  D_op_rsv34 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000100010")));
  D_op_rsv41 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101001")));
  D_op_rsv42 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000101010")));
  D_op_rsv49 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110001")));
  D_op_rsv57 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111001")));
  D_op_rsv61 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111101")));
  D_op_rsv62 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111110")));
  D_op_rsv63 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111111")));
  D_op_eret <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000001"))));
  D_op_roli <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000010"))));
  D_op_rol <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000011"))));
  D_op_flushp <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000100"))));
  D_op_ret <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000101"))));
  D_op_nor <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000110"))));
  D_op_mulxuu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000111"))));
  D_op_cmpge <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001000"))));
  D_op_bret <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001001"))));
  D_op_ror <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001011"))));
  D_op_flushi <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001100"))));
  D_op_jmp <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001101"))));
  D_op_and <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001110"))));
  D_op_cmplt <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010000"))));
  D_op_slli <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010010"))));
  D_op_sll <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010011"))));
  D_op_wrprs <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010100"))));
  D_op_or <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010110"))));
  D_op_mulxsu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010111"))));
  D_op_cmpne <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011000"))));
  D_op_srli <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011010"))));
  D_op_srl <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011011"))));
  D_op_nextpc <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011100"))));
  D_op_callr <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011101"))));
  D_op_xor <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011110"))));
  D_op_mulxss <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011111"))));
  D_op_cmpeq <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100000"))));
  D_op_divu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100100"))));
  D_op_div <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100101"))));
  D_op_rdctl <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100110"))));
  D_op_mul <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100111"))));
  D_op_cmpgeu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101000"))));
  D_op_initi <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101001"))));
  D_op_trap <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101101"))));
  D_op_wrctl <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101110"))));
  D_op_cmpltu <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110000"))));
  D_op_add <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110001"))));
  D_op_break <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110100"))));
  D_op_hbreak <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110101"))));
  D_op_sync <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110110"))));
  D_op_sub <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111001"))));
  D_op_srai <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111010"))));
  D_op_sra <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111011"))));
  D_op_intr <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111101"))));
  D_op_crst <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111110"))));
  D_op_rsvx00 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000000000"))));
  D_op_rsvx10 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001010"))));
  D_op_rsvx15 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000001111"))));
  D_op_rsvx17 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010001"))));
  D_op_rsvx21 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000010101"))));
  D_op_rsvx25 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000011001"))));
  D_op_rsvx33 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100001"))));
  D_op_rsvx34 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100010"))));
  D_op_rsvx35 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000100011"))));
  D_op_rsvx42 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101010"))));
  D_op_rsvx43 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101011"))));
  D_op_rsvx44 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101100"))));
  D_op_rsvx47 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000101111"))));
  D_op_rsvx50 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110010"))));
  D_op_rsvx51 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110011"))));
  D_op_rsvx55 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000110111"))));
  D_op_rsvx56 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111000"))));
  D_op_rsvx60 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111100"))));
  D_op_rsvx63 <= D_op_opx AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (D_iw_opx)) = std_logic_vector'("00000000000000000000000000111111"))));
  D_op_opx <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000111010")));
  D_op_custom <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (D_iw_op)) = std_logic_vector'("00000000000000000000000000110010")));
  R_en <= std_logic'('1');
  E_ci_result <= std_logic_vector'("00000000000000000000000000000000");
  --custom_instruction_master, which is an e_custom_instruction_master
  no_ci_readra <= std_logic'('0');
  E_ci_multi_stall <= std_logic'('0');
  iactive <= d_irq(31 DOWNTO 0) AND std_logic_vector'("00000000000000000000000000100000");
  F_pc_sel_nxt <= A_WE_StdLogicVector((std_logic'(R_ctrl_exception) = '1'), std_logic_vector'("00"), A_WE_StdLogicVector((std_logic'(R_ctrl_break) = '1'), std_logic_vector'("01"), A_WE_StdLogicVector((std_logic'(((W_br_taken OR R_ctrl_uncond_cti_non_br))) = '1'), std_logic_vector'("10"), std_logic_vector'("11"))));
  F_pc_no_crst_nxt <= A_EXT (A_WE_StdLogicVector(((F_pc_sel_nxt = std_logic_vector'("00"))), std_logic_vector'("00000000000000000000100000001000"), A_WE_StdLogicVector(((F_pc_sel_nxt = std_logic_vector'("01"))), std_logic_vector'("00000000000000000000100000001000"), (std_logic_vector'("00000000000000000000") & (A_WE_StdLogicVector(((F_pc_sel_nxt = std_logic_vector'("10"))), E_arith_result(13 DOWNTO 2), F_pc_plus_one))))), 12);
  F_pc_nxt <= F_pc_no_crst_nxt;
  F_pcb_nxt <= F_pc_nxt & std_logic_vector'("00");
  F_pc_en <= W_valid;
  F_pc_plus_one <= A_EXT (((std_logic_vector'("000000000000000000000") & (F_pc)) + std_logic_vector'("000000000000000000000000000000001")), 12);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      F_pc <= std_logic_vector'("100000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(F_pc_en) = '1' then 
        F_pc <= F_pc_nxt;
      end if;
    end if;

  end process;

  F_pcb <= F_pc & std_logic_vector'("00");
  F_pcb_plus_four <= F_pc_plus_one & std_logic_vector'("00");
  F_valid <= internal_i_read AND NOT i_waitrequest;
  i_read_nxt <= W_valid OR ((internal_i_read AND i_waitrequest));
  internal_i_address <= F_pc & std_logic_vector'("00");
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_i_read <= std_logic'('1');
    elsif clk'event and clk = '1' then
      internal_i_read <= i_read_nxt;
    end if;

  end process;

  hbreak_req <= std_logic'('0');
  intr_req <= W_status_reg_pie AND to_std_logic(((W_ipending_reg /= std_logic_vector'("00000000000000000000000000000000"))));
  F_av_iw <= i_readdata;
  F_iw <= A_WE_StdLogicVector((std_logic'(hbreak_req) = '1'), std_logic_vector'("00000000001111011010100000111010"), A_WE_StdLogicVector((std_logic'(std_logic'('0')) = '1'), std_logic_vector'("00000000000000011111000000111010"), A_WE_StdLogicVector((std_logic'(intr_req) = '1'), std_logic_vector'("00000000001110111110100000111010"), F_av_iw)));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      D_iw <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(F_valid) = '1' then 
        D_iw <= F_iw;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      D_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      D_valid <= F_valid;
    end if;

  end process;

  D_dst_regnum <= A_WE_StdLogicVector((std_logic'(D_ctrl_implicit_dst_retaddr) = '1'), std_logic_vector'("11111"), A_WE_StdLogicVector((std_logic'(D_ctrl_implicit_dst_eretaddr) = '1'), std_logic_vector'("11101"), A_WE_StdLogicVector((std_logic'(D_ctrl_b_is_dst) = '1'), D_iw_b, D_iw_c)));
  D_wr_dst_reg <= to_std_logic((((std_logic_vector'("000000000000000000000000000") & (D_dst_regnum)) /= std_logic_vector'("00000000000000000000000000000000")))) AND NOT D_ctrl_ignore_dst;
  D_logic_op_raw <= A_WE_StdLogicVector((std_logic'(D_op_opx) = '1'), D_iw_opx(4 DOWNTO 3), D_iw_op(4 DOWNTO 3));
  D_logic_op <= A_WE_StdLogicVector((std_logic'(D_ctrl_alu_force_xor) = '1'), std_logic_vector'("11"), D_logic_op_raw);
  D_compare_op <= A_WE_StdLogicVector((std_logic'(D_op_opx) = '1'), D_iw_opx(4 DOWNTO 3), D_iw_op(4 DOWNTO 3));
  D_jmp_direct_target_waddr <= A_EXT (D_iw(31 DOWNTO 6), 12);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      R_valid <= D_valid;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_wr_dst_reg <= std_logic'('0');
    elsif clk'event and clk = '1' then
      R_wr_dst_reg <= D_wr_dst_reg;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_dst_regnum <= std_logic_vector'("00000");
    elsif clk'event and clk = '1' then
      R_dst_regnum <= D_dst_regnum;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_logic_op <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      R_logic_op <= D_logic_op;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_compare_op <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      R_compare_op <= D_compare_op;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_src2_use_imm <= std_logic'('0');
    elsif clk'event and clk = '1' then
      R_src2_use_imm <= D_ctrl_src2_choose_imm OR ((D_ctrl_br AND R_valid));
    end if;

  end process;

  W_rf_wren <= ((R_wr_dst_reg AND W_valid)) OR NOT reset_n;
  W_rf_wr_data <= A_WE_StdLogicVector((std_logic'(R_ctrl_ld) = '1'), av_ld_data_aligned_filtered, W_wr_data);
  --jtag_uart_sys_cpu_register_bank_a, which is an nios_sdp_ram
  jtag_uart_sys_cpu_register_bank_a : jtag_uart_sys_cpu_register_bank_a_module
    generic map(
      lpm_file => jtag_uart_sys_cpu_register_bank_a_lpm_file
    )
    port map(
      q => R_rf_a,
      clock => clk,
      data => W_rf_wr_data,
      rdaddress => D_iw_a,
      wraddress => R_dst_regnum,
      wren => W_rf_wren
    );


  --jtag_uart_sys_cpu_register_bank_b, which is an nios_sdp_ram
  jtag_uart_sys_cpu_register_bank_b : jtag_uart_sys_cpu_register_bank_b_module
    generic map(
      lpm_file => jtag_uart_sys_cpu_register_bank_b_lpm_file
    )
    port map(
      q => R_rf_b,
      clock => clk,
      data => W_rf_wr_data,
      rdaddress => D_iw_b,
      wraddress => R_dst_regnum,
      wren => W_rf_wren
    );


  R_src1 <= A_WE_StdLogicVector((std_logic'(((((R_ctrl_br AND E_valid)) OR ((R_ctrl_retaddr AND R_valid))))) = '1'), (std_logic_vector'("000000000000000000") & ((F_pc_plus_one & std_logic_vector'("00")))), A_WE_StdLogicVector((std_logic'(((R_ctrl_jmp_direct AND E_valid))) = '1'), (std_logic_vector'("000000000000000000") & ((D_jmp_direct_target_waddr & std_logic_vector'("00")))), R_rf_a));
  R_src2_lo <= A_WE_StdLogicVector((std_logic'(((R_ctrl_force_src2_zero OR R_ctrl_hi_imm16))) = '1'), std_logic_vector'("0000000000000000"), A_WE_StdLogicVector((std_logic'((R_src2_use_imm)) = '1'), D_iw_imm16, R_rf_b(15 DOWNTO 0)));
  R_src2_hi <= A_WE_StdLogicVector((std_logic'(((R_ctrl_force_src2_zero OR R_ctrl_unsigned_lo_imm16))) = '1'), std_logic_vector'("0000000000000000"), A_WE_StdLogicVector((std_logic'((R_ctrl_hi_imm16)) = '1'), D_iw_imm16, A_WE_StdLogicVector((std_logic'((R_src2_use_imm)) = '1'), A_REP(D_iw_imm16(15) , 16), R_rf_b(31 DOWNTO 16))));
  R_src2 <= R_src2_hi & R_src2_lo;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_valid <= R_valid OR E_stall;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_new_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_new_inst <= R_valid;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_src1 <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      E_src1 <= R_src1;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_src2 <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      E_src2 <= R_src2;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_invert_arith_src_msb <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_invert_arith_src_msb <= D_ctrl_alu_signed_comparison AND R_valid;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_alu_sub <= std_logic'('0');
    elsif clk'event and clk = '1' then
      E_alu_sub <= D_ctrl_alu_subtract AND R_valid;
    end if;

  end process;

  E_stall <= ((E_shift_rot_stall OR E_ld_stall) OR E_st_stall) OR E_ci_multi_stall;
  E_arith_src1 <= Std_Logic_Vector'(A_ToStdLogicVector((E_src1(31) XOR E_invert_arith_src_msb)) & E_src1(30 DOWNTO 0));
  E_arith_src2 <= Std_Logic_Vector'(A_ToStdLogicVector((E_src2(31) XOR E_invert_arith_src_msb)) & E_src2(30 DOWNTO 0));
  E_arith_result <= A_WE_StdLogicVector((std_logic'(E_alu_sub) = '1'), ((std_logic_vector'("0") & (E_arith_src1)) - (std_logic_vector'("0") & (E_arith_src2))), ((std_logic_vector'("0") & (E_arith_src1)) + (std_logic_vector'("0") & (E_arith_src2))));
  E_mem_baddr <= E_arith_result(13 DOWNTO 0);
  E_logic_result <= A_WE_StdLogicVector(((R_logic_op = std_logic_vector'("00"))), (NOT ((E_src1 OR E_src2))), A_WE_StdLogicVector(((R_logic_op = std_logic_vector'("01"))), ((E_src1 AND E_src2)), A_WE_StdLogicVector(((R_logic_op = std_logic_vector'("10"))), ((E_src1 OR E_src2)), ((E_src1 XOR E_src2)))));
  E_logic_result_is_0 <= to_std_logic((E_logic_result = std_logic_vector'("00000000000000000000000000000000")));
  E_eq <= E_logic_result_is_0;
  E_lt <= E_arith_result(32);
  E_cmp_result <= A_WE_StdLogic(((R_compare_op = std_logic_vector'("00"))), E_eq, A_WE_StdLogic(((R_compare_op = std_logic_vector'("01"))), NOT E_lt, A_WE_StdLogic(((R_compare_op = std_logic_vector'("10"))), E_lt, NOT E_eq)));
  E_shift_rot_cnt_nxt <= A_EXT (A_WE_StdLogicVector((std_logic'(E_new_inst) = '1'), (std_logic_vector'("0000000000000000000000000000") & (E_src2(4 DOWNTO 0))), ((std_logic_vector'("0000000000000000000000000000") & (E_shift_rot_cnt)) - std_logic_vector'("000000000000000000000000000000001"))), 5);
  E_shift_rot_done <= to_std_logic((((std_logic_vector'("000000000000000000000000000") & (E_shift_rot_cnt)) = std_logic_vector'("00000000000000000000000000000000")))) AND NOT E_new_inst;
  E_shift_rot_stall <= (R_ctrl_shift_rot AND E_valid) AND NOT E_shift_rot_done;
  E_shift_rot_fill_bit <= A_WE_StdLogic((std_logic'(R_ctrl_shift_logical) = '1'), std_logic'('0'), (A_WE_StdLogic((std_logic'(R_ctrl_rot_right) = '1'), E_shift_rot_result(0), E_shift_rot_result(31))));
  E_shift_rot_result_nxt <= A_WE_StdLogicVector((std_logic'((E_new_inst)) = '1'), E_src1, A_WE_StdLogicVector((std_logic'((R_ctrl_shift_rot_right)) = '1'), Std_Logic_Vector'(A_ToStdLogicVector(E_shift_rot_fill_bit) & E_shift_rot_result(31 DOWNTO 1)), Std_Logic_Vector'(E_shift_rot_result(30 DOWNTO 0) & A_ToStdLogicVector(E_shift_rot_fill_bit))));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_shift_rot_result <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      E_shift_rot_result <= E_shift_rot_result_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      E_shift_rot_cnt <= std_logic_vector'("00000");
    elsif clk'event and clk = '1' then
      E_shift_rot_cnt <= E_shift_rot_cnt_nxt;
    end if;

  end process;

  E_control_rd_data <= A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("000"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_status_reg))), A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("001"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_estatus_reg))), A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("010"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_bstatus_reg))), A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("011"))), W_ienable_reg, A_WE_StdLogicVector(((D_iw_control_regnum = std_logic_vector'("100"))), W_ipending_reg, std_logic_vector'("00000000000000000000000000000000"))))));
  E_alu_result <= A_EXT (A_WE_StdLogicVector((std_logic'(((R_ctrl_br_cmp OR R_ctrl_rdctl_inst))) = '1'), std_logic_vector'("000000000000000000000000000000000"), A_WE_StdLogicVector((std_logic'((R_ctrl_shift_rot)) = '1'), (std_logic_vector'("0") & (E_shift_rot_result)), A_WE_StdLogicVector((std_logic'((R_ctrl_logic)) = '1'), (std_logic_vector'("0") & (E_logic_result)), A_WE_StdLogicVector((std_logic'((R_ctrl_custom)) = '1'), (std_logic_vector'("0") & (E_ci_result)), E_arith_result)))), 32);
  R_stb_data <= R_rf_b(7 DOWNTO 0);
  R_sth_data <= R_rf_b(15 DOWNTO 0);
  E_st_data <= A_WE_StdLogicVector((std_logic'((D_mem8)) = '1'), (R_stb_data & R_stb_data & R_stb_data & R_stb_data), A_WE_StdLogicVector((std_logic'((D_mem16)) = '1'), (R_sth_data & R_sth_data), R_rf_b));
  E_mem_byte_en <= A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("00")))), std_logic_vector'("0001"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("01")))), std_logic_vector'("0010"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("10")))), std_logic_vector'("0100"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("00") & std_logic_vector'("11")))), std_logic_vector'("1000"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("00")))), std_logic_vector'("0011"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("01")))), std_logic_vector'("0011"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("10")))), std_logic_vector'("1100"), A_WE_StdLogicVector((((D_iw_memsz & E_mem_baddr(1 DOWNTO 0)) = Std_Logic_Vector'(std_logic_vector'("01") & std_logic_vector'("11")))), std_logic_vector'("1100"), std_logic_vector'("1111")))))))));
  d_read_nxt <= ((R_ctrl_ld AND E_new_inst)) OR ((internal_d_read AND d_waitrequest));
  E_ld_stall <= R_ctrl_ld AND ((((E_valid AND NOT av_ld_done)) OR E_new_inst));
  d_write_nxt <= ((R_ctrl_st AND E_new_inst)) OR ((internal_d_write AND d_waitrequest));
  E_st_stall <= d_write_nxt;
  internal_d_address <= W_mem_baddr;
  av_ld_getting_data <= internal_d_read AND NOT d_waitrequest;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_d_read <= std_logic'('0');
    elsif clk'event and clk = '1' then
      internal_d_read <= d_read_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d_writedata <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      d_writedata <= E_st_data;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_d_byteenable <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      internal_d_byteenable <= E_mem_byte_en;
    end if;

  end process;

  av_ld_align_cycle_nxt <= A_EXT (A_WE_StdLogicVector((std_logic'(av_ld_getting_data) = '1'), std_logic_vector'("000000000000000000000000000000000"), (((std_logic_vector'("0000000000000000000000000000000") & (av_ld_align_cycle)) + std_logic_vector'("000000000000000000000000000000001")))), 2);
  av_ld_align_one_more_cycle <= to_std_logic(((std_logic_vector'("000000000000000000000000000000") & (av_ld_align_cycle)) = (A_WE_StdLogicVector((std_logic'(D_mem16) = '1'), std_logic_vector'("00000000000000000000000000000010"), std_logic_vector'("00000000000000000000000000000011")))));
  av_ld_aligning_data_nxt <= A_WE_StdLogic((std_logic'(av_ld_aligning_data) = '1'), NOT av_ld_align_one_more_cycle, ((NOT D_mem32 AND av_ld_getting_data)));
  av_ld_waiting_for_data_nxt <= A_WE_StdLogic((std_logic'(av_ld_waiting_for_data) = '1'), NOT av_ld_getting_data, ((R_ctrl_ld AND E_new_inst)));
  av_ld_done <= NOT av_ld_waiting_for_data_nxt AND ((D_mem32 OR NOT av_ld_aligning_data_nxt));
  av_ld_rshift8 <= av_ld_aligning_data AND to_std_logic(((av_ld_align_cycle<(W_mem_baddr(1 DOWNTO 0)))));
  av_ld_extend <= av_ld_aligning_data;
  av_ld_byte0_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte1_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), av_ld_byte0_data, d_readdata(7 DOWNTO 0)));
  av_ld_byte1_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte2_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), A_REP(av_fill_bit, 8), d_readdata(15 DOWNTO 8)));
  av_ld_byte2_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte3_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), A_REP(av_fill_bit, 8), d_readdata(23 DOWNTO 16)));
  av_ld_byte3_data_nxt <= A_WE_StdLogicVector((std_logic'(av_ld_rshift8) = '1'), av_ld_byte3_data, A_WE_StdLogicVector((std_logic'(av_ld_extend) = '1'), A_REP(av_fill_bit, 8), d_readdata(31 DOWNTO 24)));
  av_ld_byte1_data_en <= NOT (((av_ld_extend AND D_mem16) AND NOT av_ld_rshift8));
  av_ld_data_aligned_unfiltered <= av_ld_byte3_data & av_ld_byte2_data & av_ld_byte1_data & av_ld_byte0_data;
  av_sign_bit <= A_WE_StdLogic((std_logic'(D_mem16) = '1'), av_ld_byte1_data(7), av_ld_byte0_data(7));
  av_fill_bit <= av_sign_bit AND R_ctrl_ld_signed;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_align_cycle <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      av_ld_align_cycle <= av_ld_align_cycle_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_waiting_for_data <= std_logic'('0');
    elsif clk'event and clk = '1' then
      av_ld_waiting_for_data <= av_ld_waiting_for_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_aligning_data <= std_logic'('0');
    elsif clk'event and clk = '1' then
      av_ld_aligning_data <= av_ld_aligning_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte0_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      av_ld_byte0_data <= av_ld_byte0_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte1_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'(av_ld_byte1_data_en) = '1' then 
        av_ld_byte1_data <= av_ld_byte1_data_nxt;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte2_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      av_ld_byte2_data <= av_ld_byte2_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      av_ld_byte3_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      av_ld_byte3_data <= av_ld_byte3_data_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_valid <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_valid <= E_valid AND NOT E_stall;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_control_rd_data <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_control_rd_data <= E_control_rd_data;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_cmp_result <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_cmp_result <= E_cmp_result;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_alu_result <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_alu_result <= E_alu_result;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_status_reg_pie <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_status_reg_pie <= W_status_reg_pie_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_estatus_reg <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_estatus_reg <= W_estatus_reg_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_bstatus_reg <= std_logic'('0');
    elsif clk'event and clk = '1' then
      W_bstatus_reg <= W_bstatus_reg_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_ienable_reg <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_ienable_reg <= W_ienable_reg_nxt;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      W_ipending_reg <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      W_ipending_reg <= W_ipending_reg_nxt;
    end if;

  end process;

  W_wr_data_non_zero <= A_WE_StdLogicVector((std_logic'(R_ctrl_br_cmp) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(W_cmp_result))), A_WE_StdLogicVector((std_logic'(R_ctrl_rdctl_inst) = '1'), W_control_rd_data, W_alu_result(31 DOWNTO 0)));
  W_wr_data <= W_wr_data_non_zero;
  W_br_taken <= R_ctrl_br AND W_cmp_result;
  W_mem_baddr <= W_alu_result(13 DOWNTO 0);
  W_status_reg <= W_status_reg_pie;
  E_wrctl_status <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("000"))));
  E_wrctl_estatus <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("001"))));
  E_wrctl_bstatus <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("010"))));
  E_wrctl_ienable <= R_ctrl_wrctl_inst AND to_std_logic(((D_iw_control_regnum = std_logic_vector'("011"))));
  W_status_reg_pie_inst_nxt <= A_WE_StdLogic((std_logic'((((R_ctrl_exception OR R_ctrl_break) OR R_ctrl_crst))) = '1'), std_logic'('0'), A_WE_StdLogic((std_logic'((D_op_eret)) = '1'), W_estatus_reg, A_WE_StdLogic((std_logic'((D_op_bret)) = '1'), W_bstatus_reg, A_WE_StdLogic((std_logic'((E_wrctl_status)) = '1'), E_src1(0), W_status_reg_pie))));
  W_status_reg_pie_nxt <= A_WE_StdLogic((std_logic'(E_valid) = '1'), W_status_reg_pie_inst_nxt, W_status_reg_pie);
  W_estatus_reg_inst_nxt <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((R_ctrl_crst)) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(A_WE_StdLogic((std_logic'((R_ctrl_exception)) = '1'), W_status_reg, A_WE_StdLogic((std_logic'((E_wrctl_estatus)) = '1'), E_src1(0), W_estatus_reg)))))));
  W_estatus_reg_nxt <= A_WE_StdLogic((std_logic'(E_valid) = '1'), W_estatus_reg_inst_nxt, W_estatus_reg);
  W_bstatus_reg_inst_nxt <= A_WE_StdLogic((std_logic'((R_ctrl_break)) = '1'), W_status_reg, A_WE_StdLogic((std_logic'((E_wrctl_bstatus)) = '1'), E_src1(0), W_bstatus_reg));
  W_bstatus_reg_nxt <= A_WE_StdLogic((std_logic'(E_valid) = '1'), W_bstatus_reg_inst_nxt, W_bstatus_reg);
  W_ienable_reg_nxt <= (A_WE_StdLogicVector((std_logic'(((E_wrctl_ienable AND E_valid))) = '1'), E_src1(31 DOWNTO 0), W_ienable_reg)) AND std_logic_vector'("00000000000000000000000000100000");
  W_ipending_reg_nxt <= ((iactive AND W_ienable_reg) AND oci_ienable) AND std_logic_vector'("00000000000000000000000000100000");
  oci_ienable <= A_REP(std_logic'('1'), 32);
  D_ctrl_custom <= std_logic'('0');
  R_ctrl_custom_nxt <= D_ctrl_custom;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_custom <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_custom <= R_ctrl_custom_nxt;
      end if;
    end if;

  end process;

  D_ctrl_custom_multi <= std_logic'('0');
  R_ctrl_custom_multi_nxt <= D_ctrl_custom_multi;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_custom_multi <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_custom_multi <= R_ctrl_custom_multi_nxt;
      end if;
    end if;

  end process;

  D_ctrl_jmp_indirect <= ((((((D_op_eret OR D_op_bret) OR D_op_rsvx17) OR D_op_rsvx25) OR D_op_ret) OR D_op_jmp) OR D_op_rsvx21) OR D_op_callr;
  R_ctrl_jmp_indirect_nxt <= D_ctrl_jmp_indirect;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_jmp_indirect <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_jmp_indirect <= R_ctrl_jmp_indirect_nxt;
      end if;
    end if;

  end process;

  D_ctrl_jmp_direct <= D_op_call OR D_op_jmpi;
  R_ctrl_jmp_direct_nxt <= D_ctrl_jmp_direct;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_jmp_direct <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_jmp_direct <= R_ctrl_jmp_direct_nxt;
      end if;
    end if;

  end process;

  D_ctrl_implicit_dst_retaddr <= D_op_call OR D_op_rsv02;
  R_ctrl_implicit_dst_retaddr_nxt <= D_ctrl_implicit_dst_retaddr;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_implicit_dst_retaddr <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_implicit_dst_retaddr <= R_ctrl_implicit_dst_retaddr_nxt;
      end if;
    end if;

  end process;

  D_ctrl_implicit_dst_eretaddr <= (((((D_op_div OR D_op_divu) OR D_op_mul) OR D_op_muli) OR D_op_mulxss) OR D_op_mulxsu) OR D_op_mulxuu;
  R_ctrl_implicit_dst_eretaddr_nxt <= D_ctrl_implicit_dst_eretaddr;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_implicit_dst_eretaddr <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_implicit_dst_eretaddr <= R_ctrl_implicit_dst_eretaddr_nxt;
      end if;
    end if;

  end process;

  D_ctrl_exception <= (((((((((D_op_trap OR D_op_rsvx44) OR D_op_div) OR D_op_divu) OR D_op_mul) OR D_op_muli) OR D_op_mulxss) OR D_op_mulxsu) OR D_op_mulxuu) OR D_op_intr) OR D_op_rsvx60;
  R_ctrl_exception_nxt <= D_ctrl_exception;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_exception <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_exception <= R_ctrl_exception_nxt;
      end if;
    end if;

  end process;

  D_ctrl_break <= D_op_break OR D_op_hbreak;
  R_ctrl_break_nxt <= D_ctrl_break;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_break <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_break <= R_ctrl_break_nxt;
      end if;
    end if;

  end process;

  D_ctrl_crst <= D_op_crst OR D_op_rsvx63;
  R_ctrl_crst_nxt <= D_ctrl_crst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_crst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_crst <= R_ctrl_crst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_uncond_cti_non_br <= ((((((((D_op_call OR D_op_jmpi) OR D_op_eret) OR D_op_bret) OR D_op_rsvx17) OR D_op_rsvx25) OR D_op_ret) OR D_op_jmp) OR D_op_rsvx21) OR D_op_callr;
  R_ctrl_uncond_cti_non_br_nxt <= D_ctrl_uncond_cti_non_br;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_uncond_cti_non_br <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_uncond_cti_non_br <= R_ctrl_uncond_cti_non_br_nxt;
      end if;
    end if;

  end process;

  D_ctrl_retaddr <= (((((((((((((((D_op_call OR D_op_rsv02) OR D_op_nextpc) OR D_op_callr) OR D_op_trap) OR D_op_rsvx44) OR D_op_div) OR D_op_divu) OR D_op_mul) OR D_op_muli) OR D_op_mulxss) OR D_op_mulxsu) OR D_op_mulxuu) OR D_op_intr) OR D_op_rsvx60) OR D_op_break) OR D_op_hbreak;
  R_ctrl_retaddr_nxt <= D_ctrl_retaddr;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_retaddr <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_retaddr <= R_ctrl_retaddr_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_logical <= ((D_op_slli OR D_op_sll) OR D_op_srli) OR D_op_srl;
  R_ctrl_shift_logical_nxt <= D_ctrl_shift_logical;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_logical <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_logical <= R_ctrl_shift_logical_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_right_arith <= D_op_srai OR D_op_sra;
  R_ctrl_shift_right_arith_nxt <= D_ctrl_shift_right_arith;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_right_arith <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_right_arith <= R_ctrl_shift_right_arith_nxt;
      end if;
    end if;

  end process;

  D_ctrl_rot_right <= ((D_op_rsvx10 OR D_op_ror) OR D_op_rsvx42) OR D_op_rsvx43;
  R_ctrl_rot_right_nxt <= D_ctrl_rot_right;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_rot_right <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_rot_right <= R_ctrl_rot_right_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_rot_right <= ((((((D_op_srli OR D_op_srl) OR D_op_srai) OR D_op_sra) OR D_op_rsvx10) OR D_op_ror) OR D_op_rsvx42) OR D_op_rsvx43;
  R_ctrl_shift_rot_right_nxt <= D_ctrl_shift_rot_right;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_rot_right <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_rot_right <= R_ctrl_shift_rot_right_nxt;
      end if;
    end if;

  end process;

  D_ctrl_shift_rot <= ((((((((((((((D_op_slli OR D_op_rsvx50) OR D_op_sll) OR D_op_rsvx51) OR D_op_roli) OR D_op_rsvx34) OR D_op_rol) OR D_op_rsvx35) OR D_op_srli) OR D_op_srl) OR D_op_srai) OR D_op_sra) OR D_op_rsvx10) OR D_op_ror) OR D_op_rsvx42) OR D_op_rsvx43;
  R_ctrl_shift_rot_nxt <= D_ctrl_shift_rot;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_shift_rot <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_shift_rot <= R_ctrl_shift_rot_nxt;
      end if;
    end if;

  end process;

  D_ctrl_logic <= ((((((((D_op_and OR D_op_or) OR D_op_xor) OR D_op_nor) OR D_op_andhi) OR D_op_orhi) OR D_op_xorhi) OR D_op_andi) OR D_op_ori) OR D_op_xori;
  R_ctrl_logic_nxt <= D_ctrl_logic;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_logic <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_logic <= R_ctrl_logic_nxt;
      end if;
    end if;

  end process;

  D_ctrl_hi_imm16 <= (D_op_andhi OR D_op_orhi) OR D_op_xorhi;
  R_ctrl_hi_imm16_nxt <= D_ctrl_hi_imm16;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_hi_imm16 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_hi_imm16 <= R_ctrl_hi_imm16_nxt;
      end if;
    end if;

  end process;

  D_ctrl_unsigned_lo_imm16 <= (((((((((((D_op_cmpgeui OR D_op_cmpltui) OR D_op_andi) OR D_op_ori) OR D_op_xori) OR D_op_roli) OR D_op_rsvx10) OR D_op_slli) OR D_op_srli) OR D_op_rsvx34) OR D_op_rsvx42) OR D_op_rsvx50) OR D_op_srai;
  R_ctrl_unsigned_lo_imm16_nxt <= D_ctrl_unsigned_lo_imm16;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_unsigned_lo_imm16 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_unsigned_lo_imm16 <= R_ctrl_unsigned_lo_imm16_nxt;
      end if;
    end if;

  end process;

  D_ctrl_br_uncond <= D_op_br OR D_op_rsv02;
  R_ctrl_br_uncond_nxt <= D_ctrl_br_uncond;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_br_uncond <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_br_uncond <= R_ctrl_br_uncond_nxt;
      end if;
    end if;

  end process;

  D_ctrl_br <= ((((((D_op_br OR D_op_bge) OR D_op_blt) OR D_op_bne) OR D_op_beq) OR D_op_bgeu) OR D_op_bltu) OR D_op_rsv62;
  R_ctrl_br_nxt <= D_ctrl_br;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_br <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_br <= R_ctrl_br_nxt;
      end if;
    end if;

  end process;

  D_ctrl_alu_subtract <= ((((((((((((((D_op_sub OR D_op_rsvx25) OR D_op_cmplti) OR D_op_cmpltui) OR D_op_cmplt) OR D_op_cmpltu) OR D_op_blt) OR D_op_bltu) OR D_op_cmpgei) OR D_op_cmpgeui) OR D_op_cmpge) OR D_op_cmpgeu) OR D_op_bge) OR D_op_rsv10) OR D_op_bgeu) OR D_op_rsv42;
  R_ctrl_alu_subtract_nxt <= D_ctrl_alu_subtract;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_alu_subtract <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_alu_subtract <= R_ctrl_alu_subtract_nxt;
      end if;
    end if;

  end process;

  D_ctrl_alu_signed_comparison <= ((((D_op_cmpge OR D_op_cmpgei) OR D_op_cmplt) OR D_op_cmplti) OR D_op_bge) OR D_op_blt;
  R_ctrl_alu_signed_comparison_nxt <= D_ctrl_alu_signed_comparison;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_alu_signed_comparison <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_alu_signed_comparison <= R_ctrl_alu_signed_comparison_nxt;
      end if;
    end if;

  end process;

  D_ctrl_br_cmp <= ((((((((((((((((((((D_op_br OR D_op_bge) OR D_op_blt) OR D_op_bne) OR D_op_beq) OR D_op_bgeu) OR D_op_bltu) OR D_op_rsv62) OR D_op_cmpgei) OR D_op_cmplti) OR D_op_cmpnei) OR D_op_cmpgeui) OR D_op_cmpltui) OR D_op_cmpeqi) OR D_op_rsvx00) OR D_op_cmpge) OR D_op_cmplt) OR D_op_cmpne) OR D_op_cmpgeu) OR D_op_cmpltu) OR D_op_cmpeq) OR D_op_rsvx56;
  R_ctrl_br_cmp_nxt <= D_ctrl_br_cmp;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_br_cmp <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_br_cmp <= R_ctrl_br_cmp_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld_signed <= ((((((D_op_ldb OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63;
  R_ctrl_ld_signed_nxt <= D_ctrl_ld_signed;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld_signed <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld_signed <= R_ctrl_ld_signed_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld <= ((((((((((D_op_ldb OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63) OR D_op_ldbu) OR D_op_ldhu) OR D_op_ldbuio) OR D_op_ldhuio;
  R_ctrl_ld_nxt <= D_ctrl_ld;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld <= R_ctrl_ld_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld_non_io <= ((((D_op_ldbu OR D_op_ldhu) OR D_op_ldb) OR D_op_ldh) OR D_op_ldw) OR D_op_ldl;
  R_ctrl_ld_non_io_nxt <= D_ctrl_ld_non_io;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld_non_io <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld_non_io <= R_ctrl_ld_non_io_nxt;
      end if;
    end if;

  end process;

  D_ctrl_st <= ((((((D_op_stb OR D_op_sth) OR D_op_stw) OR D_op_stc) OR D_op_stbio) OR D_op_sthio) OR D_op_stwio) OR D_op_rsv61;
  R_ctrl_st_nxt <= D_ctrl_st;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_st <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_st <= R_ctrl_st_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ld_io <= ((((D_op_ldbuio OR D_op_ldhuio) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63;
  R_ctrl_ld_io_nxt <= D_ctrl_ld_io;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ld_io <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ld_io <= R_ctrl_ld_io_nxt;
      end if;
    end if;

  end process;

  D_ctrl_b_is_dst <= (((((((((((((((((((((((((((((((((((((D_op_addi OR D_op_andhi) OR D_op_orhi) OR D_op_xorhi) OR D_op_andi) OR D_op_ori) OR D_op_xori) OR D_op_call) OR D_op_rdprs) OR D_op_cmpgei) OR D_op_cmplti) OR D_op_cmpnei) OR D_op_cmpgeui) OR D_op_cmpltui) OR D_op_cmpeqi) OR D_op_jmpi) OR D_op_rsv09) OR D_op_rsv17) OR D_op_rsv25) OR D_op_rsv33) OR D_op_rsv41) OR D_op_rsv49) OR D_op_rsv57) OR D_op_ldb) OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63) OR D_op_ldbu) OR D_op_ldhu) OR D_op_ldbuio) OR D_op_ldhuio) OR D_op_initd) OR D_op_initda) OR D_op_flushd) OR D_op_flushda;
  R_ctrl_b_is_dst_nxt <= D_ctrl_b_is_dst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_b_is_dst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_b_is_dst <= R_ctrl_b_is_dst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_ignore_dst <= ((((((((((((((((((((((D_op_br OR D_op_bge) OR D_op_blt) OR D_op_bne) OR D_op_beq) OR D_op_bgeu) OR D_op_bltu) OR D_op_rsv62) OR D_op_stb) OR D_op_sth) OR D_op_stw) OR D_op_stc) OR D_op_stbio) OR D_op_sthio) OR D_op_stwio) OR D_op_rsv61) OR D_op_jmpi) OR D_op_rsv09) OR D_op_rsv17) OR D_op_rsv25) OR D_op_rsv33) OR D_op_rsv41) OR D_op_rsv49) OR D_op_rsv57;
  R_ctrl_ignore_dst_nxt <= D_ctrl_ignore_dst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_ignore_dst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_ignore_dst <= R_ctrl_ignore_dst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_src2_choose_imm <= (((((((((((((((((((((((((((((((((((((((((((((((((((((D_op_addi OR D_op_andhi) OR D_op_orhi) OR D_op_xorhi) OR D_op_andi) OR D_op_ori) OR D_op_xori) OR D_op_call) OR D_op_rdprs) OR D_op_cmpgei) OR D_op_cmplti) OR D_op_cmpnei) OR D_op_cmpgeui) OR D_op_cmpltui) OR D_op_cmpeqi) OR D_op_jmpi) OR D_op_rsv09) OR D_op_rsv17) OR D_op_rsv25) OR D_op_rsv33) OR D_op_rsv41) OR D_op_rsv49) OR D_op_rsv57) OR D_op_ldb) OR D_op_ldh) OR D_op_ldl) OR D_op_ldw) OR D_op_ldbio) OR D_op_ldhio) OR D_op_ldwio) OR D_op_rsv63) OR D_op_ldbu) OR D_op_ldhu) OR D_op_ldbuio) OR D_op_ldhuio) OR D_op_initd) OR D_op_initda) OR D_op_flushd) OR D_op_flushda) OR D_op_stb) OR D_op_sth) OR D_op_stw) OR D_op_stc) OR D_op_stbio) OR D_op_sthio) OR D_op_stwio) OR D_op_rsv61) OR D_op_roli) OR D_op_rsvx10) OR D_op_slli) OR D_op_srli) OR D_op_rsvx34) OR D_op_rsvx42) OR D_op_rsvx50) OR D_op_srai;
  R_ctrl_src2_choose_imm_nxt <= D_ctrl_src2_choose_imm;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_src2_choose_imm <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_src2_choose_imm <= R_ctrl_src2_choose_imm_nxt;
      end if;
    end if;

  end process;

  D_ctrl_wrctl_inst <= D_op_wrctl;
  R_ctrl_wrctl_inst_nxt <= D_ctrl_wrctl_inst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_wrctl_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_wrctl_inst <= R_ctrl_wrctl_inst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_rdctl_inst <= D_op_rdctl;
  R_ctrl_rdctl_inst_nxt <= D_ctrl_rdctl_inst;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_rdctl_inst <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_rdctl_inst <= R_ctrl_rdctl_inst_nxt;
      end if;
    end if;

  end process;

  D_ctrl_force_src2_zero <= ((((((((((((((((D_op_call OR D_op_rsv02) OR D_op_nextpc) OR D_op_callr) OR D_op_trap) OR D_op_rsvx44) OR D_op_intr) OR D_op_rsvx60) OR D_op_break) OR D_op_hbreak) OR D_op_eret) OR D_op_bret) OR D_op_rsvx17) OR D_op_rsvx25) OR D_op_ret) OR D_op_jmp) OR D_op_rsvx21) OR D_op_jmpi;
  R_ctrl_force_src2_zero_nxt <= D_ctrl_force_src2_zero;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_force_src2_zero <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_force_src2_zero <= R_ctrl_force_src2_zero_nxt;
      end if;
    end if;

  end process;

  D_ctrl_alu_force_xor <= ((((((((((((((((D_op_cmpgei OR D_op_cmpgeui) OR D_op_cmpeqi) OR D_op_cmpge) OR D_op_cmpgeu) OR D_op_cmpeq) OR D_op_cmpnei) OR D_op_cmpne) OR D_op_bge) OR D_op_rsv10) OR D_op_bgeu) OR D_op_rsv42) OR D_op_beq) OR D_op_rsv34) OR D_op_bne) OR D_op_rsv62) OR D_op_br) OR D_op_rsv02;
  R_ctrl_alu_force_xor_nxt <= D_ctrl_alu_force_xor;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      R_ctrl_alu_force_xor <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(R_en) = '1' then 
        R_ctrl_alu_force_xor <= R_ctrl_alu_force_xor_nxt;
      end if;
    end if;

  end process;

  --data_master, which is an e_avalon_master
  --instruction_master, which is an e_avalon_master
  --vhdl renameroo for output signals
  d_address <= internal_d_address;
  --vhdl renameroo for output signals
  d_byteenable <= internal_d_byteenable;
  --vhdl renameroo for output signals
  d_read <= internal_d_read;
  --vhdl renameroo for output signals
  d_write <= internal_d_write;
  --vhdl renameroo for output signals
  i_address <= internal_i_address;
  --vhdl renameroo for output signals
  i_read <= internal_i_read;
--synthesis translate_off
    F_inst <= A_WE_StdLogicVector((std_logic'((F_op_call)) = '1'), std_logic_vector'("00100000001000000010000001100011011000010110110001101100"), A_WE_StdLogicVector((std_logic'((F_op_jmpi)) = '1'), std_logic_vector'("00100000001000000010000001101010011011010111000001101001"), A_WE_StdLogicVector((std_logic'((F_op_ldbu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110001001110101"), A_WE_StdLogicVector((std_logic'((F_op_addi)) = '1'), std_logic_vector'("00100000001000000010000001100001011001000110010001101001"), A_WE_StdLogicVector((std_logic'((F_op_stb)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001100010"), A_WE_StdLogicVector((std_logic'((F_op_br)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110001001110010"), A_WE_StdLogicVector((std_logic'((F_op_ldb)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001100010"), A_WE_StdLogicVector((std_logic'((F_op_cmpgei)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101101001"), A_WE_StdLogicVector((std_logic'((F_op_ldhu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110100001110101"), A_WE_StdLogicVector((std_logic'((F_op_andi)) = '1'), std_logic_vector'("00100000001000000010000001100001011011100110010001101001"), A_WE_StdLogicVector((std_logic'((F_op_sth)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001101000"), A_WE_StdLogicVector((std_logic'((F_op_bge)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110011101100101"), A_WE_StdLogicVector((std_logic'((F_op_ldh)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001101000"), A_WE_StdLogicVector((std_logic'((F_op_cmplti)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001101001"), A_WE_StdLogicVector((std_logic'((F_op_initda)) = '1'), std_logic_vector'("00100000011010010110111001101001011101000110010001100001"), A_WE_StdLogicVector((std_logic'((F_op_ori)) = '1'), std_logic_vector'("00100000001000000010000000100000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((F_op_stw)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001110111"), A_WE_StdLogicVector((std_logic'((F_op_blt)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110110001110100"), A_WE_StdLogicVector((std_logic'((F_op_ldw)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001110111"), A_WE_StdLogicVector((std_logic'((F_op_cmpnei)) = '1'), std_logic_vector'("00100000011000110110110101110000011011100110010101101001"), A_WE_StdLogicVector((std_logic'((F_op_flushda)) = '1'), std_logic_vector'("01100110011011000111010101110011011010000110010001100001"), A_WE_StdLogicVector((std_logic'((F_op_xori)) = '1'), std_logic_vector'("00100000001000000010000001111000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((F_op_bne)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110111001100101"), A_WE_StdLogicVector((std_logic'((F_op_cmpeqi)) = '1'), std_logic_vector'("00100000011000110110110101110000011001010111000101101001"), A_WE_StdLogicVector((std_logic'((F_op_ldbuio)) = '1'), std_logic_vector'("00100000011011000110010001100010011101010110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_muli)) = '1'), std_logic_vector'("00100000001000000010000001101101011101010110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_stbio)) = '1'), std_logic_vector'("00100000001000000111001101110100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_beq)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110010101110001"), A_WE_StdLogicVector((std_logic'((F_op_ldbio)) = '1'), std_logic_vector'("00100000001000000110110001100100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_cmpgeui)) = '1'), std_logic_vector'("01100011011011010111000001100111011001010111010101101001"), A_WE_StdLogicVector((std_logic'((F_op_ldhuio)) = '1'), std_logic_vector'("00100000011011000110010001101000011101010110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_andhi)) = '1'), std_logic_vector'("00100000001000000110000101101110011001000110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_sthio)) = '1'), std_logic_vector'("00100000001000000111001101110100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_bgeu)) = '1'), std_logic_vector'("00100000001000000010000001100010011001110110010101110101"), A_WE_StdLogicVector((std_logic'((F_op_ldhio)) = '1'), std_logic_vector'("00100000001000000110110001100100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_cmpltui)) = '1'), std_logic_vector'("01100011011011010111000001101100011101000111010101101001"), A_WE_StdLogicVector((std_logic'((F_op_initd)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001100100"), A_WE_StdLogicVector((std_logic'((F_op_orhi)) = '1'), std_logic_vector'("00100000001000000010000001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_stwio)) = '1'), std_logic_vector'("00100000001000000111001101110100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_bltu)) = '1'), std_logic_vector'("00100000001000000010000001100010011011000111010001110101"), A_WE_StdLogicVector((std_logic'((F_op_ldwio)) = '1'), std_logic_vector'("00100000001000000110110001100100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((F_op_flushd)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001100100"), A_WE_StdLogicVector((std_logic'((F_op_xorhi)) = '1'), std_logic_vector'("00100000001000000111100001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_eret)) = '1'), std_logic_vector'("00100000001000000010000001100101011100100110010101110100"), A_WE_StdLogicVector((std_logic'((F_op_roli)) = '1'), std_logic_vector'("00100000001000000010000001110010011011110110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_rol)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101101100"), A_WE_StdLogicVector((std_logic'((F_op_flushp)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001110000"), A_WE_StdLogicVector((std_logic'((F_op_ret)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110010101110100"), A_WE_StdLogicVector((std_logic'((F_op_nor)) = '1'), std_logic_vector'("00100000001000000010000000100000011011100110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_mulxuu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111010101110101"), A_WE_StdLogicVector((std_logic'((F_op_cmpge)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110011101100101"), A_WE_StdLogicVector((std_logic'((F_op_bret)) = '1'), std_logic_vector'("00100000001000000010000001100010011100100110010101110100"), A_WE_StdLogicVector((std_logic'((F_op_ror)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_flushi)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001101001"), A_WE_StdLogicVector((std_logic'((F_op_jmp)) = '1'), std_logic_vector'("00100000001000000010000000100000011010100110110101110000"), A_WE_StdLogicVector((std_logic'((F_op_and)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110111001100100"), A_WE_StdLogicVector((std_logic'((F_op_cmplt)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110110001110100"), A_WE_StdLogicVector((std_logic'((F_op_slli)) = '1'), std_logic_vector'("00100000001000000010000001110011011011000110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_sll)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110110110001101100"), A_WE_StdLogicVector((std_logic'((F_op_or)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_mulxsu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110101"), A_WE_StdLogicVector((std_logic'((F_op_cmpne)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110111001100101"), A_WE_StdLogicVector((std_logic'((F_op_srli)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110110001101001"), A_WE_StdLogicVector((std_logic'((F_op_srl)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001101100"), A_WE_StdLogicVector((std_logic'((F_op_nextpc)) = '1'), std_logic_vector'("00100000011011100110010101111000011101000111000001100011"), A_WE_StdLogicVector((std_logic'((F_op_callr)) = '1'), std_logic_vector'("00100000001000000110001101100001011011000110110001110010"), A_WE_StdLogicVector((std_logic'((F_op_xor)) = '1'), std_logic_vector'("00100000001000000010000000100000011110000110111101110010"), A_WE_StdLogicVector((std_logic'((F_op_mulxss)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110011"), A_WE_StdLogicVector((std_logic'((F_op_cmpeq)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110010101110001"), A_WE_StdLogicVector((std_logic'((F_op_divu)) = '1'), std_logic_vector'("00100000001000000010000001100100011010010111011001110101"), A_WE_StdLogicVector((std_logic'((F_op_div)) = '1'), std_logic_vector'("00100000001000000010000000100000011001000110100101110110"), A_WE_StdLogicVector((std_logic'((F_op_rdctl)) = '1'), std_logic_vector'("00100000001000000111001001100100011000110111010001101100"), A_WE_StdLogicVector((std_logic'((F_op_mul)) = '1'), std_logic_vector'("00100000001000000010000000100000011011010111010101101100"), A_WE_StdLogicVector((std_logic'((F_op_cmpgeu)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101110101"), A_WE_StdLogicVector((std_logic'((F_op_initi)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001101001"), A_WE_StdLogicVector((std_logic'((F_op_trap)) = '1'), std_logic_vector'("00100000001000000010000001110100011100100110000101110000"), A_WE_StdLogicVector((std_logic'((F_op_wrctl)) = '1'), std_logic_vector'("00100000001000000111011101110010011000110111010001101100"), A_WE_StdLogicVector((std_logic'((F_op_cmpltu)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001110101"), A_WE_StdLogicVector((std_logic'((F_op_add)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110010001100100"), A_WE_StdLogicVector((std_logic'((F_op_break)) = '1'), std_logic_vector'("00100000001000000110001001110010011001010110000101101011"), A_WE_StdLogicVector((std_logic'((F_op_sync)) = '1'), std_logic_vector'("00100000001000000010000001110011011110010110111001100011"), A_WE_StdLogicVector((std_logic'((F_op_sub)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010101100010"), A_WE_StdLogicVector((std_logic'((F_op_srai)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110000101101001"), A_WE_StdLogicVector((std_logic'((F_op_sra)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001100001"), A_WE_StdLogicVector((std_logic'((F_op_intr)) = '1'), std_logic_vector'("00100000001000000010000001101001011011100111010001110010"), std_logic_vector'("00100000001000000010000000100000010000100100000101000100"))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    D_inst <= A_WE_StdLogicVector((std_logic'((D_op_call)) = '1'), std_logic_vector'("00100000001000000010000001100011011000010110110001101100"), A_WE_StdLogicVector((std_logic'((D_op_jmpi)) = '1'), std_logic_vector'("00100000001000000010000001101010011011010111000001101001"), A_WE_StdLogicVector((std_logic'((D_op_ldbu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110001001110101"), A_WE_StdLogicVector((std_logic'((D_op_addi)) = '1'), std_logic_vector'("00100000001000000010000001100001011001000110010001101001"), A_WE_StdLogicVector((std_logic'((D_op_stb)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001100010"), A_WE_StdLogicVector((std_logic'((D_op_br)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110001001110010"), A_WE_StdLogicVector((std_logic'((D_op_ldb)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001100010"), A_WE_StdLogicVector((std_logic'((D_op_cmpgei)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101101001"), A_WE_StdLogicVector((std_logic'((D_op_ldhu)) = '1'), std_logic_vector'("00100000001000000010000001101100011001000110100001110101"), A_WE_StdLogicVector((std_logic'((D_op_andi)) = '1'), std_logic_vector'("00100000001000000010000001100001011011100110010001101001"), A_WE_StdLogicVector((std_logic'((D_op_sth)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001101000"), A_WE_StdLogicVector((std_logic'((D_op_bge)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110011101100101"), A_WE_StdLogicVector((std_logic'((D_op_ldh)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001101000"), A_WE_StdLogicVector((std_logic'((D_op_cmplti)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001101001"), A_WE_StdLogicVector((std_logic'((D_op_initda)) = '1'), std_logic_vector'("00100000011010010110111001101001011101000110010001100001"), A_WE_StdLogicVector((std_logic'((D_op_ori)) = '1'), std_logic_vector'("00100000001000000010000000100000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((D_op_stw)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010001110111"), A_WE_StdLogicVector((std_logic'((D_op_blt)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110110001110100"), A_WE_StdLogicVector((std_logic'((D_op_ldw)) = '1'), std_logic_vector'("00100000001000000010000000100000011011000110010001110111"), A_WE_StdLogicVector((std_logic'((D_op_cmpnei)) = '1'), std_logic_vector'("00100000011000110110110101110000011011100110010101101001"), A_WE_StdLogicVector((std_logic'((D_op_flushda)) = '1'), std_logic_vector'("01100110011011000111010101110011011010000110010001100001"), A_WE_StdLogicVector((std_logic'((D_op_xori)) = '1'), std_logic_vector'("00100000001000000010000001111000011011110111001001101001"), A_WE_StdLogicVector((std_logic'((D_op_bne)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110111001100101"), A_WE_StdLogicVector((std_logic'((D_op_cmpeqi)) = '1'), std_logic_vector'("00100000011000110110110101110000011001010111000101101001"), A_WE_StdLogicVector((std_logic'((D_op_ldbuio)) = '1'), std_logic_vector'("00100000011011000110010001100010011101010110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_muli)) = '1'), std_logic_vector'("00100000001000000010000001101101011101010110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_stbio)) = '1'), std_logic_vector'("00100000001000000111001101110100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_beq)) = '1'), std_logic_vector'("00100000001000000010000000100000011000100110010101110001"), A_WE_StdLogicVector((std_logic'((D_op_ldbio)) = '1'), std_logic_vector'("00100000001000000110110001100100011000100110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_cmpgeui)) = '1'), std_logic_vector'("01100011011011010111000001100111011001010111010101101001"), A_WE_StdLogicVector((std_logic'((D_op_ldhuio)) = '1'), std_logic_vector'("00100000011011000110010001101000011101010110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_andhi)) = '1'), std_logic_vector'("00100000001000000110000101101110011001000110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_sthio)) = '1'), std_logic_vector'("00100000001000000111001101110100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_bgeu)) = '1'), std_logic_vector'("00100000001000000010000001100010011001110110010101110101"), A_WE_StdLogicVector((std_logic'((D_op_ldhio)) = '1'), std_logic_vector'("00100000001000000110110001100100011010000110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_cmpltui)) = '1'), std_logic_vector'("01100011011011010111000001101100011101000111010101101001"), A_WE_StdLogicVector((std_logic'((D_op_initd)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001100100"), A_WE_StdLogicVector((std_logic'((D_op_orhi)) = '1'), std_logic_vector'("00100000001000000010000001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_stwio)) = '1'), std_logic_vector'("00100000001000000111001101110100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_bltu)) = '1'), std_logic_vector'("00100000001000000010000001100010011011000111010001110101"), A_WE_StdLogicVector((std_logic'((D_op_ldwio)) = '1'), std_logic_vector'("00100000001000000110110001100100011101110110100101101111"), A_WE_StdLogicVector((std_logic'((D_op_flushd)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001100100"), A_WE_StdLogicVector((std_logic'((D_op_xorhi)) = '1'), std_logic_vector'("00100000001000000111100001101111011100100110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_eret)) = '1'), std_logic_vector'("00100000001000000010000001100101011100100110010101110100"), A_WE_StdLogicVector((std_logic'((D_op_roli)) = '1'), std_logic_vector'("00100000001000000010000001110010011011110110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_rol)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101101100"), A_WE_StdLogicVector((std_logic'((D_op_flushp)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001110000"), A_WE_StdLogicVector((std_logic'((D_op_ret)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110010101110100"), A_WE_StdLogicVector((std_logic'((D_op_nor)) = '1'), std_logic_vector'("00100000001000000010000000100000011011100110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_mulxuu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111010101110101"), A_WE_StdLogicVector((std_logic'((D_op_cmpge)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110011101100101"), A_WE_StdLogicVector((std_logic'((D_op_bret)) = '1'), std_logic_vector'("00100000001000000010000001100010011100100110010101110100"), A_WE_StdLogicVector((std_logic'((D_op_ror)) = '1'), std_logic_vector'("00100000001000000010000000100000011100100110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_flushi)) = '1'), std_logic_vector'("00100000011001100110110001110101011100110110100001101001"), A_WE_StdLogicVector((std_logic'((D_op_jmp)) = '1'), std_logic_vector'("00100000001000000010000000100000011010100110110101110000"), A_WE_StdLogicVector((std_logic'((D_op_and)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110111001100100"), A_WE_StdLogicVector((std_logic'((D_op_cmplt)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110110001110100"), A_WE_StdLogicVector((std_logic'((D_op_slli)) = '1'), std_logic_vector'("00100000001000000010000001110011011011000110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_sll)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110110110001101100"), A_WE_StdLogicVector((std_logic'((D_op_or)) = '1'), std_logic_vector'("00100000001000000010000000100000001000000110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_mulxsu)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110101"), A_WE_StdLogicVector((std_logic'((D_op_cmpne)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110111001100101"), A_WE_StdLogicVector((std_logic'((D_op_srli)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110110001101001"), A_WE_StdLogicVector((std_logic'((D_op_srl)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001101100"), A_WE_StdLogicVector((std_logic'((D_op_nextpc)) = '1'), std_logic_vector'("00100000011011100110010101111000011101000111000001100011"), A_WE_StdLogicVector((std_logic'((D_op_callr)) = '1'), std_logic_vector'("00100000001000000110001101100001011011000110110001110010"), A_WE_StdLogicVector((std_logic'((D_op_xor)) = '1'), std_logic_vector'("00100000001000000010000000100000011110000110111101110010"), A_WE_StdLogicVector((std_logic'((D_op_mulxss)) = '1'), std_logic_vector'("00100000011011010111010101101100011110000111001101110011"), A_WE_StdLogicVector((std_logic'((D_op_cmpeq)) = '1'), std_logic_vector'("00100000001000000110001101101101011100000110010101110001"), A_WE_StdLogicVector((std_logic'((D_op_divu)) = '1'), std_logic_vector'("00100000001000000010000001100100011010010111011001110101"), A_WE_StdLogicVector((std_logic'((D_op_div)) = '1'), std_logic_vector'("00100000001000000010000000100000011001000110100101110110"), A_WE_StdLogicVector((std_logic'((D_op_rdctl)) = '1'), std_logic_vector'("00100000001000000111001001100100011000110111010001101100"), A_WE_StdLogicVector((std_logic'((D_op_mul)) = '1'), std_logic_vector'("00100000001000000010000000100000011011010111010101101100"), A_WE_StdLogicVector((std_logic'((D_op_cmpgeu)) = '1'), std_logic_vector'("00100000011000110110110101110000011001110110010101110101"), A_WE_StdLogicVector((std_logic'((D_op_initi)) = '1'), std_logic_vector'("00100000001000000110100101101110011010010111010001101001"), A_WE_StdLogicVector((std_logic'((D_op_trap)) = '1'), std_logic_vector'("00100000001000000010000001110100011100100110000101110000"), A_WE_StdLogicVector((std_logic'((D_op_wrctl)) = '1'), std_logic_vector'("00100000001000000111011101110010011000110111010001101100"), A_WE_StdLogicVector((std_logic'((D_op_cmpltu)) = '1'), std_logic_vector'("00100000011000110110110101110000011011000111010001110101"), A_WE_StdLogicVector((std_logic'((D_op_add)) = '1'), std_logic_vector'("00100000001000000010000000100000011000010110010001100100"), A_WE_StdLogicVector((std_logic'((D_op_break)) = '1'), std_logic_vector'("00100000001000000110001001110010011001010110000101101011"), A_WE_StdLogicVector((std_logic'((D_op_sync)) = '1'), std_logic_vector'("00100000001000000010000001110011011110010110111001100011"), A_WE_StdLogicVector((std_logic'((D_op_sub)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111010101100010"), A_WE_StdLogicVector((std_logic'((D_op_srai)) = '1'), std_logic_vector'("00100000001000000010000001110011011100100110000101101001"), A_WE_StdLogicVector((std_logic'((D_op_sra)) = '1'), std_logic_vector'("00100000001000000010000000100000011100110111001001100001"), A_WE_StdLogicVector((std_logic'((D_op_intr)) = '1'), std_logic_vector'("00100000001000000010000001101001011011100111010001110010"), std_logic_vector'("00100000001000000010000000100000010000100100000101000100"))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    F_vinst <= A_WE_StdLogicVector((std_logic'(F_valid) = '1'), F_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    D_vinst <= A_WE_StdLogicVector((std_logic'(D_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    R_vinst <= A_WE_StdLogicVector((std_logic'(R_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    E_vinst <= A_WE_StdLogicVector((std_logic'(E_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
    W_vinst <= A_WE_StdLogicVector((std_logic'(W_valid) = '1'), D_inst, A_REP_VECTOR(std_logic_vector'("00101101"), 7));
--synthesis translate_on

end europa;

