class mem_cov;
	mem_tx tx;
covergroup mem_cg;
	 WR_RD_CP:coverpoint tx.wr_rd{
		bins WRITE = {1'b1};
		bins READ = {1'b0};
	}
	ADDR_CP : coverpoint tx.addr{
		option.auto_bin_max=8;
	}

	CROSS_CP_WR_RD_ADDR_CPS :cross WR_RD_CP,ADDR_CP; 
endgroup

	//constructor
	function new();
			tx=new();
			mem_cg=new();
	endfunction

	task run();
			$display("Inside the Memory Coverage");
			forever begin
					mon2cov.get(tx);
					mem_c.sample();
			end
	endtask
endclass
