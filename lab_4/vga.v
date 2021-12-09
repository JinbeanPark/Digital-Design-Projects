`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga 
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
module vga(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	input wire [8:0] barpos,
	input wire [3:0] holepos,
	input wire [3:0] plrpos, 
    input wire [1:0] lives,
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue,	//blue vga output
    input wire [2:0] cyclesneeded
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

always @(*)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp && hc >= hbp && hc < hfp)
	begin
		// check if rendering player
		if (hc >= hbp + (40 * plrpos) && hc < hbp + (40 * plrpos) + 40 && vc >= vfp - 40 && vc < vfp)
		begin
            case (lives)
                2'b00:
                begin
                    red = 3'b111;
                    green = 3'd000;
                    blue = 2'b00;
                end
                2'b01:
                begin
                    red = 3'b111;
                    green = 3'b010;
                    blue = 2'b01;
                end
                2'b10:
                begin
                    red = 3'b111;
                    green = 3'b101;
                    blue = 2'b10;
                end
                2'b11:
                begin
                    red = 3'b111;
                    green = 3'b111;
                    blue = 2'b11;
                end
            endcase
		end

		// check if rendering a bar
		else if (vc <= vbp + barpos && vc > vbp + barpos - 30)
		begin
			if (hc < hbp + (40 * holepos) || hc >= hbp + (40 * holepos) + 120)
			begin
                case (cyclesneeded)
                    3'b110:
                    begin
                        red = 3'b111;
                        green = 3'b111;
                        blue = 2'b11;
                    end
                    3'b101:
                    begin
                        red = 3'b000;
                        green = 3'b111;
                        blue = 2'b00;
                    end
                    3'b100:
                    begin
                        red = 3'b000;
                        green = 3'b000;
                        blue = 2'b11;
                    end
                    3'b011:
                    begin
                        red = 3'b111;
                        green = 3'b111;
                        blue = 2'b00;
                    end
                    3'b010:
                    begin
                        red = 3'b111;
                        green = 3'b000;
                        blue = 2'b11;
                    end
                endcase
         
				
			end
            else 
            begin
                case (cyclesneeded)
                    3'b110:
                    begin
                        red = 3'b000;
                        green = 3'b000;
                        blue = 2'b00;
                    end
                    3'b101:
                    begin
                        red = 3'b111;
                        green = 3'b000;
                        blue = 2'b11;
                    end
                    3'b100:
                    begin
                        red = 3'b111;
                        green = 3'b111;
                        blue = 2'b00;
                    end
                    3'b011:
                    begin
                        red = 3'b000;
                        green = 3'b000;
                        blue = 2'b11;
                    end
                    3'b010:
                    begin
                        red = 3'b000;
                        green = 3'b111;
                        blue = 2'b00;
                    end
                endcase
            end
		end
		else
		begin
			case (cyclesneeded)
                    3'b110:
                    begin
                        red = 3'b000;
                        green = 3'b000;
                        blue = 2'b00;
                    end
                    3'b101:
                    begin
                        red = 3'b111;
                        green = 3'b000;
                        blue = 2'b11;
                    end
                    3'b100:
                    begin
                        red = 3'b111;
                        green = 3'b111;
                        blue = 2'b00;
                    end
                    3'b011:
                    begin
                        red = 3'b000;
                        green = 3'b000;
                        blue = 2'b11;
                    end
                    3'b010:
                    begin
                        red = 3'b000;
                        green = 3'b111;
                        blue = 2'b00;
                    end
                endcase
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule