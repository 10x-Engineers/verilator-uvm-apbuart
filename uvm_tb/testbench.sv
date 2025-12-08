import uvm_pkg::*;
`include "flist.sv"

module testbench_top;

	logic		clock;
  logic		reset_n;
  
	apb_if            vifapb  (clock, reset_n);
  uart_if           vifuart (clock, reset_n);

  apb_uart_top  DUT (
											.PCLK(clock),
                 	  	.PRESETn(reset_n),
	             	  		.PSELx(vifapb.PSELx),
	             	  		.PENABLE(vifapb.PENABLE),
	             	  		.PWRITE(vifapb.PWRITE),
	             	  		.Tx(vifuart.Tx),
	             	  		.RX(vifuart.RX),
	             	  		.PREADY(vifapb.PREADY),
	             	  		.PSLVERR(vifapb.PSLVERR),
	             	  		.PWDATA(vifapb.PWDATA),
	             	  		.PADDR(vifapb.PADDR),
	             	  		.PRDATA(vifapb.PRDATA)
                    );
	
  apbuart_property assertions (
																.PCLK(clock),
                 	        			.PRESETn(reset_n),
	             	            		.PSELx(vifapb.PSELx),
	             	            		.PENABLE(vifapb.PENABLE),
	             	            		.PWRITE(vifapb.PWRITE),
	             	            		.PREADY(vifapb.PREADY),
	             	            		.PSLVERR(vifapb.PSLVERR),
	             	            		.PWDATA(vifapb.PWDATA),
	             	            		.PADDR(vifapb.PADDR),
	             	            		.PRDATA(vifapb.PRDATA)            
                            	);
  
	  initial clock=0;
    
		always #10 clock=~clock;

    initial begin
      reset_n = 0;
    	repeat(10) @(posedge clock);
      reset_n = 1;
    end

  initial begin 
    uvm_config_db # (virtual apb_if)::set(uvm_root::get(),"*","vifapb",vifapb);
    uvm_config_db # (virtual uart_if)::set(uvm_root::get(),"*","vifuart",vifuart);
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end

  initial
    run_test("apbuart_config_test");
endmodule