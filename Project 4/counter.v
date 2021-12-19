`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:53 10/28/2021 
// Design Name: 
// Module Name:    counter 
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
module counter(
adjclk,
mincounter,
seccounter,
sel,
adj,
btn0_val,
btn1_val
    );
output reg [5:0] mincounter;
output reg [5:0] seccounter;
input adjclk;
input adj;
input sel;
input btn0_val; //reset
input btn1_val; //pause
reg cycle;
reg pendingReset;
reg pausedState;
reg pendingPause;
initial
begin
	mincounter = 0;
	seccounter = 0;
    cycle = 0;
    pausedState = 0;
    pendingPause = 0;
end
/*
always @(posedge btn0_val)
begin
	mincounter <= 0;
	seccounter <= 0;
end*/


always @(posedge adjclk or posedge btn0_val or posedge btn1_val)
begin
    if (btn0_val == 1)
    begin
        mincounter = 0;
        seccounter = 0;
    end
    else if (btn1_val == 1)
    begin
        pendingPause = 1;
    end
    else
    begin
    if (pendingPause == 1)
        begin
            pausedState = ~pausedState;
            pendingPause = 0;
        end
    cycle = ~cycle;
    if (cycle == 0)
    begin
        
        if (adj == 0 && pausedState == 0)
        begin
            seccounter = seccounter + 1;
            if (seccounter % 60 == 0)
            begin
                seccounter = 0;
                mincounter = mincounter + 1;
                if (mincounter % 60 == 0)
                begin
                    mincounter = 0;
                end
            end
        end
	end
    
	if (adj == 1 && pausedState == 0)
	begin
		if (sel == 1)
		begin
			seccounter = seccounter + 1;
			if (seccounter % 60 == 0)
			begin
				seccounter = 0;
			end
		end
		else
		begin
			mincounter = mincounter + 1;
            if (mincounter % 60 == 0)
            begin
                mincounter = 0;
            end
		end
	end
    end
end


endmodule
