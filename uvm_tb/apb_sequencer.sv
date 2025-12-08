`ifndef VERILATOR
	class apb_sequencer extends uvm_sequencer#(apb_transaction);
`else
	class apb_sequencer extends uvm_sequencer#(apb_transaction, apb_transaction); //work around to resolve verilator error
`endif 

	`uvm_component_utils(apb_sequencer) 
  // ---------------------------------------
  // constructor
  // ---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

endclass