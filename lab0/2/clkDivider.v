module clkDivider (clk, rst, led);
 
    input clk, rst;
    output reg led;
 
    reg [3:0] period;
 
    always @ (posedge clk) begin
        if (rst)
            period = 4'd0;
        else if (period == 4'd9)
            period = 4'd0;
        else
            period = period + 4'd1;
    end
 
    always @ (posedge clk) begin
        if (rst)
            led = 1'b0;
        else if (period == 4'd9)
            led <= 1'b1;
        else if (period == 4'd4)
            led <= 1'b0;
    end
 
endmodule