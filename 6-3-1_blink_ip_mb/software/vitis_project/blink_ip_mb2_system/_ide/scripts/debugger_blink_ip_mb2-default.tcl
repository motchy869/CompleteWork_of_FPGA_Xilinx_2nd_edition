# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\workspace\Xilinx\6-3-1_blink_ip_mb\blink_ip_mb2_system\_ide\scripts\debugger_blink_ip_mb2-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\workspace\Xilinx\6-3-1_blink_ip_mb\blink_ip_mb2_system\_ide\scripts\debugger_blink_ip_mb2-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B7BE82A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B7BE82A-23727093-0"}
fpga -file D:/workspace/Xilinx/6-3-1_blink_ip_mb/blink_ip_mb2/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/workspace/Xilinx/6-3-1_blink_ip_mb/blink_ip_mb_platform/export/blink_ip_mb_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/workspace/Xilinx/6-3-1_blink_ip_mb/blink_ip_mb2/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/workspace/Xilinx/6-3-1_blink_ip_mb/blink_ip_mb2/Debug/blink_ip_mb2.elf
configparams force-mem-access 0
bpadd -addr &main
