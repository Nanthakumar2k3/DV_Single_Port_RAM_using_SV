class mem_sbd;
	mem_tx tx;	
	//constructor
	function new();
			tx=new();
	endfunction

	task run();
		$display("Inside the Memory Scoreboard");
	endtask
endclass
