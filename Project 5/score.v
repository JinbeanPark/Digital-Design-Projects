`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11/16/2021 
// Design Name: 
// Module Name:    score 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module display(
    segclk,
    timealive,
    anode,
    segment
);

input segclk;
input [15:0] timealive;
output reg [3:0] anode;
output reg [6:0] segment;

reg [3:0] value;
reg [1:0] counter;

initial
begin
	counter = 0;
end

always @(posedge segclk)
begin
	case(counter)
		2'b00:
		begin
			anode = 4'b0111;
	           	value = (timealive / 60) / 10;
		end
		2'b01:
		begin
			anode = 4'b1011;
			value = (timealive / 60) % 10;
		end
		2'b10:
		begin
			anode = 4'b1101;
	           	value = (timealive % 60) / 10;
		end
		2'b11:
		begin
			anode = 4'b1110;
            		value = (timealive % 60) % 10;
		end
	endcase
	counter = counter + 1;
	case(value)
		4'b0000: segment = 7'b0000001;
		4'b0001: segment = 7'b1001111;
		4'b0010: segment = 7'b0010010;
		4'b0011: segment = 7'b0000110;
		4'b0100: segment = 7'b1001100;
		4'b0101: segment = 7'b0100100;
		4'b0110: segment = 7'b0100000;
		4'b0111: segment = 7'b0001111;
		4'b1000: segment = 7'b0000000;
		4'b1001: segment = 7'b0000100;
		default: segment = 7'b0000001;
	endcase
end

endmodule
