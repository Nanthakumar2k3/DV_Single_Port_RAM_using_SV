class mem_bfm;
	mem_tx tx;
	virtual mem_intf vif;
	//constructor
	function new();
		vif=top.pif;	
	endfunction

	task run();
			$display("Inside the Memory BFM");
			forever begin
              //tx=new();    //no need to write this
				gen2bfm.get(tx);
				drive_tx(tx);
				tx.print("BFM");

			end
	endtask

	task drive_tx(mem_tx tx);
			$display("Driving the inputs to the interface");
      @(vif.bfm_cb);
        	vif.bfm_cb.wr_rd<=tx.wr_rd;
        	vif.bfm_cb.addr<=tx.addr;
      if(tx.wr_rd==1)
          vif.bfm_cb.wdata<=tx.wdata;
	  else
	  	  vif.bfm_cb.wdata<=0;
          vif.bfm_cb.valid<=1;
        wait(vif.ready==1);
      @(vif.bfm_cb);
      if(tx.wr_rd==0) begin
      	tx.rdata=vif.bfm_cb.rdata;
	    tx.wdata=0;
	  end
	  @(vif.bfm_cb)
		vif.valid=0;

		vif.bfm_cb.wr_rd<=0;
        vif.bfm_cb.addr<=0;
	  	vif.bfm_cb.wdata<=0;
        vif.bfm_cb.valid<=0;
	endtask

endclass


