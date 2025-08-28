module top;

	reg clk_i,rst_i;	
	mem_env env; //environment instantiation

		//Interface instantiation
		mem_intf pif(.clk(clk_i),.rst(rst_i)); // at instantion the memory will be allocated	

		//DUT instantiation
		memory dut(.clk(pif.clk),.rst(pif.rst),.wr_rd(pif.wr_rd),.valid(pif.valid),.ready(pif.ready),.addr(pif.addr),.rdata(pif.rdata),.wdata(pif.wdata));

	always #5 clk_i=~clk_i;
	
	initial begin
$display("Inside the memory Top");	
		clk_i=0;
		rst_i=1;
		repeat(2)@(posedge clk_i);
		rst_i=0;

        // create memory for the handle
		env=new();
		env.run();
	end
	
	initial begin
	    $dumpfile("memory.vcd");
        $dumpvars;
		#2000 $finish;
	end
endmodule
