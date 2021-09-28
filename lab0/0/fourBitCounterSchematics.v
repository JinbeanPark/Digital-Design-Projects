module fourBitCounterSchematics (clk, rst, a);
 
    input clk, rst;
    output reg [3:0] a;
 
    always @ (posedge clk) begin
        if (rst) begin
            a[0] <= 1'b0;
            a[1] <= 1'b0;
            a[2] <= 1'b0;
            a[3] <= 1'b0;
        end
        else begin
            a[0] <= ~a[0];
            a[1] <= a[1] ^ a[0];
            a[2] <= a[2] ^ (a[0] & a[1]);
            a[3] <= a[3] ^ (a[0] & a[1] & a[2]);
        end
    end
 
endmodule