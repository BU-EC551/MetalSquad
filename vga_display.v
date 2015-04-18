`timescale 1ns / 1ps

 module vga_display(rst, clk, R, G, B, HS, VS, pixel_val, move_right_1, move_left_1, ram_addr, punch_1, down_1, up_1, 
							 move_right_2, move_left_2, punch_2, down_2, up_2);
	
	parameter ryu_address = 25'd1400000;
	parameter one_0_five=25'd105;
	parameter ken_img_size=25'd1597;
	parameter ryu_img_size=25'd1541;
	parameter character_y_loc = 25'd210;
	
	input rst;	// Global reset to reset display
	input clk;	// 100MHz clk
	input [15:0] pixel_val;
	
	input move_right_1;
	input move_left_1;
	input punch_1;
	input down_1;
	input up_1;
	
	input move_right_2;
	input move_left_2;
	input punch_2;
	input down_2;
	input up_2;
	
	output [25:0] ram_addr;
	// Color outputs to show on display (current pixel)
	output [2:0] R, G;
	output [1:0] B;
	// Synchronization signals
	output HS;
	output VS;
	
	// Controls:
	wire [10:0] hcount, vcount;	// coordinates for the current pixel
	wire blank;	// signal to indicate the current coordinate is blank
	//reg[6:0]figure; // the figure you want to display
	wire background_region; // 
	wire [7:0] pixel_val_8bit;
	reg player_1_region;
	reg player_2_region;
	
	// picture for output 'ken_idle'
	//wire [7:0] pixel_val;
	wire [7:0] pixel_val_ken;
	reg [26:0] pixel_addr_palyer_1;//24 original
	wire [15:0] pixel_addr_ken;
	reg [5:0] state_ken; //
	reg [5:0] move_ken;
	initial state_ken = 6'b0;
	initial move_ken = 6'b0;
	
	wire [7:0] pixel_val_ryu;
	reg [26:0] pixel_addr_palyer_2;
	wire [15:0] pixel_addr_ryu;
	reg [5:0] state_ryu; //
	reg [5:0] move_ryu;
	initial state_ryu = 6'b0;
	initial move_ryu = 6'b0;
	
	reg move_done_1;
	initial move_done_1 = 1'b0;
	reg move_done_2;
	initial move_done_2 = 1'b0;
	
	assign pixel_val_8bit = ((hcount[0] && vcount[0]) || (~hcount[0] && ~vcount[0])) ?  pixel_val[15:8] : pixel_val[7:0] ; // for now, need to pick between 2 half
	assign ram_addr = player_1_region ?(pixel_addr_palyer_1 [26:1]):(pixel_addr_palyer_2 [26:1]); // need to mux between difference source later
	
	always @ (vcount, hcount, state_ken, move_ken, move_ryu, state_ryu)
	begin
		case (move_ken)
			6'b0: begin//idle_ken
				pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1)) + state_ken * 25'd50;
				player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
			end
			6'b1: begin //punch
				//pixel_addr_stage = (vcount % one_0_five + 25'd116) * ken_img_size + ((hcount - location_1 * 16'd50) % 16'd50 + 25'd166);
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd50;
						player_1_region = (hcount <= (16'd54 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd104;
						//player_1_region = (hcount < 16'd75) && (vcount < 16'd105);
						player_1_region = (hcount <= (16'd76 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd3: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd180;
						//player_1_region = (hcount < 16'd60) && (vcount < 16'd105);
						player_1_region = (hcount <= (16'd60 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd4: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc) + 25'd116) * ken_img_size + ((hcount - location_1) + 25'd166) + 25'd240;
						//player_1_region = (hcount < 16'd50) && (vcount < 16'd105);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315)); // (vcount < 16'd105) && 
						end
				endcase
			end
			
			6'b10: begin //crouch
				//pixel_addr_stage = (vcount % one_0_five + 25'd116) * ken_img_size + ((hcount - location_1 * 16'd50) % 16'd50 + 25'd166);
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)) * ken_img_size + ((hcount - location_1) + 25'd1110);
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd1110) + 25'd48;
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd1110);
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end		
				endcase
			end
			6'b11: begin // jump
				//pixel_addr_stage = (vcount % one_0_five + 25'd116) * ken_img_size + ((hcount - location_1 * 16'd50) % 16'd50 + 25'd166);
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450);
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd50;
						player_1_region = (hcount <= (16'd40 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd90;
						player_1_region = (hcount <= (16'd38 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd3: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd128;
						player_1_region = (hcount <= (16'd36 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd4: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd164;
						player_1_region = (hcount <= (16'd38 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315)); // (vcount < 16'd105) && 
						end
				6'd5: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd200;
						player_1_region = (hcount <= (16'd40 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315)); // (vcount < 16'd105) && 
						end
				6'd6: begin
						pixel_addr_palyer_1 = (vcount - character_y_loc) * ken_img_size + ((hcount - location_1) + 25'd450) + 25'd240;
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315)); // (vcount < 16'd105) && 
						end
				endcase
			end
			6'b100: begin //hit
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc) +25'd760) * ken_img_size + ((hcount - location_1));
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd760) * ken_img_size + ((hcount - location_1)) + 25'd50;
						player_1_region = (hcount <= (16'd52 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd760) * ken_img_size + ((hcount - location_1)) + 25'd102;
						player_1_region = (hcount <= (16'd58 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end		
				6'd3: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd760) * ken_img_size + ((hcount - location_1)) + 25'd160;
						player_1_region = (hcount <= (16'd48 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end		
				6'd4: begin 
						pixel_addr_palyer_1 = ((vcount - character_y_loc)+25'd760) * ken_img_size + ((hcount - location_1));
						player_1_region = (hcount <= (16'd50 + location_1)) && (hcount >= (location_1)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				endcase
			end
		endcase
		case (move_ryu)
			6'b0: begin//idle_ken
				pixel_addr_palyer_2 = ryu_address +(vcount - character_y_loc) *ryu_img_size + (16'd50 -(hcount - location_2)) + state_ryu * 25'd50;
				player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
			end
			6'b1: begin //punch
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc) + 25'd116) *  ryu_img_size + (25'd48 - (hcount - location_2 )) ;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)  + 25'd116) *  ryu_img_size + (25'd66 - (hcount - location_2)) + 25'd48;
						player_2_region = (hcount <= (16'd66 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)  + 25'd116) *  ryu_img_size + (25'd50 - (hcount - location_2)) + 25'd114;
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				endcase
			end
			6'b10: begin //crouch
				case (state_ryu)
				6'd0: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2)) + 25'd1110 ;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2) + 16'd48) + 25'd1110;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc)) *  ryu_img_size + (25'd48 - (hcount - location_2)) + 25'd1110;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end	
				endcase
			end
			/*6'b11: begin // jump
				case (state_ken)
				6'd0: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd50 - (hcount - location_2 * 16'd50)% 16'd50 + 25'd450)  ;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd40 - (hcount - location_2 * 16'd50)% 16'd40 + 25'd450) + 25'd50;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd38 - (hcount - location_2 * 16'd50)% 16'd38+ 25'd450) + 25'd90;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd3: begin
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd36 - (hcount - location_2 * 16'd50)% 16'd36+ 25'd450) + 25'd128;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd4: begin
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd38 - (hcount - location_2 * 16'd50)% 16'd38+ 25'd450) + 25'd164;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd5: begin
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd40 - (hcount - location_2 * 16'd50)% 16'd40+ 25'd450) + 25'd200 ;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd6: begin
						pixel_addr_palyer_2 = ryu_address+(vcount % one_0_five) *  ryu_img_size + (25'd50 - (hcount - location_2 * 16'd50)% 16'd50+ 25'd450) + 25'd240;
						player_2_region = (hcount <= (16'd48 + location_2 * 16'd50)) && (hcount >= (location_2 * 16'd50)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				endcase
			end*/
			6'b100: begin //hit
				case (state_ryu)
				6'd0: begin 
						pixel_addr_palyer_2 = ryu_address+((vcount - character_y_loc +25'd725)) * ken_img_size + ((hcount - location_2));
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd1: begin
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd725) * ken_img_size + ((hcount - location_2)) + 25'd50;
						player_2_region = (hcount <= (16'd52 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end
				6'd2: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd725) * ken_img_size + ((hcount - location_2)) + 25'd102;
						player_2_region = (hcount <= (16'd58 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end		
				6'd3: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd725) * ken_img_size + ((hcount - location_2)) + 25'd160;
						player_2_region = (hcount <= (16'd48 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
						end		
				6'd4: begin 
						pixel_addr_palyer_2 = ryu_address+(vcount - character_y_loc+25'd725) * ken_img_size + ((hcount - location_2));
						player_2_region = (hcount <= (16'd50 + location_2)) && (hcount >= (location_2)) && ((vcount >= character_y_loc) && (vcount < 16'd315));
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
	
	reg clk_8Hz;
	reg [23:0] count_8Hz;
	always @ (posedge clk) begin
		count_8Hz <= count_8Hz + 24'b1;
		clk_8Hz <= count_8Hz[23];
	end
	// End clock division
	//************************************************************************************************
	
	always @ (posedge clk_8Hz)
	begin
		case (move_ken)
		6'b0: //idle
			if (state_ken >= 6'b11) state_ken <= 6'b0;
			else state_ken <= state_ken + 6'b1;
		6'b1: // punch
			if (state_ken >= 6'b100) state_ken <= 6'b0;
			else state_ken <= state_ken + 6'b1;
		6'b10: // crouch
			if (state_ken >= 6'b10) state_ken <= 6'b0;
			else state_ken <= state_ken + 6'b1;
		6'b11: // jump
			if (state_ken >= 6'b110) state_ken <= 6'b0;
			else state_ken <= state_ken + 6'b1;	
		6'b100: // hit
			if (state_ken >= 6'b100) state_ken <= 6'b0;
			else state_ken <= state_ken + 6'b1;	
		endcase
		case (move_ryu)
		6'b0: //idle
			if (state_ryu >= 6'b11) state_ryu <= 6'b0;
			else state_ryu <= state_ryu + 6'b1;
		6'b1: // punch
			if (state_ryu >= 6'b11) state_ryu <= 6'b0;
			else state_ryu <= state_ryu + 6'b1;
		6'b10: // crouch
			if (state_ryu >= 6'b10) state_ryu <= 6'b0;
			else state_ryu <= state_ryu + 6'b1;
		6'b11: // jump
			if (state_ryu >= 6'b110) state_ryu <= 6'b0;
			else state_ryu <= state_ryu + 6'b1;	
		6'b100: // hit
			if (state_ryu >= 6'b100) state_ryu <= 6'b0;
			else state_ryu <= state_ryu + 6'b1;	
		endcase
	end
	
	
	////////////////////////////////////////////////
	
	reg [10:0] location_1_right; // may cause some issue if both reach the maximum value
	reg [10:0] location_1_left;
	wire [10:0] location_1;  // 4 bit for the whole horizontal line (480 pixel), each jump is 50px
	assign location_1 = location_1_right - location_1_left;
	initial location_1_right = 10'b0;
	initial location_1_left = 10'b0;
	
	reg [10:0] location_2_right; // may cause some issue if both reach the maximum value
	reg [10:0] location_2_left;
	wire [10:0] location_2;  // 4 bit for the whole horizontal line (480 pixel), each jump is 50px
	assign location_2 = location_2_right - location_2_left;
	initial location_2_right = 10'd150;
	initial location_2_left = 10'd0;
	//initial location_1 = 4'b0;
	
	always @ (posedge move_right_1) begin
		location_1_right <= ((location_1 + 10'd50) < location_2) ? location_1_right + 10'd50 : location_1_right;
	end
	
	always @ (posedge move_left_1) begin
		location_1_left <= (location_1_left < location_1_right) ? (location_1_left + 10'd50) : location_1_left;
	end
	
	always @ (posedge move_right_2) begin
		location_2_right <= location_2_right + 10'd50;
	end
	
	always @ (posedge move_left_2) begin
		location_2_left <= (location_2_left < location_2_right && (location_1 + 10'd50) < location_2) ? (location_2_left + 10'd50) : location_2_left;
	end
	
	always @ (posedge clk) begin
		if (move_ryu == 6'b1 && (location_2 - location_1 == 10'd50)) begin
			move_ken <= 6'b100; // got hit!
		end
		else if (punch_1) begin
			move_ken <= 6'b1; //punch move
			//move_done_1 <= 1'b0;
			end	
		else if (down_1) begin
			move_ken <= 6'b10; // crouch
			end
		else if (up_1) begin
			move_ken <= 6'b11; // jump
			end
		else if (move_ken == 6'b1 && state_ken == 6'b100) begin
			move_ken <= 6'b0;
			end
		else if (move_ken == 6'b10 && state_ken == 6'b10) begin
			move_ken <= 6'b0;
			end
		else if (move_ken == 6'b11 && state_ken == 6'b110) begin
			move_ken <= 6'b0;
			end
		else if (move_ken == 6'b100 && state_ken == 6'b100) begin
			move_ken <= 6'b0;
			end
	end
	always @ (posedge clk) begin
		if (move_ken == 6'b1 && (location_2 - location_1 == 10'd50)) begin
			move_ryu <= 6'b100; // got hit!
		end
		else if (punch_2) begin
			move_ryu <= 6'b1; //punch move
			//move_done_1 <= 1'b0;
			end	
		else if (down_2) begin
			move_ryu <= 6'b10; // crouch
			end
		else if (up_2) begin
			move_ryu <= 6'b11; // jump
			end
		else if (move_ryu == 6'b1 && state_ryu == 6'b11) begin
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
	end
	
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
	// MAKING STAGE
	assign background_region = (hcount >= 11'd0 && (hcount < 11'd352) && (vcount >= 11'd0 && vcount < 11'd160));
	wire [15:0] pixel_background_addr = vcount * 16'd352 + hcount;
	wire [7:0] pixel_background_val;
	stage background(clk, pixel_background_addr, pixel_background_val);
	//**************************************************************
	//ken_idle ken_idle(clk, pixel_addr_ken, pixel_val_ken);
	
	assign R = ((player_1_region || player_2_region) && pixel_val_8bit != 8'h92  && pixel_val_8bit != 8'h9a) ? pixel_val_8bit[7:5] : (background_region ? pixel_background_val[7:5]:3'b0); 
	assign G = ((player_1_region || player_2_region) && pixel_val_8bit != 8'h92  && pixel_val_8bit != 8'h9a) ? pixel_val_8bit[4:2] : (background_region ? pixel_background_val[4:2]:3'b0);
	assign B = ((player_1_region || player_2_region) && pixel_val_8bit != 8'h92  && pixel_val_8bit != 8'h9a) ? pixel_val_8bit[1:0] : (background_region ? pixel_background_val[1:0]:2'b0);
	
	//assign R = background_region ? (player_1_region ? pixel_val_8bit [7:5] : 3'b0) : pixel_val_ken [7:5];
	//assign G = background_region ? (player_1_region ? pixel_val_player_1 [4:2] : 3'b0) : pixel_val_ken [4:2];
	//assign B = background_region ? (player_1_region ? pixel_val_player_1 [1:0] : 2'b0) : pixel_val_ken [1:0];
	//                              ( this logic is to determine the boundary)  353*215 
	
	//assign R = (hcount > 16'd50 || vcount > 16'd105 )? 3'd0: num_val [7:5];
	//assign G = (hcount > 16'd50 || vcount > 16'd105 )? 3'd0: num_val [4:2]; //test cellular ram
	//assign B = (hcount > 16'd50 || vcount > 16'd105 )? 2'd0: num_val [1:0];

endmodule
