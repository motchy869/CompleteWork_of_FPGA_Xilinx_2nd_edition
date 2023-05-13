# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\5-4_second\second\second.vitis\blinkspeed_updown_system\_ide\scripts\debugger_blinkspeed_updown-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\motchy\Documents\GitHub\CompleteWork_of_FPGA_Xilinx_2nd_edition\5-4_second\second\second.vitis\blinkspeed_updown_system\_ide\scripts\debugger_blinkspeed_updown-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B7BE82A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B7BE82A-23727093-0"}
fpga -file C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/5-4_second/second/second.vitis/blinkspeed_updown/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/5-4_second/second/second.vitis/second_platform/export/second_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/5-4_second/second/second.vitis/blinkspeed_updown/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/5-4_second/second/second.vitis/blinkspeed_updown/Debug/blinkspeed_updown.elf
configparams force-mem-access 0
bpadd -addr &main
