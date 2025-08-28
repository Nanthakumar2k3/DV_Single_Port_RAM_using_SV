class mem_tx;
	
	rand bit wr_rd;
	rand bit[ADDR_WIDTH-1:0]addr;
	rand bit [WIDTH-1:0]wdata;
		 bit [WIDTH-1:0]rdata;

		 function void print(string name="MY_TX");
		 		$display("##################################");
				$display("Component Name=%0s",name);
				$display("Transaction Type=%0s",(wr_rd==1)?"WRITE_TX":"READ_TX");
				$display("Addr=%0d",addr);
				$display("wdata=%0d",wdata);
				$display("rdata=%0d",rdata);
				$display("##################################");

		 endfunction
endclass
