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
  Design files are in design folder, uvm_lib directory contains custom UVM library and UVM testbench components are in uvm_tb folder. Now go to the sim folder where you'll find a Makefile. Now go to the *sim* folder where you'll find a Makefile.
  
  This Makefile has following targets:  
    **1. all_tests:**     to run all the available test cases on the compiled design  
    **2. compile:**       to compile all the design and tb files  
    **3. sim:**           to run any specific test e.g *$ make sim TEST=apbuart_frame_error_test*  
    **4. clean:**         to clean the generated simulation, database and log files   
    **5. run:**           to clean, compile and run any specific test e.g *$ make run TEST=apbuart_frame_error_test*  