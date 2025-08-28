module memory(clk,rst,wr_rd,valid,ready,addr,rdata,wdata);

parameter WIDTH=16;
parameter DEPTH=16;
parameter ADDR_WIDTH=$clog2(DEPTH);

input clk,rst,valid,wr_rd;
input [ADDR_WIDTH-1:0]addr;
input [WIDTH-1:0]wdata;
output reg ready;
output reg [WIDTH-1:0]rdata;

reg [WIDTH-1:0] mem[DEPTH-1:0];
integer i;
always@(posedge clk)begin
	if(rst==1)begin
			ready=0;
			rdata=0;
			for(i=0;i<DEPTH;i=i+1) mem[i]=0;
	end
	else begin
		if(valid==1)begin
			ready=1;
			if(wr_rd==1)
					mem[addr]=wdata;
			else
				   rdata=mem[addr];	
	    end
		else
			ready=0;
			rdata=0;
    end
end
endmodule
