class mem_gen;
  bit[ADDR_WIDTH-1:0]addr_t[$];
	mem_tx tx;
	//constructor
	function new();

	endfunction

	task run();
			$display("Inside the Memory Generator");
        	//write
      case(mem_common::testname)
        "write":begin
    	      tx=new();
			  tx.randomize with {tx.wr_rd==1;};
			  gen2bfm.put(tx);
              //addr_t.push_back(tx.addr);
			  tx.print("GEN");
        end
        
        "write_read":begin
          tx=new();
				tx.randomize with {tx.wr_rd==1;};
				gen2bfm.put(tx);
                addr_t.push_back(tx.addr);
			    tx.print("GEN");
                tx=new();
              tx.randomize with {tx.wr_rd==0;tx.wdata==0;tx.addr==addr_t. pop_front();};
				gen2bfm.put(tx);
              
			   tx.print("GEN");
        end
        
        "N_write_N_read":begin
   			
          repeat(mem_common::count) begin
						tx=new();
						tx.randomize with {tx.wr_rd==1;};
						gen2bfm.put(tx);
             		 	addr_t.push_back(tx.addr);
						tx.print("GEN");
            end
			//read
          repeat(mem_common::count) begin
						 tx=new();
             			 tx.randomize with {tx.wr_rd==0;tx.wdata==0;tx.addr==addr_t. pop_front();};
						gen2bfm.put(tx);
              
						tx.print("GEN");
            end
        end

      endcase
	endtask
endclass

