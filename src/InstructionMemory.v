
module InstructionMemory (PC, instruction);
  
  input wire [63:0]PC;
  output reg [31:0]instruction;
  reg [31:0]MemInstr[12:0]; // edit the number of instructions of 32bits that is needed 

	initial begin
		$readmemb("binario.asm", MemInstr); // edit the number of instructions of 32bits that is needed 
	end
  
	always @(PC)begin
    	instruction = MemInstr[PC>>2]; // [pc>>2] shifting the instruction address
	end
endmodule
