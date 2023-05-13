
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list gradation_inst/syncgen_inst/pckgen_inst/PCK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 10 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {gradation_inst/syncgen_inst/HCNT[0]} {gradation_inst/syncgen_inst/HCNT[1]} {gradation_inst/syncgen_inst/HCNT[2]} {gradation_inst/syncgen_inst/HCNT[3]} {gradation_inst/syncgen_inst/HCNT[4]} {gradation_inst/syncgen_inst/HCNT[5]} {gradation_inst/syncgen_inst/HCNT[6]} {gradation_inst/syncgen_inst/HCNT[7]} {gradation_inst/syncgen_inst/HCNT[8]} {gradation_inst/syncgen_inst/HCNT[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 10 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {gradation_inst/syncgen_inst/VCNT[0]} {gradation_inst/syncgen_inst/VCNT[1]} {gradation_inst/syncgen_inst/VCNT[2]} {gradation_inst/syncgen_inst/VCNT[3]} {gradation_inst/syncgen_inst/VCNT[4]} {gradation_inst/syncgen_inst/VCNT[5]} {gradation_inst/syncgen_inst/VCNT[6]} {gradation_inst/syncgen_inst/VCNT[7]} {gradation_inst/syncgen_inst/VCNT[8]} {gradation_inst/syncgen_inst/VCNT[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {gradation_inst/horiz_band_idx[0]} {gradation_inst/horiz_band_idx[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {VGA_G[0]} {VGA_G[1]} {VGA_G[2]} {VGA_G[3]} {VGA_G[4]} {VGA_G[5]} {VGA_G[6]} {VGA_G[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {VGA_R[0]} {VGA_R[1]} {VGA_R[2]} {VGA_R[3]} {VGA_R[4]} {VGA_R[5]} {VGA_R[6]} {VGA_R[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {VGA_B[0]} {VGA_B[1]} {VGA_B[2]} {VGA_B[3]} {VGA_B[4]} {VGA_B[5]} {VGA_B[6]} {VGA_B[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list VGA_DE]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list VGA_HS]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list VGA_VS]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets PCK]
