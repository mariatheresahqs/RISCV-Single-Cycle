module Control (OpCode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
  input wire [6:0]OpCode;
  output reg ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
  output reg [1:0]ALUOp;

  always @ (*) begin
    if(OpCode == 7'b0110011) begin // Tipo R - AND, OR, SUB, ADD
      ALUSrc <= 0;
      MemtoReg <= 0;
      RegWrite <= 1;
      MemRead <= 0;
      MemWrite <= 0;
      Branch <= 0;
      ALUOp <= 2'b10;
    end
    else if(OpCode == 7'b0000011) begin // Tipo Load - LD
      ALUSrc <= 1;
      MemtoReg <= 1;
      RegWrite <= 1;
      MemRead <= 1;
      MemWrite <= 0;
      Branch <= 0;
      ALUOp <= 2'b00;
    end
    else if(OpCode == 7'b0100011) begin // Tipo Store - SD
      ALUSrc <= 1;
      MemtoReg <= 0; // don't care
      RegWrite <= 0;
      MemRead <= 0;
      MemWrite <= 1;
      Branch <= 0;
      ALUOp <= 2'b00;
    end
    else if(OpCode == 7'b1100011) begin // Tipo branch - BEQ - Dener falou que era 1100111
      ALUSrc <= 0;
      MemtoReg <= 0; // don't care
      RegWrite <= 0;
      MemRead <= 0;
      MemWrite <= 0;
      Branch <= 1;
      ALUOp <= 2'b01;
    end
  end
endmodule
