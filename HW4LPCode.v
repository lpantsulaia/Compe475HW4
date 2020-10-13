
module HW4LPCode(
		input wire[31:0] instruction,
		output reg[2:0] instr_type,
		output reg[3:0] data_instr_type,
		output reg[2:0] jmp_instr_type,
		output reg[2:0] mem_instr_type
    );

	 always @(*) begin
	 if(instruction[27] && !instruction[26]) begin //branch type
		 instr_type=2'b11;
		if(instruction[25] && !instruction[24]) begin  //without link
			jmp_instr_type = 2'b01;
		end
	 
		else if(instruction[25] && instruction[24]) begin //with link
			jmp_instr_type = 2'b10;
		end
	 
		else begin
			jmp_instr_type = 2'b00;
		end
	 end
	 
	 
	 
	 else if(!instruction[27] && instruction[26]) begin //memory typ
	   instr_type=2'b10;
		if(instruction[25]) begin //imidate
			mem_instr_type=2'b01;
		end
		
		if(!instruction[25]) begin //register
			mem_instr_type=2'b10;
		end
		else begin
			mem_instr_type=2'b00;
		end
	 end
	 
	 
	 
	 else if(!instruction[27] && !instruction[26]) begin //data type
		instr_type=2'b01;
	   if(instruction[25]) begin //imidate

			data_instr_type = 3'b001;
		end
	 
		else if(!instruction[25] && !instruction[4]) begin //shift by value
			data_instr_type = 3'b010;
		end
	 
		else if(instruction[25] && !instruction[7] && instruction[4]) begin //shift by reg
			data_instr_type = 3'b011;
		end
	 
		else if(!instruction[25] && !instruction[24] && !instruction[7] && instruction[6] && instruction[5] && !instruction[4]) begin // multiplication
			data_instr_type = 3'b100;
		end
	 
		else begin 
			data_instr_type = 3'b000;
		end
	end
	 
	 else begin
		 instr_type=2'b00;
	 end
	
	 
	 
	 
	 
	 
	 
	 
	end
	 
endmodule
