# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\workspace\Xilinx\7-4-2_chardisp3\sw\vitis_project\chardisp3_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\workspace\Xilinx\7-4-2_chardisp3\sw\vitis_project\chardisp3_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {chardisp3_platform}\
-hw {C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\7-4-2_chardisp3\fpga\top\vivado_project\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/workspace/Xilinx/7-4-2_chardisp3/sw/vitis_project}

platform write
platform generate -domains 
platform active {chardisp3_platform}
platform generate
