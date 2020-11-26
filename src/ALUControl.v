//-----------------------------------------------------------------
// ALUControl: Control signals about how the ALU should operate
//-----------------------------------------------------------------
module ALUControl (Funct7, Funct3, ALUOp, ALUCtrl);
  input wire [6:0]Funct7;
  input wire [2:0]Funct3;
  input wire [1:0]ALUOp;
  output reg [3:0]ALUCtrl;

  always @ (*) begin
    if(ALUOp == 2'b00) begin // Type Load and Type Store
      ALUCtrl <= 4'b0010; // add
    end
    else if(ALUOp == 2'b01) begin // Type Beq
      ALUCtrl <= 4'b0110; // sub
    end
    else if(Funct7 == 7'b0000000
     && Funct3 == 3'b000 && ALUOp == 2'b10) begin // Type R - ADD
      ALUCtrl <= 4'b0010; // add
    end
    else if(Funct7 == 7'b0100000
     && Funct3 == 3'b000 && ALUOp == 2'b10) begin // Type R - SUB
      ALUCtrl <= 4'b0110; // sub
    end
    else if(Funct7 == 7'b0000000
     && Funct3 == 3'b111 && ALUOp == 2'b10) begin // Type R - AND
      ALUCtrl <= 4'b0000; // and
    end
    else if(Funct7 == 7'b0000000
     && Funct3 == 3'b110 && ALUOp == 2'b10) begin // Type R - OR
      ALUCtrl <= 4'b0001; // or
    end
    else begin
      ALUCtrl <= 4'b0;
    end
  end
endmodule
