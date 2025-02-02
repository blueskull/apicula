/* Using an oscilloscope you can see on pins tlvds_p and tlvds_n the signal with changing polarity.
* You can also use a 100 Ohm resistor and two LEDs connected in opposite directions between these pins.
*/
module top (
    input clk,
    output tlvds_p,
    output tlvds_n,
);

reg [25:0] ctr_q;
wire [25:0] ctr_d;
wire i_tick;

// Sequential code (flip-flop)
always @(posedge clk)
    ctr_q <= ctr_d;

// Combinational code (boolean logic)
assign ctr_d = ctr_q + 1'b1;
assign i_tick = |ctr_q[25:24];

TLVDS_OBUF diff_buf(
        .O(tlvds_p),
        .OB(tlvds_n),
        .I(i_tick)
    );

endmodule

