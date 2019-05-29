bram_wr_inst : bram_wr PORT MAP (
		aclr	 => aclr_sig,
		address	 => address_sig,
		clken	 => clken_sig,
		clock	 => clock_sig,
		data	 => data_sig,
		wren	 => wren_sig,
		q	 => q_sig
	);
