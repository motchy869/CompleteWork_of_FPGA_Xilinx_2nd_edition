# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\workspace\Xilinx\6-3-1_blink_ip_mb\blink_ip_mb_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\workspace\Xilinx\6-3-1_blink_ip_mb\blink_ip_mb_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {blink_ip_mb_platform}\
-hw {C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\6-3-1_blink_ip_mb\fpga\top\vivado_project\design_1_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {D:/workspace/Xilinx/6-3-1_blink_ip_mb}

platform write
platform generate -domains 
platform active {blink_ip_mb_platform}
platform generate
