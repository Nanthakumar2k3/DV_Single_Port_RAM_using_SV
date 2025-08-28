parameter WIDTH=16;
parameter DEPTH=16;
parameter ADDR_WIDTH=$clog2(DEPTH);
mailbox gen2bfm=new();
mailbox mon2cov=new();
mailbox mon2sbd=new();

class mem_common;
  	static string testname="N_write_N_read";
  //"write"
  //"write_read"
  //"N_write_N_read"
    static int count=2;
endclass		


