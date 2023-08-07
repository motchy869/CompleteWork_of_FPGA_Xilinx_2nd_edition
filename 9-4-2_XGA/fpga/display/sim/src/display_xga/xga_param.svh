/* parameters for XGA (1024x768) */

`ifndef XGA_PARAMS_H
    `define XGA_PARAMS_H
    localparam int HPERIOD = 11'd1344;
    localparam int HFRONT = $bits(HPERIOD)'(24);
    localparam int HWIDTH = $bits(HPERIOD)'(136);
    localparam int HBACK = $bits(HPERIOD)'(160);

    localparam int VPERIOD = $bits(HPERIOD)'(806);
    localparam int VFRONT = $bits(HPERIOD)'(3);
    localparam int VWIDTH = $bits(HPERIOD)'(6);
    localparam int VBACK = $bits(HPERIOD)'(29);
`endif
