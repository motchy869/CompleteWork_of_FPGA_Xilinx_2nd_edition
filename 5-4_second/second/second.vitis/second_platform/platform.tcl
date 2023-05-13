# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\5-4_second\second\second.vitis\second_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\5-4_second\second\second.vitis\second_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {second_platform}\
-hw {C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\5-4_second\second\second.vitis\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/5-4_second/second/second.vitis}

platform write
platform generate -domains 
platform active {second_platform}
platform generate
platform active {second_platform}
platform generate -domains 
platform clean
platform generate
platform generate -domains standalone_domain,zynq_fsbl 
