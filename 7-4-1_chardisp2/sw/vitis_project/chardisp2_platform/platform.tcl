# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\workspace\Xilinx\7-4-1_chardisp2\sw\vitis_project\chardisp2_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\workspace\Xilinx\7-4-1_chardisp2\sw\vitis_project\chardisp2_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {chardisp2_platform}\
-hw {C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\7-4-1_chardisp2\hw\vivado_project\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/workspace/Xilinx/7-4-1_chardisp2/sw/vitis_project}

platform write
platform generate -domains 
platform active {chardisp2_platform}
platform generate
platform active {chardisp2_platform}
platform config -updatehw {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-4-1_chardisp2/hw/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-4-1_chardisp2/hw/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-4-1_chardisp2/hw/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-4-1_chardisp2/hw/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
