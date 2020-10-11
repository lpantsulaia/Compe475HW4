`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:31 10/11/2020 
// Design Name: 
// Module Name:    HW4LPCode 
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
module HW4LPCode(
		//input clock,
		input wire[31:0] instruction,
		output reg[2:0] instr_type,
		output reg[3:0] data_instr_type
    );

	 always @(*) begin
	 if(instruction[27] && !instruction[26]) begin
		 instr_type=2'b11;
	 end
	 
	 else if(!instruction[27] && instruction[26]) begin
		 instr_type=2'b10;
	 end
	 
	 else if(!instruction[27] && !instruction[26]) begin
		 instr_type=2'b01;
	 end
	 
	 else begin
		 instr_type=2'b00;
	 end
	
	 if(instruction[25]) begin
		 data_instr_type = 3'b001;
	 end
	 
	 else if(!instruction[25] && !instruction[4]) begin
		 data_instr_type = 3'b010;
	 end
	 
	 else if(instruction[25] && !instruction[7] && instruction[4]) begin
		 data_instr_type = 3'b011;
	 end
	 
	 else if(!instruction[25] && !instruction[24] && !instruction[7] && instruction[6] && instruction[5] && !instruction[4]) begin
		 data_instr_type = 3'b100;
	 end
	 
	 else begin 
		 data_instr_type = 3'b000;
	 end
	 
	end
	 
endmodule
