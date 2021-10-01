module clkDivider (clk, rst, led);
 
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