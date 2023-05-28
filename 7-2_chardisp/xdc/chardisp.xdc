## Zybo Z7 constraints file
## chapter: 7
## project: chardisp

## Clock signal
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { CLK }];
#create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { CLK }];
### clk_fpga_0 and iPCK
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks -of_objects [get_pins design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/syncgen_inst/pckgen_inst/MMCME2_BASE_inst/CLKOUT0]]

##Reset
#set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { RST }];

##RGB LED
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB[2] }]; # Red
#set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB[1] }]; # Green
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB[0] }]; # Blue

##Buttons
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { BTN[0] }];
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { BTN[1] }];
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { BTN[2] }];
#set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { BTN[3] }];

#HDMI TX
set_property -dict {PACKAGE_PIN H17 IOSTANDARD TMDS_33} [get_ports HDMI_CLK_N]
set_property -dict {PACKAGE_PIN H16 IOSTANDARD TMDS_33} [get_ports HDMI_CLK_P]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD TMDS_33} [get_ports {HDMI_N[0]}]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD TMDS_33} [get_ports {HDMI_P[0]}]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD TMDS_33} [get_ports {HDMI_N[1]}]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD TMDS_33} [get_ports {HDMI_P[1]}]
set_property -dict {PACKAGE_PIN A20 IOSTANDARD TMDS_33} [get_ports {HDMI_N[2]}]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD TMDS_33} [get_ports {HDMI_P[2]}]
set_output_delay -clock clk_fpga_0 -max 1.000 [get_ports HDMI_*]
set_output_delay -clock clk_fpga_0 -min 0.000 [get_ports HDMI_*]
set_false_path -from * -to [get_ports HDMI_*]

#Pmod VGA

##Pmod Header JC
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[0] }]; #jc_p[1]
#set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[1] }]; #jc_n[1]
#set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[2] }]; #jc_p[2]
#set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { VGA_R[3] }]; #jc_n[2]
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[0] }]; #jc_p[3]
#set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[1] }]; #jc_n[3]
#set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[2] }]; #jc_p[4]
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { VGA_B[3] }]; #jc_n[4]

##Pmod Header JD
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[0] }]; #jd_p[1]
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[1] }]; #jd_n[1]
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[2] }]; #jd_p[2]
#set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { VGA_G[3] }]; #jd_n[2]
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }];   #jd_p[3]
#set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }];   #jd_n[3]

##Single LED
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
#set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];

##Switches
#set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }];
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }];

##RGB LED2 (Zybo Z7-20 only)
#set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB2[2] }]; # Red
#set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { LED_RGB2[1] }]; # Green
#set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB2[0] }]; # Blue

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/syncgen_inst/pckgen_inst/PCK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/chardisp_ip_0_VGA_G[0]} {design_1_i/chardisp_ip_0_VGA_G[1]} {design_1_i/chardisp_ip_0_VGA_G[2]} {design_1_i/chardisp_ip_0_VGA_G[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/chardisp_ip_0_VGA_B[0]} {design_1_i/chardisp_ip_0_VGA_B[1]} {design_1_i/chardisp_ip_0_VGA_B[2]} {design_1_i/chardisp_ip_0_VGA_B[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/chardisp_ip_0_VGA_R[0]} {design_1_i/chardisp_ip_0_VGA_R[1]} {design_1_i/chardisp_ip_0_VGA_R[2]} {design_1_i/chardisp_ip_0_VGA_R[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[0]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[1]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[2]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[3]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[4]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[5]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[6]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shreg[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 10 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[0]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[1]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[2]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[3]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[4]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[5]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[6]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[7]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[8]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_hcnt[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 10 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[0]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[1]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[2]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[3]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[4]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[5]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[6]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[7]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[8]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/i_vcnt[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 12 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[0]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[1]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[2]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[3]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[4]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[5]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[6]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[7]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[8]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[9]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[10]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramaddr[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 19 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[0]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[1]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[2]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[3]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[4]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[5]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[6]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[8]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[9]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[10]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[11]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[12]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[13]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[14]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[15]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[16]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[17]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[18]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[0]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[1]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[2]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[3]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[4]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[5]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[6]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/cgout[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/chardisp_ip_0_VGA_DE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list design_1_i/chardisp_ip_0_VGA_HS]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/chardisp_ip_0_VGA_VS]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/shregld]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 5 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[7]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[20]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[21]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[22]} {design_1_i/chardisp_ip_0/inst/chardisp_ip_v1_0_S00_AXI_inst/chardisp_inst/vramout[23]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_FCLK_CLK0]
