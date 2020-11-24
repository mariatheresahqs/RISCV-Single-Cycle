`include "PC.v"

module datapath (clk, reset, nextPC, ALUResult, instruction);
  input wire clk, reset;
  output wire [63:0]nextPC, ALUResult; 
  output wire[31:0]instruction;
  wire [63:0]resultPC, sum, muxResult, muxDataResult;
  wire [63:0]signExtend, ReadData1, ReadData2, DataTemp, WriteData, shiftValue, ReadData, PC;
  wire [4:0]WriteReg;
  wire ANDBranch, Zero, ANDResult;
  wire ALUSrc, MemtoReg, MemWrite, MemRead, RegWrite, Branch;  // instrucoes de controle
  wire [1:0]ALUOp; // instrucoes de controle
  wire [3:0]ALUCtrl; 
  
  //-----------------------------------------------------------------
  // Program Counter Modules
  //-----------------------------------------------------------------
  PC PC (.PC(nextPC), .shiftValue(shiftValue), .sum(nextPC), .ANDBranch(1'b0), .clk(clk));
  ShiftLeft ImmShiftedOneLeft (.signExtend(signExtend), .result(shiftValue));
  BranchAND BranchAND(.Zero(Zero), .Branch(Branch), .ANDResult(ANDResult));
  
  
endmodule
