`default_nettype none

module chardisp_tb;

/* Define the clock period and the number of the simulation steps. */
localparam STEP = 10;
localparam CLKNUM = (800*525+12000)*4;

reg CLK, RST;
reg [15:0] RDADDR;
reg [15:0] WRADDR;
reg [3:0] BYTEEN;
reg RDEN, WREN;
reg [31:0] WRDATA;
wire [31:0] RDDATA;
wire [3:0] VGA_R, VGA_G, VGA_B;
wire VGA_HS, VGA_VS, VGA_DE;
wire PCK;

chardisp chardisp_inst(
    .CLK(CLK),
    .RST(RST),
    .WRADDR(WRADDR),
    .BYTEEN(BYTEEN),
    .WREN(WREN),
    .WRDATA(WRDATA),
    .RDADDR(RDADDR),
    .RDEN(RDEN),
    .RDDATA(RDDATA),
    .PCK(PCK),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .VGA_DE(VGA_DE)
);

/* clock */
always begin
    CLK = 0; #(STEP/2);
    CLK = 1; #(STEP/2);
end

/* A task to write to the VRAM. */
task write_vram(
    input [15:0] wraddr,
    input [3:0] byteen,
    input [31:0] wrdata
);
    WRADDR = wraddr;
    BYTEEN = byteen;
    WRDATA = wrdata;
    WREN = 1;
    #STEP;
    WREN = 0;
    #STEP;
endtask

int fd, i;

/* input to the verification target */
initial begin
    RST = 0; WRADDR = 0; BYTEEN = 0; WRDATA = 0; WREN = 0;
    RDADDR = 0; RDEN = 0;
    fd = $fopen("imagedata.raw", "wb");
    #(STEP*500); RST = 1;
    #(STEP*10); RST = 0;

    for (i=0; i<4000; i=i+1) begin
        write_vram(i<<2, 4'b1111, (i<<8) | (8'hff & i));
    end

    #(STEP*CLKNUM);
    $fclose(fd);
    $stop;
end

/* output to file */
always @(posedge PCK) begin
    if (VGA_DE) begin
        $fwrite(fd, "%c", {VGA_R, VGA_R});
        $fwrite(fd, "%c", {VGA_G, VGA_G});
        $fwrite(fd, "%c", {VGA_B, VGA_B});
    end
end

endmodule
