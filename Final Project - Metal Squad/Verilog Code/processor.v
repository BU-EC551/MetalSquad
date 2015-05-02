`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:35 02/24/2015 
// Design Name: 
// Module Name:    processor 
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
module processor(clk, clk_seg, right_button, R, G, B, HS, VS,
						MemOE, MemWR, MemAdv, MemWait, MemClk, // Cellular Ram interface
						RamCS, RamCRE, RamUB, RamLB,
						MemAdr, MemDB, check, left_button, punch_button, kick_button, down_button, up_button,
						right_button_2, left_button_2, punch_button_2, kick_button_2, down_button_2, up_button_2, knock_out);

input clk, clk_seg, right_button, left_button, punch_button, kick_button, down_button, up_button;
input right_button_2, left_button_2, punch_button_2, kick_button_2, down_button_2, up_button_2, knock_out;
output MemOE, MemWR, MemAdv, MemClk, RamCS, RamCRE, RamUB, RamLB;
output [26:0] MemAdr;   
input MemWait;
input [15:0] MemDB;  
output check;
wire rst;

// Color outputs to show on display (current pixel)
output [2:0] R, G;
output [1:0] B;
// Synchronization signals
output HS;
output VS;

wire right_button_debounced;
wire left_button_debounced;
wire punch_button_debounced;
wire kick_button_debounced;
wire down_button_debounced;
wire up_button_debounced;
wire right_button_debounced_2;
wire left_button_debounced_2;
wire punch_button_debounced_2;
wire kick_button_debounced_2;
wire down_button_debounced_2;
wire up_button_debounced_2;
wire reset_debounced;
wire [25:0] ram_addr;

vga_display vga(rst, clk, R, G, B, HS, VS, MemDB, 
					right_button_debounced,left_button_debounced, ram_addr, punch_button_debounced, kick_button_debounced,
					down_button_debounced, up_button_debounced,right_button_debounced_2,left_button_debounced_2, 
					punch_button_debounced_2, kick_button_debounced_2,
					down_button_debounced_2, up_button_debounced_2,reset_debounced);

Debouncer debouncer_right(clk, right_button, right_button_debounced);
Debouncer debouncer_left(clk, left_button, left_button_debounced);
Debouncer debouncer_punch(clk, punch_button, punch_button_debounced);
Debouncer debouncer_kick(clk, kick_button, kick_button_debounced);
Debouncer debouncer_down(clk, down_button, down_button_debounced);
Debouncer debouncer_up(clk, up_button, up_button_debounced);

Debouncer debouncer_right_2(clk, right_button_2, right_button_debounced_2);
Debouncer debouncer_left_2(clk, left_button_2, left_button_debounced_2);
Debouncer debouncer_punch_2(clk, punch_button_2, punch_button_debounced_2);
Debouncer debouncer_kick_2(clk, kick_button_2, kick_button_debounced_2);
Debouncer debouncer_down_2(clk, down_button_2, down_button_debounced_2);
Debouncer debouncer_up_2(clk, up_button_2, up_button_debounced_2);
Debouncer debouncer_knock(clk, knock_out, reset_debounced);

cellular_ram_controller ram_ctrl(clk, MemOE, MemWR, MemAdv, MemClk, RamCS, RamCRE, RamUB, RamLB, MemAdr [26:1],
											MemWait, MemDB, ram_addr);

assign check = (MemDB == "1");											

endmodule
