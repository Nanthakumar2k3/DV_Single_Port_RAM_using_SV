interface mem_intf(input reg clk,rst);
	
	logic wr_rd,valid,ready;
	logic [ADDR_WIDTH-1:0]addr;
	logic [WIDTH-1:0]wdata;
	logic [WIDTH-1:0]rdata;

	clocking bfm_cb@(posedge clk);
		input #0 ready;
		input #0 rdata;

		output #1 wr_rd;
		output #1 wdata;
		output #1 addr;
		output #1 valid;
	endclocking

	
endinterface
