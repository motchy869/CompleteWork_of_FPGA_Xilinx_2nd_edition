## Zybo Z7 constraints file
## chapter: 9
## project: display

##Clock signal
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { CLK }];
#create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { CLK }];

##Reset
#set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { RST }]; # BTN[3]

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

##Pmod VGA

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

#Single LED
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {LED[0]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {LED[1]}]
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];
set_output_delay -clock sys_clk_pin -max 1.0 [get_ports { LED }]; # dummy delay
set_output_delay -clock sys_clk_pin -min 0.0 [get_ports { LED }]; # dummy delay
set_false_path -from * -to [get_ports LED]

##Switches
#set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }];
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }];

##RGB LED2 (Zybo Z7-20 only)
#set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB2[2] }]; # Red
#set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { LED_RGB2[1] }]; # Green
#set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { LED_RGB2[0] }]; # Blue

# false path
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks iPCK]

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
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/display_0/inst/disp_ctrl_inst/state_current[0]} {design_1_i/display_0/inst/disp_ctrl_inst/state_current[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/display_0/inst/disp_ctrl_inst/state_next[0]} {design_1_i/display_0/inst/disp_ctrl_inst/state_next[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 10 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/display_0/inst/syncgen_inst/VCNT[0]} {design_1_i/display_0/inst/syncgen_inst/VCNT[1]} {design_1_i/display_0/inst/syncgen_inst/VCNT[2]} {design_1_i/display_0/inst/syncgen_inst/VCNT[3]} {design_1_i/display_0/inst/syncgen_inst/VCNT[4]} {design_1_i/display_0/inst/syncgen_inst/VCNT[5]} {design_1_i/display_0/inst/syncgen_inst/VCNT[6]} {design_1_i/display_0/inst/syncgen_inst/VCNT[7]} {design_1_i/display_0/inst/syncgen_inst/VCNT[8]} {design_1_i/display_0/inst/syncgen_inst/VCNT[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 10 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/display_0/inst/syncgen_inst/HCNT[0]} {design_1_i/display_0/inst/syncgen_inst/HCNT[1]} {design_1_i/display_0/inst/syncgen_inst/HCNT[2]} {design_1_i/display_0/inst/syncgen_inst/HCNT[3]} {design_1_i/display_0/inst/syncgen_inst/HCNT[4]} {design_1_i/display_0/inst/syncgen_inst/HCNT[5]} {design_1_i/display_0/inst/syncgen_inst/HCNT[6]} {design_1_i/display_0/inst/syncgen_inst/HCNT[7]} {design_1_i/display_0/inst/syncgen_inst/HCNT[8]} {design_1_i/display_0/inst/syncgen_inst/HCNT[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/display_0/inst/fifo_cnt[7]} {design_1_i/display_0/inst/fifo_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {design_1_i/display_0_M_AXI_ARADDR[0]} {design_1_i/display_0_M_AXI_ARADDR[1]} {design_1_i/display_0_M_AXI_ARADDR[2]} {design_1_i/display_0_M_AXI_ARADDR[3]} {design_1_i/display_0_M_AXI_ARADDR[4]} {design_1_i/display_0_M_AXI_ARADDR[5]} {design_1_i/display_0_M_AXI_ARADDR[6]} {design_1_i/display_0_M_AXI_ARADDR[7]} {design_1_i/display_0_M_AXI_ARADDR[8]} {design_1_i/display_0_M_AXI_ARADDR[9]} {design_1_i/display_0_M_AXI_ARADDR[10]} {design_1_i/display_0_M_AXI_ARADDR[11]} {design_1_i/display_0_M_AXI_ARADDR[12]} {design_1_i/display_0_M_AXI_ARADDR[13]} {design_1_i/display_0_M_AXI_ARADDR[14]} {design_1_i/display_0_M_AXI_ARADDR[15]} {design_1_i/display_0_M_AXI_ARADDR[16]} {design_1_i/display_0_M_AXI_ARADDR[17]} {design_1_i/display_0_M_AXI_ARADDR[18]} {design_1_i/display_0_M_AXI_ARADDR[19]} {design_1_i/display_0_M_AXI_ARADDR[20]} {design_1_i/display_0_M_AXI_ARADDR[21]} {design_1_i/display_0_M_AXI_ARADDR[22]} {design_1_i/display_0_M_AXI_ARADDR[23]} {design_1_i/display_0_M_AXI_ARADDR[24]} {design_1_i/display_0_M_AXI_ARADDR[25]} {design_1_i/display_0_M_AXI_ARADDR[26]} {design_1_i/display_0_M_AXI_ARADDR[27]} {design_1_i/display_0_M_AXI_ARADDR[28]} {design_1_i/display_0_M_AXI_ARADDR[29]} {design_1_i/display_0_M_AXI_ARADDR[30]} {design_1_i/display_0_M_AXI_ARADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {design_1_i/display_0_VGA_G[0]} {design_1_i/display_0_VGA_G[1]} {design_1_i/display_0_VGA_G[2]} {design_1_i/display_0_VGA_G[3]} {design_1_i/display_0_VGA_G[4]} {design_1_i/display_0_VGA_G[5]} {design_1_i/display_0_VGA_G[6]} {design_1_i/display_0_VGA_G[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 64 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {design_1_i/display_0_M_AXI_RDATA[0]} {design_1_i/display_0_M_AXI_RDATA[1]} {design_1_i/display_0_M_AXI_RDATA[2]} {design_1_i/display_0_M_AXI_RDATA[3]} {design_1_i/display_0_M_AXI_RDATA[4]} {design_1_i/display_0_M_AXI_RDATA[5]} {design_1_i/display_0_M_AXI_RDATA[6]} {design_1_i/display_0_M_AXI_RDATA[7]} {design_1_i/display_0_M_AXI_RDATA[8]} {design_1_i/display_0_M_AXI_RDATA[9]} {design_1_i/display_0_M_AXI_RDATA[10]} {design_1_i/display_0_M_AXI_RDATA[11]} {design_1_i/display_0_M_AXI_RDATA[12]} {design_1_i/display_0_M_AXI_RDATA[13]} {design_1_i/display_0_M_AXI_RDATA[14]} {design_1_i/display_0_M_AXI_RDATA[15]} {design_1_i/display_0_M_AXI_RDATA[16]} {design_1_i/display_0_M_AXI_RDATA[17]} {design_1_i/display_0_M_AXI_RDATA[18]} {design_1_i/display_0_M_AXI_RDATA[19]} {design_1_i/display_0_M_AXI_RDATA[20]} {design_1_i/display_0_M_AXI_RDATA[21]} {design_1_i/display_0_M_AXI_RDATA[22]} {design_1_i/display_0_M_AXI_RDATA[23]} {design_1_i/display_0_M_AXI_RDATA[24]} {design_1_i/display_0_M_AXI_RDATA[25]} {design_1_i/display_0_M_AXI_RDATA[26]} {design_1_i/display_0_M_AXI_RDATA[27]} {design_1_i/display_0_M_AXI_RDATA[28]} {design_1_i/display_0_M_AXI_RDATA[29]} {design_1_i/display_0_M_AXI_RDATA[30]} {design_1_i/display_0_M_AXI_RDATA[31]} {design_1_i/display_0_M_AXI_RDATA[32]} {design_1_i/display_0_M_AXI_RDATA[33]} {design_1_i/display_0_M_AXI_RDATA[34]} {design_1_i/display_0_M_AXI_RDATA[35]} {design_1_i/display_0_M_AXI_RDATA[36]} {design_1_i/display_0_M_AXI_RDATA[37]} {design_1_i/display_0_M_AXI_RDATA[38]} {design_1_i/display_0_M_AXI_RDATA[39]} {design_1_i/display_0_M_AXI_RDATA[40]} {design_1_i/display_0_M_AXI_RDATA[41]} {design_1_i/display_0_M_AXI_RDATA[42]} {design_1_i/display_0_M_AXI_RDATA[43]} {design_1_i/display_0_M_AXI_RDATA[44]} {design_1_i/display_0_M_AXI_RDATA[45]} {design_1_i/display_0_M_AXI_RDATA[46]} {design_1_i/display_0_M_AXI_RDATA[47]} {design_1_i/display_0_M_AXI_RDATA[48]} {design_1_i/display_0_M_AXI_RDATA[49]} {design_1_i/display_0_M_AXI_RDATA[50]} {design_1_i/display_0_M_AXI_RDATA[51]} {design_1_i/display_0_M_AXI_RDATA[52]} {design_1_i/display_0_M_AXI_RDATA[53]} {design_1_i/display_0_M_AXI_RDATA[54]} {design_1_i/display_0_M_AXI_RDATA[55]} {design_1_i/display_0_M_AXI_RDATA[56]} {design_1_i/display_0_M_AXI_RDATA[57]} {design_1_i/display_0_M_AXI_RDATA[58]} {design_1_i/display_0_M_AXI_RDATA[59]} {design_1_i/display_0_M_AXI_RDATA[60]} {design_1_i/display_0_M_AXI_RDATA[61]} {design_1_i/display_0_M_AXI_RDATA[62]} {design_1_i/display_0_M_AXI_RDATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {design_1_i/display_0_VGA_R[0]} {design_1_i/display_0_VGA_R[1]} {design_1_i/display_0_VGA_R[2]} {design_1_i/display_0_VGA_R[3]} {design_1_i/display_0_VGA_R[4]} {design_1_i/display_0_VGA_R[5]} {design_1_i/display_0_VGA_R[6]} {design_1_i/display_0_VGA_R[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 2 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {design_1_i/display_0_M_AXI_RRESP[0]} {design_1_i/display_0_M_AXI_RRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {design_1_i/display_0_VGA_B[0]} {design_1_i/display_0_VGA_B[1]} {design_1_i/display_0_VGA_B[2]} {design_1_i/display_0_VGA_B[3]} {design_1_i/display_0_VGA_B[4]} {design_1_i/display_0_VGA_B[5]} {design_1_i/display_0_VGA_B[6]} {design_1_i/display_0_VGA_B[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/display_0_M_AXI_ARREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/display_0_M_AXI_ARVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list design_1_i/display_0_M_AXI_RLAST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list design_1_i/display_0_M_AXI_RREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list design_1_i/display_0_M_AXI_RVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list design_1_i/display_0_VGA_DE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list design_1_i/display_0_VGA_HS]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list design_1_i/display_0_VGA_VS]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list design_1_i/display_0/inst/FIFO_READY]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
