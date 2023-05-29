# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\workspace\Xilinx\7-4-1_chardisp2\sw\vitis_project\char_test2_system\_ide\scripts\debugger_char_test2-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\workspace\Xilinx\7-4-1_chardisp2\sw\vitis_project\char_test2_system\_ide\scripts\debugger_char_test2-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B7BE82A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B7BE82A-23727093-0"}
fpga -file D:/workspace/Xilinx/7-4-1_chardisp2/sw/vitis_project/char_test2/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/workspace/Xilinx/7-4-1_chardisp2/sw/vitis_project/chardisp2_platform/export/chardisp2_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/workspace/Xilinx/7-4-1_chardisp2/sw/vitis_project/char_test2/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/workspace/Xilinx/7-4-1_chardisp2/sw/vitis_project/char_test2/Debug/char_test2.elf
configparams force-mem-access 0
bpadd -addr &main
