class mem_mon;
	mem_tx tx;
 	virtual mem_intf vif;
	//constructor
	function new();
			vif=top.pif;
	endfunction

	task run();
			$display("Inside the Memory Monitor");
			forever begin
				@(posedge vif.clk);
				if(vif.valid && vif.ready)begin
					tx=new();
					tx.wr_rd=vif.wr_rd;
					tx.addr=vif.addr;
					if(tx.wr_rd ==1)tx.wdata=vif.wdata;
					else tx.rdata=vif.rdata;
					tx.print("MON");
					mon2cov.put(tx);
					mon2sbd.put(tx);
				end
			end
	endtask
endclass

