class mem_env;

	mem_sbd sbd;
	mem_agent agent;

	//constructor
	function new();
		sbd=new();
		agent=new();
	endfunction

	task run();
		$display("Inside the Memory Environment");
		fork
			agent.run();
			sbd.run();
		join
	endtask

endclass
