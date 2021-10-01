module fourBitCounterModern (clk, rst, a);
 /*whenever a positive edge signal on the clock is given, we will start the loop at line 6
 if reset is 1, then the array will be set back to 0000, thus resetting the counter for counting again
 otherwise the array counter is incremented by 1, which differs from the schematic in that the schematic uses combinational logic (gates) to count*/
    input clk, rst;
    output reg [3:0] a;
 
    always @ (posedge clk) begin
        if (rst) begin
            a <= 4'b0000;
        end
        else begin
            a <= a + 1'b1;
        end
    end
 
endmodule
