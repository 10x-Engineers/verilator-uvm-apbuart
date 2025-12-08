class apbuart_config_test extends apbuart_base_test;
	`uvm_component_utils (apbuart_config_test)
	
	apbuart_config_seq      apbuart_confg_sq; // all configuration for write and read configuration

	function new (string name, uvm_component parent= null);
	  	super.new(name, parent);
	endfunction

	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void end_of_elaboration_phase(uvm_phase phase);
	extern virtual task run_phase(uvm_phase phase);

endclass

function void apbuart_config_test::build_phase (uvm_phase phase);
	super.build_phase(phase);
	apbuart_confg_sq  = apbuart_config_seq::type_id::create("apbuart_confg_sq",this);
endfunction

function void apbuart_config_test::end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
endfunction 

task apbuart_config_test::run_phase(uvm_phase phase);
	super.run_phase(phase);
	repeat(cfg.loop_time)begin
		set_config_params(9600,8,3,1,1); // Baud Rate , Frame Len , Parity , Stop Bit , Randomize Flag (1 for random , 0 for directed)
		cfg.print();
		set_apbconfig_params(2,1);		 // Slave Bus Address , Randomize Flag (1 for random , 0 for directed)
		apb_cfg.print();
		phase.raise_objection(this);
		apbuart_confg_sq.start(env_sq.v_sqr);
		phase.drop_objection(this);
	end    
endtask
