module fourBitCounterSchematics (clk, rst, a);
 
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