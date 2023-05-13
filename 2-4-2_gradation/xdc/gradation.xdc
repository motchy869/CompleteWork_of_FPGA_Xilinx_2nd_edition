# Zybo Z7 constraints file
# chapter: 2
# project: pattern

#Clock signal
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { CLK }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { CLK }];

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF];
set_clock_groups -asynchronous -group {iPCK} -group {sys_clk_pin};

#Reset
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { RST }]; # BTN[3]
set_input_delay -clock sys_clk_pin -max 1.0 [get_ports { RST }];
set_input_delay -clock sys_clk_pin -min 0.0 [get_ports { RST }];
set_false_path -from [get_ports { RST }] -to [get_pins {ff1_RST*/D}];

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
set_property -dict { PACKAGE_PIN H17   IOSTANDARD TMDS_33  } [get_ports { HDMI_CLK_N }];
set_property -dict { PACKAGE_PIN H16   IOSTANDARD TMDS_33  } [get_ports { HDMI_CLK_P }];
set_property -dict { PACKAGE_PIN D20   IOSTANDARD TMDS_33  } [get_ports { HDMI_N[0] }];
set_property -dict { PACKAGE_PIN D19   IOSTANDARD TMDS_33  } [get_ports { HDMI_P[0] }];
set_property -dict { PACKAGE_PIN B20   IOSTANDARD TMDS_33  } [get_ports { HDMI_N[1] }];
set_property -dict { PACKAGE_PIN C20   IOSTANDARD TMDS_33  } [get_ports { HDMI_P[1] }];
set_property -dict { PACKAGE_PIN A20   IOSTANDARD TMDS_33  } [get_ports { HDMI_N[2] }];
set_property -dict { PACKAGE_PIN B19   IOSTANDARD TMDS_33  } [get_ports { HDMI_P[2] }];
set_output_delay -clock sys_clk_pin -max 1.0 [get_ports { HDMI_* }]; # dummy delay
set_output_delay -clock sys_clk_pin -min 0.0 [get_ports { HDMI_* }]; # dummy delay
set_false_path -from * -to [get_ports { HDMI_* }];

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

## false path
#set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] \
#    -group [get_clocks -include_generated_clocks clk_fpga_0 -filter {NAME !~ clk_fpga_0}]
