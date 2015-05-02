`timescale 1ns / 1ps

 module vga_display(rst, clk, R, G, B, HS, VS, pixel_val, move_right_1, move_left_1, ram_addr, punch_1, kick_1, down_1, up_1, 
							 move_right_2, move_left_2, punch_2, kick_2, down_2, up_2, reset);
	
	parameter ryu_address = 25'd950000; // Make sure to load Ryu's sprite at this location onto DRAM
	parameter one_0_five=25'd105;
	parameter ken_img_size=25'd1597;
	parameter ryu_img_size=25'd1541;
	parameter character_y_loc = 25'd210; // default upper bound horizontal locations of 2 characters
	parameter character_y_loc_2 = 25'd315; // lower bound
	
	input rst;	// Global reset to reset display
	input clk;	// 100MHz clk
	input [15:0] pixel_val; // Input data from DRAM
	
	input move_right_1; // JAMMA signals
	input move_left_1;
	input punch_1;
	input kick_1;
	input down_1;
	input up_1;
	input reset;
	
	input move_right_2;
	input move_left_2;
	input punch_2;
	input kick_2;
	input down_2;
	input up_2;
	// DRAM Address
	output [25:0] ram_addr;
	// Color outputs to show on display (current pixel)
	output [2:0] R, G;
	output [1:0] B;
   reg [2:0]R_bar, G_bar;
	reg [1:0]B_bar;
	// Synchronization signals
	output HS;
	output VS;
	
	// Controls:
	wire [10:0] hcount, vcount;	// coordinates for the current pixel
	wire blank;	// signal to indicate the current coordinate is blank
	wire [7:0] pixel_val_8bit; // splitting 2 pixels
	reg player_1_region;
	reg player_2_region;
	// SPECIAL FOR RYU DOES NOT WORK
	reg [15:0]ryu_special_location;
	initial ryu_special_location = 16'd0;
	wire ryu_special_region = (ryu_special_location != 16'd0) && (hcount <= (16'd42 + ryu_special_location)) && (hcount >= (ryu_special_location)) && ((vcount >= character_y_loc+25'd16) && (vcount < character_y_loc_2));;
	wire [26:0] ryu_special_addr = (vcount - character_y_loc - 25'd16 + 25'd366) * ryu_img_size + (25'd42-(hcount - ryu_special_location) + 25'd416);;
	///////////////////////////////////
	// Health bar figures
	wire bar1;					
	wire bar2;		
   reg [9:0]health1 = 10'd310;//point value of healths
	reg [9:0]health2 = 10'd310;	
   ////////////////////////////////////
	// Character state registers
	reg [26:0] pixel_addr_palyer_1;
	reg [5:0] state_ken; 
	reg [5:0] move_ken;
	initial state_ken = 6'b0;
	initial move_ken = 6'b0;
	reg [7:0] ken_height = 8'b0;
	
	reg [26:0] pixel_addr_palyer_2;
	reg [5:0] state_ryu; 
	reg [5:0] move_ryu;
	initial state_ryu = 6'b0;
	initial move_ryu = 6'b0;
	reg [7:0] ryu_height = 8'b0;	
	////////////////////////////////////
	// Start or Pause state
	reg start;
	initial start = 1'b0; 
	always @ (posedge reset) begin
		start <= ~start;
	end
	///////////////////////////////////
	assign pixel_val_8bit = ((hcount[0] && vcount[0]) || (~hcount[0] && ~vcount[0])) ?  pixel_val[15:8] : pixel_val[7:0] ; // for now, need to pick between 2 half
	assign ram_addr = player_1_region ?(pixel_addr_palyer_1 [26:1]):(player_2_region ? pixel_addr_palyer_2 [26:1] : ryu_special_addr[26:1]); // need to mux between difference source later
	// RAM addr muxing from different source depending on display region
	assign bar1 = ~blank && (hcount > 10'd5 + (10'd310-health1) && hcount <= 10'd315 && vcount >=10'd5 && vcount <= 10'd25);
	assign bar2 = ~blank && (hcount >= 10'd325 && hcount <= 10'd325+ health2 && vcount >= 10'd5 && vcount <=10'd25);
	// Health bar region calculation
	
	
	/////////////////////////////////////////////////////////////////////
	// LOGIC FOR CALCULATING 2 CHARACTERS DRAM ADDR AND DISPLAY REGION
	always @ (vcount, hcount, state_ken, move_ken, move_ryu, state_ryu) begin
		case (move_ken)
			6'b0: begin //idle_ken
				pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1)) + state_ken * 25'd50;
				player_1_region = (hcount <= (16'd50 + location_1)) && (hcount > (location_1 + 16'd4)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
			end
			6'b1: begin //punch
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount > (location_1+ 16'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd50;
						player_1_region = (hcount <= (16'd54 + location_1)) && (hcount > (location_1+ 16'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd104;
						player_1_region = (hcount <= (16'd76 + location_1)) && (hcount > (location_1+ 16'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd180;
						player_1_region = (hcount <= (16'd60 + location_1)) && (hcount > (location_1+ 16'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd240;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount > (location_1+ 16'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2)); // (vcount < 16'd105) && 
						end
				6'd5: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2));
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount > (location_2+ 16'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				endcase
			end
			
			6'b10: begin //crouch
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) * ken_img_size + ((hcount - location_1) + 25'd1110);
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc + 25'd20) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd1110) + 25'd48;
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc + 25'd20) && (vcount < character_y_loc_2));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd1110);
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc + 25'd20) && (vcount < character_y_loc_2));
						end		
				endcase
			end
			6'b11: begin // jump
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd1: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd50;
						player_1_region = (hcount <= (16'd40 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd2: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd90;
						player_1_region = (hcount <= (16'd38 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height + 16'd14) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd3: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd128;
						player_1_region = (hcount <= (16'd36 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height + 16'd14) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd4: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd164;
						player_1_region = (hcount <= (16'd38 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd5: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd200;
						player_1_region = (hcount <= (16'd40 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height)); 
						end
				6'd6: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc + ken_height) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd240;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				endcase
			end
			6'b100: begin //hit
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc) +25'd362) * ken_img_size + ((hcount - location_1));
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1)) + 25'd50;
						player_1_region = (hcount <= (16'd52 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1)) + 25'd102;
						player_1_region = (hcount <= (16'd58 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd3: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1)) + 25'd160;
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd4: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1));
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				endcase
			end
			6'b101: begin //"kick"
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc) +25'd116) * ken_img_size + ((hcount - location_1)+ 25'd1010);
						player_1_region = (hcount <= (16'd46 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd116) * ken_img_size + ((hcount - location_1)) + 25'd1056;
						player_1_region = (hcount <= (16'd66 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd116) * ken_img_size + ((hcount - location_1)) + 25'd1122;
						player_1_region = (hcount <= (16'd62 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd3: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd116) * ken_img_size + ((hcount - location_1)) + 25'd1184;
						player_1_region = (hcount <= (16'd66 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd4: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd116) * ken_img_size + ((hcount - location_1)+ 25'd1250);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd5: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) * ken_img_size + ((hcount - location_1));
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				endcase
				end
			6'b111: begin //special
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc + ken_height) +25'd234) * ken_img_size + ((hcount - location_1)+ 25'd328);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc + ken_height)+25'd234) * ken_img_size + ((hcount - location_1)) + 25'd378;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc + ken_height)+25'd234) * ken_img_size + ((hcount - location_1)) + 25'd428;
						player_1_region = (hcount <= (16'd62 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end		
				6'd3: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc + ken_height)+25'd244) * ken_img_size + ((hcount - location_1)) + 25'd490;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height- 25'd10) && (vcount < character_y_loc_2 - ken_height));
						end		
				6'd4: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc + ken_height)+25'd244) * ken_img_size + ((hcount - location_1)+ 25'd540);
						player_1_region = (hcount <= (16'd40 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height- 25'd10) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd5: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc + ken_height)+25'd234) * ken_img_size + ((hcount - location_1)+ 25'd580);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc - ken_height) && (vcount < character_y_loc_2 - ken_height));
						end
				6'd6: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) * ken_img_size + ((hcount - location_1));
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end	
				endcase
				end	
			6'b1000: begin //victory
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+ 25'd488) * ken_img_size + ((hcount - location_1) );
						player_1_region = (hcount <= (16'd52 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+ 25'd488)* ken_img_size + ((hcount - location_1)  + 25'd52);
						player_1_region = (hcount <= (16'd52 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+ 25'd488)* ken_img_size + ((hcount - location_1) + 25'd104);
						player_1_region = (hcount <= (16'd52 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc-25'd10) && (vcount < character_y_loc_2));
						end		
				endcase
			end
			6'b1001: begin //knock_out
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc )+25'd362) * ken_img_size + ((hcount - location_1+25'd6)+ 25'd1158);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1-25'd6)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1+25'd28)) + 25'd1214;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1-25'd28)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1+25'd30)) + 25'd1292;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1-25'd30)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd3: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1+25'd24)) + 25'd1372;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1-25'd24)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd4: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd362) * ken_img_size + ((hcount - location_1+25'd30)+ 25'd1446);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1-25'd30)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				endcase
				end
			6'b1010: begin // go right
				case (state_ken)
				6'd0: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1)+ 16'd202) ;
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd250);
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd298);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc + 16'd14) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd348);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd398);
						player_1_region = ((hcount <= (16'd48 + location_1)) && (hcount >= (location_1)))&& ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd5: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1)) + state_ken * 25'd50;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount > (location_1 + 16'd4)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				endcase
			end
			6'b1011: begin // go left
				case (state_ken)
				6'd0: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1)+ 16'd398) ;
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd348);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd290);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc + 16'd14) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd240);
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) *  ken_img_size + ((hcount - location_1) + 16'd202);
						player_1_region = ((hcount <= (16'd48 + location_1)) && (hcount >= (location_1)))&& ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd5: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1)) + state_ken * 25'd50;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount > (location_1 + 16'd4)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				endcase
			end
		endcase
		case (move_ryu)
			6'b0: begin//idle_ryu
				pixel_addr_palyer_2 = ryu_address +(vcount - character_y_loc) *ryu_img_size + (16'd50 -(hcount - location_2)) + state_ryu * 25'd50;
				player_2_region = (hcount < (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
			end
			6'b1: begin //punch
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc) + 25'd116) *  ryu_img_size + (25'd48 - (hcount - location_2 )) + 25'd168;;
						player_2_region = (hcount < (16'd48 + location_2)) && (hcount >= (location_2-25'd4)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)  + 25'd116) *  ryu_img_size + (25'd54 - (hcount - location_2)) + 25'd216;
						player_2_region = (hcount < (16'd54 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)  + 25'd116) *  ryu_img_size + (25'd78 - (hcount - location_2)) + 25'd270;
						player_2_region = (hcount < (16'd78 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)  + 25'd116) *  ryu_img_size + (25'd60- (hcount - location_2)) + 25'd348;
						player_2_region = (hcount < (16'd60 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)  + 25'd116) *  ryu_img_size + (25'd50 - (hcount - location_2)) + 25'd408;
						player_2_region = (hcount < (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				endcase
			end
			6'b10: begin //crouch
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2)) + 25'd1110 ;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd20) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2) + 16'd48) + 25'd1110;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd20) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2)) + 25'd1110;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd20) && (vcount < character_y_loc_2));
						end	
				endcase
			end
			6'b11: begin // jump
				case (state_ryu)
				6'd0: begin 
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc + ryu_height)) *  ryu_img_size + (25'd50 - (hcount - location_2)+ 25'd450)  ;
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height) && (vcount < character_y_loc_2 - ryu_height));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc+ ryu_height)) *  ryu_img_size + (25'd40 - (hcount - location_2)+ 25'd450) + 25'd50;
						player_2_region = (hcount <= (16'd40 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height) && (vcount < character_y_loc_2 - ryu_height));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc+ ryu_height)) *  ryu_img_size + (25'd38 - (hcount - location_2)+ 25'd450) + 25'd90;
						player_2_region = (hcount <= (16'd38 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height + 16'd14) && (vcount < character_y_loc_2 - ryu_height));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc+ ryu_height)) *  ryu_img_size + (25'd36 - (hcount - location_2)+ 25'd450) + 25'd128;
						player_2_region = (hcount <= (16'd36 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height + 16'd14) && (vcount < character_y_loc_2 - ryu_height));
						end
				6'd4: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc+ ryu_height)) *  ryu_img_size + (25'd38 - (hcount - location_2)+ 25'd450) + 25'd164;
						player_2_region = (hcount <= (16'd38 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height) && (vcount < character_y_loc_2 - ryu_height));
						end
				6'd5: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc+ ryu_height)) *  ryu_img_size + (25'd40 - (hcount - location_2)+ 25'd450) + 25'd200 ;
						player_2_region = (hcount <= (16'd40 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height) && (vcount < character_y_loc_2 - ryu_height));
						end
				6'd6: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc+ ryu_height)) *  ryu_img_size + (25'd50 - (hcount - location_2)+ 25'd450) + 25'd240;
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - ryu_height) && (vcount < character_y_loc_2 - ryu_height));
						end
				endcase
			end
			6'b100: begin //hit
				case (state_ryu)
				6'd0: begin 
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc +25'd468)) * ryu_img_size + (16'd50-(hcount - location_2));
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd468) * ryu_img_size + (16'd52-(hcount - location_2)) + 25'd50;
						player_2_region = (hcount <= (16'd52 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd468) * ryu_img_size + (16'd58-(hcount - location_2)) + 25'd102;
						player_2_region = (hcount <= (16'd58 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd3: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd468) * ryu_img_size + (16'd48-(hcount - location_2)) + 25'd160;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				6'd4: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd468) * ryu_img_size + (16'd50-(hcount - location_2));
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end		
				endcase
			end
			6'b101: begin //kick
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd246) *  ryu_img_size + (25'd58 - (hcount - location_2)) ;
						player_2_region = (hcount <= (16'd58 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd246) *  ryu_img_size + (25'd74 - (hcount - location_2) + 16'd58);
						player_2_region = (hcount <= (16'd74 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd246) *  ryu_img_size + (25'd54 - (hcount - location_2) + 16'd132);
						player_2_region = (hcount <= (16'd54 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2));
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end						
				endcase
			end
			6'b111: begin // special
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc - 25'd16)+ 25'd366) *  ryu_img_size + (25'd58 - (hcount - location_2)) ;
						player_2_region = (hcount <= (16'd58 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc  - 25'd16)+ 25'd366) *  ryu_img_size + (25'd70 - (hcount - location_2) + 16'd58);
						player_2_region = (hcount <= (16'd70 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc - 25'd16)+ 25'd366) *  ryu_img_size + (25'd72 - (hcount - location_2) + 16'd128);
						player_2_region = (hcount <= (16'd72 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc - 25'd16)+ 25'd366) *  ryu_img_size + (25'd96 - (hcount - location_2) + 16'd200);
						player_2_region = (hcount <= (16'd96 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						if (hcount < (location_2) &&  hcount >= (location_2-25'd44) && (location_2 - location_1 != 25'd50)) begin
							pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc - 25'd16)+ 25'd366) *  ryu_img_size + (25'd44 - (hcount - location_2) + 16'd374);	
						end
						else
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc - 25'd16)+ 25'd366) *  ryu_img_size + (25'd76 - (hcount - location_2) + 16'd296);
						player_2_region = (((hcount <= (16'd76 + location_2)) && (hcount >= (location_2))) || ((location_2 - location_1 == 25'd50) ? 1'b0 : (hcount < (location_2) &&  hcount >= (location_2-25'd44))))
							&& ((vcount >= character_y_loc + 25'd16) && (vcount < character_y_loc_2));
						end
				6'd5: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2));
						player_2_region = (((hcount <= (16'd50 + location_2) ) && (hcount >= (location_2)))) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				endcase
			end
			6'b1000: begin //victory
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd594) *  ryu_img_size + (25'd52 - (hcount - location_2)) ;
						player_2_region = (hcount <= (16'd52 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd594) *  ryu_img_size + (25'd52 - (hcount - location_2) + 16'd52);
						player_2_region = (hcount <= (16'd52 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd594) *  ryu_img_size + (25'd52 - (hcount - location_2) + 16'd104);
						player_2_region = (hcount <= (16'd52 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc - 25'd10) && (vcount < character_y_loc_2));
						end
				endcase
			end
			6'b1001: begin // knockout
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd468) *  ryu_img_size + (25'd56 - (hcount - location_2)+ 16'd1160) ;
						player_2_region = (hcount <= (16'd56 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd468) *  ryu_img_size + (25'd76 - (hcount - location_2) + 16'd1216);
						player_2_region = (hcount <= (16'd76 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd468) *  ryu_img_size + (25'd78 - (hcount - location_2) + 16'd1292);
						player_2_region = (hcount <= (16'd78 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd468) *  ryu_img_size + (25'd76 - (hcount - location_2) + 16'd1370);
						player_2_region = (hcount <= (16'd76 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)+ 25'd468) *  ryu_img_size + (25'd80 - (hcount - location_2) + 16'd1446);
						player_2_region = ((hcount <= (16'd80 + location_2)) && (hcount >= (location_2)))&& ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				
				endcase
			end
			6'b1010: begin // go right
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2)+ 16'd202) ;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2) + 16'd250);
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2) + 16'd298);
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 16'd14) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2) + 16'd348);
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2) + 16'd398);
						player_2_region = ((hcount <= (16'd48 + location_2)) && (hcount >= (location_2)))&& ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd5: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2));
						player_2_region = (((hcount <= (16'd50 + location_2) ) && (hcount >= (location_2)))) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				endcase
			end
			6'b1011: begin // go left
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2)+ 16'd398) ;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2) + 16'd348);
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2) + 16'd290);
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc + 16'd14) && (vcount < character_y_loc_2));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2) + 16'd240);
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd4: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2) + 16'd202);
						player_2_region = ((hcount <= (16'd48 + location_2)) && (hcount >= (location_2)))&& ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				6'd5: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd50 - (hcount - location_2));
						player_2_region = (((hcount <= (16'd50 + location_2) ) && (hcount >= (location_2)))) && ((vcount >= character_y_loc) && (vcount < character_y_loc_2));
						end
				endcase
			end
			endcase
			
	end
		//***********************************************************************************************
		// Begin clock division for generating 25 MHz clock signal since VGA operates at 25 MHz frequency
		// Don't modify
		parameter N = 2;	// Parameter for clock division
		reg clk_25Mhz;
		reg [N-1:0] count;
		always @ (posedge clk) begin
			count <= count + 1'b1;
			clk_25Mhz <= count[N-1];
		end
		// End clock division
		
		reg clk_8Hz; // For moving images
		reg [23:0] count_8Hz;
		always @ (posedge clk) begin
			count_8Hz <= count_8Hz + 24'b1;
			clk_8Hz <= count_8Hz[23];
		end
		// End clock division
		//************************************************************************************************
		// LOGIC TO CYCLING BETWEEN DIFFERENT STATES IN A PARTICULAR MOVE 
		always @ (posedge clk_8Hz)
			begin
			   if (~start) begin
						location_1 <= 25'd0;
						location_2 <= 25'd550;
				end
				else begin
					case (move_ken)
					6'b0: //idle
						if (state_ken >= 6'b11) state_ken <= 6'b0;
						else state_ken <= state_ken + 6'b1;
					6'b1: // punch
						if (state_ken >= 6'b101) state_ken <= 6'b0;
						else state_ken <= state_ken + 6'b1;
					6'b10: // crouch
						if (state_ken >= 6'b10) state_ken <= 6'b0;
						else state_ken <= state_ken + 6'b1;
					6'b11: // jump
						if (state_ken >= 6'b110) begin
							state_ken <= 6'b0;
							ken_height <= 8'b0;
						end
						else begin
							state_ken <= state_ken + 6'b1;	
							case (state_ken)
							6'b0: begin ken_height <= 8'd20; end  // update the height in a jump move
							6'b1: begin ken_height <= 8'd40; end
							6'b10: begin ken_height <= 8'd60; end
							6'b11: begin ken_height <= 8'd40; end
							6'b100: begin ken_height <= 8'd20; end
							6'b101: begin ken_height <= 8'd0; end
							endcase
						end
					6'b100: // hit
						if (state_ken >= 6'b100) state_ken <= 6'b0;
						else state_ken <= state_ken + 6'b1;
					6'b101: // kick
						if (state_ken >= 6'b11) state_ken <= 6'b0;
						else state_ken <= state_ken + 6'b1;
					6'b111: // special
						if (state_ken >= 6'b110) begin
							state_ken <= 6'b0;
							ken_height <= 8'b0;
						end
						else begin
							state_ken <= state_ken + 6'b1;	
							case (state_ken)
							6'b0: begin ken_height <= 8'd0; end
							6'b1: begin ken_height <= 8'd0; end
							6'b10: begin ken_height <= 8'd10; end
							6'b11: begin ken_height <= 8'd20; end
							6'b100: begin ken_height <= 8'd0; end
							6'b101: begin ken_height <= 8'd0; end
							endcase
						end
					6'b1001: // knockout
						if (state_ken < 6'b100) state_ken <= state_ken + 6'b1;
					6'b1000: // victory
						if (state_ken >= 6'b10) state_ken <= 6'b0;
						else state_ken <= state_ken + 6'b1;	
					6'b1010: begin// right
						location_1 <= ((location_1 + 25'd50)< location_2) ? (location_1 + 25'd10) : location_1;
						if (state_ken <= 6'd4) state_ken <= state_ken + 6'b1;
						else state_ken <= 6'b0;
						end
					6'b1011: begin // left
						location_1 <= ((location_1)>= 25'd10) ? (location_1 - 25'd10): location_1;
						if (state_ken <= 6'd4) state_ken <= state_ken + 6'b1;
						else state_ken <= 6'b0;	
						end
					endcase
					case (move_ryu)
					6'b0: //idle
						if (state_ryu >= 6'b11) state_ryu <= 6'b0;
						else state_ryu <= state_ryu + 6'b1;
					6'b1: // punch
						if (state_ryu >= 6'b101) state_ryu <= 6'b0;
						else state_ryu <= state_ryu + 6'b1;
					6'b10: // crouch
						if (state_ryu >= 6'b10) state_ryu <= 6'b0;
						else state_ryu <= state_ryu + 6'b1;
					6'b11: // jump
						if (state_ryu >= 6'b110) begin
							state_ryu <= 6'b0;
							ryu_height <= 8'b0;
						end
						else begin
							state_ryu <= state_ryu + 6'b1;	
							case (state_ryu)
							6'b0: begin ryu_height <= 8'd20; end
							6'b1: begin ryu_height <= 8'd40; end
							6'b10: begin ryu_height <= 8'd60; end
							6'b11: begin ryu_height <= 8'd40; end
							6'b100: begin ryu_height <= 8'd20; end
							6'b101: begin ryu_height <= 8'd0; end
							endcase
						end
					6'b100: // hit
						if (state_ryu >= 6'b100) state_ryu <= 6'b0;
						else state_ryu <= state_ryu + 6'b1;	
					6'b101: // kick
						if (state_ryu >= 6'b11) state_ryu <= 6'b0;
						else state_ryu <= state_ryu + 6'b1;	
					6'b111: // special
						if (state_ryu >= 6'b101) begin
							state_ryu <= 6'b0;
						end
						else begin
							state_ryu <= state_ryu + 6'b1;	
						end
					6'b1000: // victory
						if (state_ryu >= 6'b10) state_ryu <= 6'b0;
						else state_ryu <= state_ryu + 6'b1;
					6'b1001: // knockout
						if (state_ryu < 6'b100) state_ryu <= state_ryu + 6'b1;
					6'b1010: begin// right
						location_2 <= (location_2 < 25'd550) ? (location_2 + 25'd10) : location_2;
						if (state_ryu <= 6'd4) state_ryu <= state_ryu + 6'b1;
						else state_ryu <= 6'b0;
						end
					6'b1011: begin // left
						location_2 <= ((location_1 + 25'd50 )< location_2) ? (location_2 - 25'd10): location_2;
						if (state_ryu <= 6'd4) state_ryu <= state_ryu + 6'b1;
						else state_ryu <= 6'b0;	
						end
					endcase
					
					////// Special Ryu - Currently does not work
					if (move_ryu == 6'd111 && state_ryu == 6'd4 && (location_2 - location_1) > 25'd50) begin
						ryu_special_location <= location_2 - 16'd50;
					end
					else if (ryu_special_location > (location_1 + 16'd50)) begin
						ryu_special_location <= ryu_special_location - 16'd50;
					end
					else begin ryu_special_location <= 16'd0; end
					/////
				end			
		end
					
		////////////////////////////////////////////////
		// CURRENT LOCATION OF 2 CHARACTER
		reg [10:0] location_1;  // 4 bit for the whole horizontal line (480 pixel), each jump is 50px
		initial location_1 = 10'd0;
	
		reg [10:0] location_2;  // 4 bit for the whole horizontal line (480 pixel), each jump is 50px
		initial location_2 = 10'd550;
		////////////////////////////////////////////////////////////////////
		// DETECT THE MOVES USING INPUT JAMMA SIGNALS AND CURRENT REGISTERS
		always @ (posedge clk) begin
			if(~start)begin
				move_ken<=6'b0;
			end
			else if(health1==10'd0)begin
					move_ken<=10'b1001;//knock_out
				end
			else if(health2==10'd0)	begin
					move_ken<=10'b1000;//victory
				end
			else if (start) begin
			if (move_right_1) begin
				move_ken <= 6'b1010; // go right
				end
			else if (move_left_1) begin
				move_ken <= 6'b1011; // go left
				end
			else if (((move_ryu == 6'b1 && move_ken != 6'b10) || move_ryu == 6'b101 || move_ryu == 6'b111) && (location_2 - location_1 == 10'd50) && ken_height==8'd0) begin
				move_ken <= 6'b100; // got hit!
			end
			else if (punch_1) begin
				if (move_ken != 6'b101) move_ken <= 6'b1; //punch move
				else move_ken <= 6'b111; // special!
				end	
			else if (down_1) begin
				move_ken <= 6'b10; // crouch
				end
			else if (up_1) begin
				move_ken <= 6'b11; // jump
				end
			else if (kick_1) begin
				if (move_ken != 6'b1) move_ken <= 6'b101; //kick
				else move_ken <= 6'b111; // special!
				end			
			else if (move_ken == 6'b1 && state_ken == 6'b101) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b10 && state_ken == 6'b10) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b101 && state_ken == 6'b11) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b11 && state_ken == 6'b110) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b100 && state_ken == 6'b100) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b111 && state_ken == 6'b110) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b1010 && state_ken == 6'd4) begin
				move_ken <= 6'b0;
				end
			else if (move_ken == 6'b1011 && state_ken == 6'd4) begin
				move_ken <= 6'b0;
				end
			end
		end
		always @ (posedge clk)begin
			if(~start)begin
				move_ryu<=6'b0;
			end 
			else if(health2==10'd0)begin
					move_ryu<=10'b1001;//knock_out
				end
			else if(health1==10'd0)	begin
					move_ryu<=10'b1000;//victory
				end
			else if (start) begin
			if (move_right_2) begin
				move_ryu <= 6'b1010; // go right
				end
			else if (move_left_2) begin
				move_ryu <= 6'b1011; // go left
				end
			else if (((((move_ken == 6'b1 && move_ryu != 6'b10) || move_ken == 6'b101)  && ryu_height==8'd0) || move_ken == 6'b111)&& (location_2 - location_1 == 10'd50)) begin
				if (move_ryu != 6'b100) move_ryu <= 6'b100; // got hit! if Ken is using Shuryuken, Ryu will get hit no matter how high he is
			end
			else if (punch_2) begin
				if (move_ryu != 6'b101) move_ryu <= 6'b1; //punch move
				else move_ryu <= 6'b111; // special!
				end	
			else if (kick_2) begin
				if (move_ryu != 6'b1) move_ryu <= 6'b101; //kick
				else move_ryu <= 6'b111; // special!
				end	
			else if (down_2) begin
				move_ryu <= 6'b10; // crouch
				end
			else if (up_2) begin
				move_ryu <= 6'b11; // jump
				end
			else if (move_ryu == 6'b1 && state_ryu == 6'b101) begin //back to idle
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b101 && state_ryu == 6'b11) begin
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b10 && state_ryu == 6'b10) begin
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b11 && state_ryu == 6'b110) begin
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b100 && state_ryu == 6'b100) begin
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b111 && state_ryu == 6'b101) begin
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b1010 && state_ryu == 6'd5) begin
				move_ryu <= 6'b0;
				end
			else if (move_ryu == 6'b1011 && state_ryu == 6'd5) begin
				move_ryu <= 6'b0;
				end
			end
		end
		/////////////HEALTH BAR/////////////////////
		always @(posedge clk_8Hz)begin
			if(~start)begin
				health1<= 10'd310;
			end 
			else if (move_ken == 6'b100 && state_ken == 6'b1 && health1>0) begin
				if (move_ryu == 6'b111) begin
					health1  <= (health1 < 10'd30) ? 10'd0: health1 - 10'd30;
				end else begin
					health1  <= health1 - 10'd10;
				end
			end
		end
		
		always @(posedge clk_8Hz) begin//right
			if(~start)begin
				health2<= 10'd310;
			end 
			else if(move_ryu == 6'b100 && state_ryu == 6'b1 && health2 >0) begin
				if (move_ken == 6'b111) begin
					health2  <= (health2 < 10'd30) ? 10'd0: health2 - 10'd30;
				end else begin
					health2  <= health2 - 10'd10;
				end
			end
		end
		/////////////////////////////////////////////
		always @ (posedge clk) begin
			if (bar1 | bar2) begin	// if you are within the valid region
				R_bar <= 3'b111;	//R_control;
				G_bar <= 3'b111;	//G_control;
				B_bar <= 2'b00;	//B_control;
			end
			else begin	// if you are outside the valid region
				 R_bar <= 0;
				 G_bar <= 0;
				 B_bar <= 0;
			end		
		end
		///////////////////////////////////////////////////////////////
		
		//************************************************************
		// Call VGA controller - Don't modify
		vga_controller_640_60 vc(
			.rst(rst), 
			.pixel_clk(clk_25Mhz), 
			.HS(HS), 
			.VS(VS), 
			.hcounter(hcount), 
			.vcounter(vcount), 
			.blank(blank));
		//*************************************************************
		// MAKING KO IMAGE AND STREET FIGHTER LOGO
		assign ko_region = clk_8Hz && (health1 == 10'd0 || health2 == 10'd0) && (hcount >= 11'd226 && (hcount < 11'd412) && (vcount >= 11'd100 && vcount < 11'd186)) && (pixel_ko_val != 8'h25);
		wire [15:0] pixel_ko_addr = (vcount - 11'd100) * 16'd186 + (hcount - 11'd226);//352,160
		wire [7:0] pixel_ko_val;
		ko ko(clk, pixel_ko_addr, pixel_ko_val);
		assign logo_region = (hcount >= 11'd180 && (hcount < 11'd459) && (vcount >= 11'd175 && vcount < 11'd315));
		wire [15:0] pixel_logo_addr = (vcount - 11'd175) * 16'd279 + (hcount - 11'd180);//352,160
		wire [7:0] pixel_logo_val;
		logo logo(clk, pixel_logo_addr, pixel_logo_val);
		//**************************************************************
		// Muxing different region of vga output to appropriate sources
		assign R = ((player_1_region || player_2_region || ryu_special_region) && pixel_val_8bit != 8'h92  && pixel_val_8bit != 8'h9a) ? pixel_val_8bit[7:5] : ((bar1||bar2) ? R_bar: ((logo_region && ~start)? pixel_logo_val[7:5]: (ko_region ? pixel_ko_val[7:5]: 3'b0)));
		assign G = ((player_1_region || player_2_region || ryu_special_region) && pixel_val_8bit != 8'h92  && pixel_val_8bit != 8'h9a) ? pixel_val_8bit[4:2] : ((bar1||bar2) ? G_bar: ((logo_region && ~start)? pixel_logo_val[4:2]: (ko_region ? pixel_ko_val[4:2]: 3'b0)));
		assign B = ((player_1_region || player_2_region || ryu_special_region) && pixel_val_8bit != 8'h92  && pixel_val_8bit != 8'h9a) ? pixel_val_8bit[1:0] : ((bar1||bar2) ? B_bar: ((logo_region && ~start)? pixel_logo_val[1:0]: (ko_region ? pixel_ko_val[1:0]: 2'b0)));
		
endmodule
