# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\workspace\Xilinx\9-1_graphics_disp\software\vitis_project\display_test_system\_ide\scripts\debugger_display_test-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\workspace\Xilinx\9-1_graphics_disp\software\vitis_project\display_test_system\_ide\scripts\debugger_display_test-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B7BE82A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B7BE82A-23727093-0"}
fpga -file D:/workspace/Xilinx/9-1_graphics_disp/software/vitis_project/display_test/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/workspace/Xilinx/9-1_graphics_disp/software/vitis_project/display_platform/export/display_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/workspace/Xilinx/9-1_graphics_disp/software/vitis_project/display_test/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/workspace/Xilinx/9-1_graphics_disp/software/vitis_project/display_test/Debug/display_test.elf
configparams force-mem-access 0
bpadd -addr &main
