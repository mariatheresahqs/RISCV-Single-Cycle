`include "PC.v"
`include "SignExtend.v"
`include "InstructionMemory.v"
`include "Control.v"
`include "Registers.v"

module datapath (clk, reset, nextPC, ALUResult, instruction);
  input wire clk, reset;
  output wire [63:0]nextPC, ALUResult; 
  output wire[31:0]instruction;
  wire [63:0]resultPC, sum, muxResult, muxDataResult;
  wire [63:0]signExtend, ReadData1, ReadData2, DataTemp, WriteData, shiftValue, ReadData, PC;
  wire [4:0]WriteReg;
  wire ANDBranch, Zero, ANDResult;
  wire ALUSrc, MemtoReg, MemWrite, MemRead, RegWrite, Branch;  // control instructions
  wire [1:0]ALUOp; // control instruction
  wire [3:0]ALUCtrl; 
  
  //-----------------------------------------------------------------
  // Program Counter Modules
  //-----------------------------------------------------------------
  PC PC (.PC(nextPC), .shiftValue(shiftValue), .sum(nextPC), .ANDBranch(1'b0), .clk(clk));
  ShiftLeft ImmShiftedOneLeft (.signExtend(signExtend), .result(shiftValue));
  BranchAND BranchAND(.Zero(Zero), .Branch(Branch), .ANDResult(ANDResult));
  //-----------------------------------------------------------------
  // SingExtend Modules
  //-----------------------------------------------------------------
  SignExtend ImmGen (.OpCode(instruction[6:0]), .instruction(instruction[31:0]), .signExtend(signExtend));
  //-----------------------------------------------------------------
  // Memory Instruction Modules
  //-----------------------------------------------------------------
  InstructionMemory InstructionMemory (.PC(nextPC), .instruction(instruction));
   //-----------------------------------------------------------------
  // Control Modules
  //-----------------------------------------------------------------
  Control Control_Values (.OpCode(instruction[6:0]), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp(ALUOp));
  //-----------------------------------------------------------------
  // Registers Modules
  //-----------------------------------------------------------------
  Registers Regs (.ReadReg1(instruction[19:15]), .ReadReg2(instruction[24:20]), .RegWrite(instruction[11:7]), .ReadData1(ReadData1), .ReadData2(ReadData2), .WriteReg(RegWrite), .WriteData(muxDataResult), .clk(clk), .reset(reset));
  
endmodule
