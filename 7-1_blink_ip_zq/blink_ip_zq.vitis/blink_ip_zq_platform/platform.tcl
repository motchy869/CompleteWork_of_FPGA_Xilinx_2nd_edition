# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\workspace\Xilinx\7-1_blink_ip_zq\blink_ip_zq.vitis\blink_ip_zq_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\workspace\Xilinx\7-1_blink_ip_zq\blink_ip_zq.vitis\blink_ip_zq_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {blink_ip_zq_platform}\
-hw {D:\workspace\Xilinx\7-1_blink_ip_zq\blink_ip_zq.vitis\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/workspace/Xilinx/7-1_blink_ip_zq/blink_ip_zq.vitis}

platform write
platform generate -domains 
platform active {blink_ip_zq_platform}
platform clean
platform generate
