**INTRODUCTION:**  
  This repo contains the UVM environment for APB based UART. A complete example of an APB UART RTL design verified using a UVM-based testbench running on Verilator 5.040. This repository includes the RTL, Verilator-compliant UVM testbench, custom UVM library, and automation scripts for building, running, and generating waveform outputs. Ideal for engineers looking to learn or implement open-source UVM verification workflows with Verilator.   

**AVAILABLE TEST CASES:**  
  1. apbuart_config_test  
  2. apbuart_data_compare_test  
  3. apbuart_parity_error_test  
  4. apbuart_frame_error_test  
  5. apbuart_free_error_test  
  6. apbuart_rec_reg_test  

**HOW TO USE MAKEFILE:**  
  Design files are in *design* folder, *uvm_lib* directory contains custom UVM library and UVM testbench components are in *uvm_tb* folder. Now go to the *sim* folder where you'll find a Makefile.
  This Makefile has following targets:  
    **1. compile:**      to compile the design files available in the *design* folder  
    **2. run:**          to run all the available test cases on the compiled design  
    **3. test-list:**    to print the tests names  
    **4. run_cov_all:**  to run all the available test cases with coverage report on the compiled design  
    **5. run-test:**     to run any specific test e.g *$ make run-test TEST=apbuart_frame_error_test*  
    **6. clean:**        to clean the generated simulation and log files  
