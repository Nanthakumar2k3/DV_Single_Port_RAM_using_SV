class mem_agent;
	mem_gen gen;
	mem_bfm bfm;
	mem_mon mon;
	mem_cov cov;

	//constructor
	function new();
		gen=new();
		bfm=new();
		mon=new();
		cov=new();

	endfunction


	task run();
		$display("Inside the Memory Agent");
		fork
			gen.run();
			bfm.run();
			mon.run();
			cov.run();
		join
	endtask
endclass
