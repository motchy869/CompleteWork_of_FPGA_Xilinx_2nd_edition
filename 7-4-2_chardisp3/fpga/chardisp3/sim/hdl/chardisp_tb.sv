`default_nettype none

module chardisp_tb;

/* Define the clock period and the number of the simulation steps. */
localparam STEP = 10;
localparam CLKNUM = (800*525+12000)*4;

reg CLK, RST;
reg [15:0] READ_ADDR;
reg [15:0] WRITE_ADDR;
reg [3:0] BYTE_EN;
reg READ_EN, WRITE_EN;
reg [31:0] WRITE_DATA;
wire [31:0] READ_DATA;
wire [3:0] VGA_R, VGA_G, VGA_B;
wire VGA_HS, VGA_VS, VGA_DE;
wire PCK;

chardisp chardisp_inst(
    .CLK(CLK),
    .RST(RST),
    .WRITE_ADDR(WRITE_ADDR),
    .BYTE_EN(BYTE_EN),
    .WRITE_EN(WRITE_EN),
    .WRITE_DATA(WRITE_DATA),
    .READ_ADDR(READ_ADDR),
    .READ_EN(READ_EN),
    .READ_DATA(READ_DATA),
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
    WRITE_ADDR = wraddr;
    BYTE_EN = byteen;
    WRITE_DATA = wrdata;
    WRITE_EN = 1;
    #STEP;
    WRITE_EN = 0;
    #STEP;
endtask

int fd, i;

/* input to the verification target */
initial begin
    RST = 0; WRITE_ADDR = 0; BYTE_EN = 0; WRITE_DATA = 0; WRITE_EN = 0;
    READ_ADDR = 0; READ_EN = 0;
    fd = $fopen("imagedata.raw", "wb");
    #(STEP*500); RST = 1;
    #(STEP*10); RST = 0;

    /* display config */
    write_vram('h4000, 4'b1111, 8'h1);

    /* VRAM content */
    for (i=0; i<4000; i=i+1) begin
        write_vram(i<<2, 4'b1111, ((i & 12'hfff)<<8) | (8'hff & i));
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
