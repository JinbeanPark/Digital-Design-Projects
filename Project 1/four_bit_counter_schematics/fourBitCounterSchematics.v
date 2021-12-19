module fourBitCounterSchematics (clk, rst,a0,a1,a2,a3);
 /* uses the combinational logic provided by the diagram in the lab to function
 whenever a positive clock edge signal is sent, we will run the loop at line 11
 rst will initialize everything at binary 0
 <= is a non-blocking which means code is run in parallel and thus will run based on original value
 eg. 0001 to 0010 is because a0 <= ~1, a1 <= 0 ^ 1*/
    input clk, rst;
    output reg a0;
    output reg a1;
    output reg a2;
    output reg a3;
 
 
    always @ (posedge clk) begin
        if (rst) begin
            a0 <= 1'b0;
            a1 <= 1'b0;
            a2 <= 1'b0;
            a3 <= 1'b0;
        end
        else begin
            a0 <= ~a0;
            a1 <= a1 ^ a0;
            a2 <= a2 ^ (a0 & a1);
            a3 <= a3 ^ (a0 & a1 & a2);
        end
    end
 
endmodule
