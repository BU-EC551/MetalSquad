`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:27 03/06/2015 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer(clk, button, clean
    );
	input clk, button;
	output reg clean;
		
		parameter delay=300000;//300,000
		reg[21:0] delay_count;
		
		always@ (posedge clk)
		begin
			if(button==0)
				begin
					 clean<=0;
					 delay_count<=0;
				end
			else
			if(delay_count==delay)//&& button==1
				begin
					clean<=1;
					delay_count<=delay_count+1'b1;
				end	
			else
				if(delay_count>=22'b11_1101_0000_1001_0000_0000)//button==1 && delay_count~=delay
					begin
						 clean<=0;
						 delay_count<=22'b11_1101_0000_1001_0000_0000;
					end
				else
					begin
						 delay_count<=delay_count+1'b1;
						 clean<=0;
					end
		end
endmodule
