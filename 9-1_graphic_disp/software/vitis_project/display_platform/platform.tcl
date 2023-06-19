# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\workspace\Xilinx\9-1_graphics_disp\software\vitis_project\display_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\workspace\Xilinx\9-1_graphics_disp\software\vitis_project\display_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {display_platform}\
-hw {C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\9-1_graphic_disp\fpga\top\vivado_project\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/workspace/Xilinx/9-1_graphics_disp/software/vitis_project}

platform write
platform generate -domains 
platform active {display_platform}
platform generate
platform config -updatehw {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/9-1_graphic_disp/fpga/top/vivado_project/design_1_wrapper.xsa}
platform config -updatehw {C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/9-1_graphic_disp/fpga/top/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {D:/workspace/Xilinx/display/fpga/top/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {D:/workspace/Xilinx/9-1_graphics_disp/fpga/top/vivado_project/design_1_wrapper.xsa}
platform generate -domains 
platform active {display_platform}
bsp reload
bsp setlib -name xilffs -ver 5.0
bsp write
bsp reload
catch {bsp regenerate}
bsp config use_lfn "1"
bsp write
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_domain 
