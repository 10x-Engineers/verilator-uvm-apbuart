TEST="apbuart_config_test"
VERBOS=UVM_MEDIUM
VERIF_DIR := $(realpath ../../apb_uart_verif)
RTL 		:= 	$(VERIF_DIR)/design
TB			:=  $(VERIF_DIR)/uvm_tb
UVM_LIB	:=  $(VERIF_DIR)/uvm_lib/uvm-1.2-current-patches/src

#------------------------
ARG_VERILATOR				+=	--exe
ARG_VERILATOR				+=	--binary 
ARG_VERILATOR				+=	--build
ARG_VERILATOR				+=	--cc
ARG_VERILATOR				+=	 -sv
ARG_VERILATOR				+=	--timescale 1ns/100ps
ARG_VERILATOR				+=	--j 1
ARG_VERILATOR				+=	--timing
ARG_VERILATOR				+=	--trace
ARG_VERILATOR				+=	--assert
ARG_VERILATOR				+=	--coverage
ARG_VERILATOR				+=	--hierarchical

DISABLED_WARNINGS		+=	-Wno-SIDEEFFECT
DISABLED_WARNINGS		+=	-Wno-fatal
DISABLED_WARNINGS		+=	-Wno-lint
DISABLED_WARNINGS		+=	-Wno-style
DISABLED_WARNINGS		+=	+define+UVM_NO_DPI  

TEST_LIST = apbuart_config_test
include $(VERIF_DIR)/sim/test_list.mk

all_tests: $(TEST_LIST)
UVM_TEST_NAME = $@

compile:
	@ echo "-----------------------------"
	@ echo "      ---COMPILATION---"
	@ echo "-----------------------------"
	verilator $(ARG_VERILATOR) --top-module testbench_top --Mdir apb_uart_obj_dir -o apb_uart_simv $(DISABLED_WARNINGS) \
	-I$(RTL) -I$(TB) -I$(UVM_LIB) $(UVM_LIB)/uvm_pkg.sv $(UVM_LIB)/uvm.sv $(RTL)/apb_uart_top.sv $(TB)/testbench.sv  

sim:	
	@ echo "-----------------------------"
	@ echo "       ---SIMULATION---"
	@ echo "-----------------------------"
	./apb_uart_obj_dir/apb_uart_simv +UVM_TESTNAME=$(TEST) +UVM_VERBOSITY=$(VERBOS)

$(TEST_LIST):
	@ echo "-----------------------------"
	@ echo "       ---SIMULATION---"
	@ echo "-----------------------------"
	./apb_uart_obj_dir/apb_uart_simv +UVM_TESTNAME=$(UVM_TEST_NAME) +UVM_VERBOSITY=$(VERBOS)

clean:
	@ echo "-----------------------------"
	@ echo "       ---CLEANING---"
	@ echo "-----------------------------"
	rm -rf apb_uart_obj_dir/ *.vcd coverage.dat *.log

run:
	make clean compile sim

