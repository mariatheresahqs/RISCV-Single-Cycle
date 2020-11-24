module SignExtend(OpCode, instruction, signExtend); //pegar o imediato e replicar pra 64
  
  input wire [6:0]OpCode;
  input wire [31:0]instruction;
  output reg [63:0]signExtend;
  wire [11:0]immLd;
  wire [11:0]immSd;
  wire [11:0]immBeq;
  assign immLd[11:0] = instruction[31:20];
  assign immSd[11:5] = instruction[31:25];
  assign immSd[4:0] = instruction[11:7];
  assign immBeq[11] = instruction[31]; //imm[12]
  assign immBeq[10] = instruction[7]; //imm[11]
  assign immBeq[9:4] = instruction[30:25]; //imm[10:5]
  assign immBeq[3:0] = instruction[11:8]; //imm[4:1]

  always @ (*) begin
      if(OpCode == 7'b0000011)begin //Instrucao de load
      
      signExtend = {{52{instruction[31]}}, immLd};
    end
    else if(OpCode == 7'b0100011) begin //Instrucao de store
      signExtend = {{52{instruction[31]}}, immSd};
    end
  
    else if(OpCode == 7'b1100011)begin //Instrucao de beq
      signExtend = {{52{instruction[31]}}, immBeq};
    end
    else begin
      signExtend <= 64'b0;
    end
  end
endmodule
