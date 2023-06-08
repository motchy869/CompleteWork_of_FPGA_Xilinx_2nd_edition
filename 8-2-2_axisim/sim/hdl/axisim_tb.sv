`default_nettype none

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

initial begin
    agent = new("AXI slave agent", dut.design_1_i.axi_vip_0.inst.IF);
    agent.start_slave();
end

endmodule
