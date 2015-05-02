`timescale 1ns / 1ps
module Mem(WriteData,   // Input data into the memory
            MemData,     // Output data from the memory
            Address,     // Address of data to be read/written
            PC, 			//Program Counter
				MemWrite,    // When high, causes write to take place on posedge
				Instruction,
            Clk);        // Clock

parameter ADDRESS_WIDTH = 12;
parameter DATA_WIDTH = 16;

//-------------Input Ports-----------------------------
input [DATA_WIDTH-1:0]       WriteData;
input [DATA_WIDTH-1:0]       PC;
input [ADDRESS_WIDTH-1:0]    Address;
input MemWrite;
input Clk;

//-------------Output Ports----------------------------
output [DATA_WIDTH-1:0] MemData;
output reg [DATA_WIDTH-1:0] Instruction;

//-------------Wires-----------------------------------
//-------------Other-----------------------------------
reg [DATA_WIDTH-1:0] mem_contents [127:0]; // only for now, actually 4096
integer i;
//------------Code Starts Here-------------------------

initial Instruction = 16'b0;

assign MemData= mem_contents[Address[6:0]]; //only for now
always @(posedge Clk)
begin
	if(MemWrite)
	begin
		mem_contents[Address[6:0]]<= WriteData; // only for now
	end
end

always @(PC) //
begin
	case (PC)
		/*31: Instruction = 16'b1001_000000_000000; // mov r0, 0
		32: Instruction = 16'b1001_000001_001010; // mov r1, 10
		33: Instruction = 16'b1001_000010_010100; // mov r2, 20
		34: Instruction = 16'b1011_000001_000000; // mov [r1] r0
		35: Instruction = 16'h1000; // inc r0
		36: Instruction = 16'h1001; // inc r1
		37: Instruction = 16'h8042; // cmp r1, r2
		38: Instruction = 16'h3022; // jne 34
		39: Instruction = 16'h0000; // halt
		40: Instruction = 16'b1010_000011_000010; // mov r3, r2
		41: Instruction = 16'h0000; // halt
		42: Instruction = 16'b0101_000011_000010; // add r3, r2
		43: Instruction = 16'h0000; // halt
		44: Instruction = 16'b0110_000011_000001; // sub r3, r1
		45: Instruction = 16'h0000; // halt
		46: Instruction = 16'b0111_000011_000001; // xor r3, r1
		47: Instruction = 16'h0000; // halt
		48: Instruction = 16'b1100_000100_000000; // mov r4, [r0]
		49: Instruction = 16'h0000; // halt
		50: Instruction = 16'b0110_000000_000001; // sub r0, r1
		51: Instruction = 16'h0000; // halt
		52: Instruction = 16'b1001_000011_001111; // mov r3, 15
		53: Instruction = 16'h0000; // halt
		54: Instruction = 16'b1100_000000_000011; // sadd r0, r3
		55: Instruction = 16'h0000; // halt*/
		31: Instruction = 16'h902D; // mov r0, 0
		32: Instruction = 16'h0000;
		33: Instruction = 16'h5000; // mov r1, 10
		34: Instruction = 16'h0000;
		35: Instruction = 16'h5000; // mov r2, 20
		36: Instruction = 16'h0000; // mov [r1] r0
		37: Instruction = 16'h9040; // inc r0
		38: Instruction = 16'h9085; // inc r1
		39: Instruction = 16'h90C1; // cmp r1, r2
		40: Instruction = 16'h9100; // jne 34
		41: Instruction = 16'h9140; // halt
		42: Instruction = 16'hB005; // mov r3, r2
		43: Instruction = 16'h1000; // halt
		44: Instruction = 16'hA143; // add r3, r2
		45: Instruction = 16'h5144; // halt
		46: Instruction = 16'hA0C4; // sub r3, r1
		47: Instruction = 16'hA105; // halt
		48: Instruction = 16'h1001; // xor r3, r1
		49: Instruction = 16'h8042; // halt
		50: Instruction = 16'h3028; // mov r4, [r0]
		51: Instruction = 16'h0000; // halt
	endcase
end
endmodule
