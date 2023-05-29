// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sat May 20 20:56:38 2023
// Host        : SurfaceLaptop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-2_chardisp/chardisp_ip/src/VRAM/VRAM_sim_netlist.v
// Design      : VRAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "VRAM,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module VRAM
   (clka,
    wea,
    addra,
    dina,
    douta,
    clkb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [2:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [23:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [23:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [2:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [23:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [23:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [23:0]dina;
  wire [23:0]dinb;
  wire [23:0]douta;
  wire [23:0]doutb;
  wire [2:0]wea;
  wire [2:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [23:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "3" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     15.291 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "VRAM.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "24" *) 
  (* C_READ_WIDTH_B = "24" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "3" *) 
  (* C_WEB_WIDTH = "3" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "24" *) 
  (* C_WRITE_WIDTH_B = "24" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  VRAM_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[23:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64848)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
