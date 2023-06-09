`default_nettype none
timeunit 1ns;
timeprecision 1ps;

import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

module axisim_tb;

/* Define connection signals. */
logic ACLK, ARESETN, ERROR;

/* Connect the verification target. */
design_1_wrapper dut(.*);

/* Generate clock. */
localparam integer STEP = 10;

always begin
    ACLK = 0; #(STEP/2);
    ACLK = 1; #(STEP/2);
end

/* Create the inputs for the verification target. */
initial begin
    ARESETN = 1;
    #(STEP*5);
    ARESETN = 0;
    #(STEP*20);
    ARESETN = 1;
    #(STEP*500);
    $stop;
end

/* Define and start the agent for the VIP slave. */
design_1_axi_vip_0_0_slv_mem_t agent;

/* ARREADY behavior */
task user_gen_arready();
    axi_ready_gen arready_gen;
    arready_gen = agent.rd_driver.create_ready("arready");
    arready_gen.set_ready_policy(XIL_AXI_READY_GEN_OSC);
    arready_gen.set_low_time(6);
    arready_gen.set_high_time(2);
    agent.rd_driver.send_arready(arready_gen);
endtask

/* WREADY behavior */
task user_gen_wready();
    axi_ready_gen wready_gen;
    wready_gen = agent.wr_driver.create_ready("wready");
    wready_gen.set_ready_policy(XIL_AXI_READY_GEN_OSC);
    wready_gen.set_low_time(5);
    wready_gen.set_high_time(1);
    agent.wr_driver.send_wready(wready_gen);
endtask

initial begin
    agent = new("AXI slave agent", dut.design_1_i.axi_vip_0.inst.IF);
    agent.start_slave();
    fork
        user_gen_arready();
        user_gen_wready();
    join
end

endmodule
