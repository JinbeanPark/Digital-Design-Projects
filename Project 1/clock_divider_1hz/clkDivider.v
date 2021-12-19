module clkDivider (clk, rst, led);
 /* loop on positive edge of clock
 rst sets period back to 32 bit decimal value 0
 otherwise it will go back to 0 when it reaches 100000000, which is slowing the 100 Mhz clock in the board to 1 Hz (100*10^6=100000000)
 the more accurate number is 99999999 since we start at 0, so we want to reset at all 9s, but the accuracy at that point is negligible
 increments by 1 when not restting
 we also toggle the led on and off with a 1 bit led value, where 0 is off and 1 is on
 it toggles on at the full length of the period, and off at half the period.
 we want it to flash within a second, hence 100mil and 50mil vs (on for a second, off for another) 200mil and 100mil)
 */
    input clk, rst;
    output reg led;
 
    reg [31:0] period;
 
    always @ (posedge clk) begin
        if (rst)
            period = 32'd0;
        else if (period == 32'd100000000)
            period = 32'd0;
        else
            period = period + 32'd1;
    end
 
    always @ (posedge clk) begin
        if (rst)
            led = 1'b0;
        else if (period == 32'd100000000)
            led = 1'b1;
        else if (period == 32'd50000000)
            led = 1'b0;
    end
 
endmodule
