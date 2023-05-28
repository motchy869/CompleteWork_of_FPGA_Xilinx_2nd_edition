// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sat May 20 21:02:24 2023
// Host        : SurfaceLaptop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-2_chardisp/chardisp_ip/src/CGROM/CGROM_sim_netlist.v
// Design      : CGROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "CGROM,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module CGROM
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [7:0]douta;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.1884 mW" *) 
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
  (* C_INIT_FILE = "CGROM.mem" *) 
  (* C_INIT_FILE_NAME = "CGROM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  CGROM_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18288)
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
