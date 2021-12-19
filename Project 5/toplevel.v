`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:38 11/18/2021 
// Design Name: 
// Module Name:    toplevel 
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
module toplevel(
clk,
clr,
anode,
seg,
thsync,
tvsync,
tred,
tgreen,
tblue,
MOSI,
MISO,
SS,
SCLK,
Led
    );
    
input clk;
input clr;    
    
wire dclk;
wire segclk;
wire scoreclk;
wire plrclk;
wire gameclk;

wire clrSig;

wire [8:0] barpos;
wire [3:0] holepos;
wire [3:0] plrpos;
wire [15:0] timealive;
wire [1:0] lives;
wire [2:0] cyclesneeded;

output reg [3:0] anode;
output reg [6:0] seg;

output reg thsync;
output reg tvsync;
output reg [2:0] tred;
output reg [2:0] tgreen;
output reg [1:0] tblue;

wire [9:0] posData;

output reg [2:0] Led;

wire hsync;
wire vsync;
wire [2:0] red;
wire [2:0] green;
wire [1:0] blue;

wire tMOSI;
wire tSS;
wire tSCLk;

input MISO;
output reg MOSI;
output reg SS;
output reg SCLK;

wire [2:0] topled;
wire [6:0] topseg;
wire [3:0] topanode;

clockdiv clockdiv_(
       .clk(clk),
       .clr(clrSig),
       .scoreclk(scoreclk),
       .segclk(segclk),
       .dclk(dclk),
       .plrclk(plrclk),
       .gameclk(gameclk)
);   

debouncer debouncer_(
        .clk(clk),
        .clrBtn(clr),
        .clr(clrSig)
);

game game_(
        .clb(clk),
       .gameclk(gameclk),
       .clr(clrSig),
       .scoreclk(scoreclk),
       .barpos(barpos[8:0]),
       .holepos(holepos[3:0]),
       .plrpos(plrpos[3:0]),
       .timealive(timealive),
       .lives(lives),
       .cyclesneeded(cyclesneeded)
);

vga vga_(
    .dclk(dclk),
    .clr(clrSig),
    .barpos(barpos[8:0]),
    .holepos(holepos[3:0]),
    .plrpos(plrpos[3:0]),
    .lives(lives[1:0]),
    .hsync(hsync),
    .vsync(vsync),
    .red(red[2:0]),
    .green(green[2:0]),
    .blue(blue[1:0]),
    .cyclesneeded(cyclesneeded)
);

joystick joystick_(
       .CLK(clk),
       .RST(clrSig),
       .MISO(MISO),
       .SS(tSS),
       .MOSI(tMOSI),
       .SCLK(tSCLK),
       .posData(posData[9:0])
);

movement movement_(
        .lives(lives[1:0]),
        .clk(plrclk),
        .plrpos(plrpos[3:0]),
        .posData(posData[9:0])
);

lives lives_(
        .gameclk(gameclk),
        .lives(lives[1:0]),
        .led(topled)
);

display display_(
        .segclk(segclk),
        .timealive(timealive[15:0]),
        .anode(topanode),
        .segment(topseg)
);


always @(*)
begin
    thsync = hsync;
    tvsync = vsync;
    tred = red;
    tgreen = green;
    tblue = blue;
    MOSI = tMOSI;
    SS = tSS;
    SCLK = tSCLK;
    Led = topled;
    anode = topanode;
    seg = topseg;
end

endmodule
