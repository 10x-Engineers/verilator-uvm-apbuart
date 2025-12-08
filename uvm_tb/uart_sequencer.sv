`ifndef VERILATOR
class uart_sequencer extends uvm_sequencer#(uart_transaction); 
`else
class uart_sequencer extends uvm_sequencer#(uart_transaction, uart_transaction); // work around to resolve verilator error
`endif 
	`uvm_component_utils(uart_sequencer) 
  	//---------------------------------------
  	//constructor
  	//---------------------------------------
  	function new(string name, uvm_component parent);
    	super.new(name,parent);
  	endfunction

endclass