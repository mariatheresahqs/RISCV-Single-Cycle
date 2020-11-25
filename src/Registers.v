module Registers (ReadReg1, ReadReg2, RegWrite, ReadData1, ReadData2, WriteReg, WriteData, clk, reset);

  	input wire [4:0]ReadReg1, ReadReg2, RegWrite; // registradores da instrucao
 	  input wire [63:0]WriteData; // resultado de retorno ao final do ciclo, se RegWrite for 1
  	input wire WriteReg, clk, reset; // sinal de controle de escrita e clock para acionar a escrita
    
    reg [63:0] regs [31:0]; // para preencher os 32 vetores de registradores
    output reg [63:0]ReadData1, ReadData2; // saida dos registradores da instrucao, agora em 64bits
    
    initial begin
        $readmemb("regs.txt", regs);
    end


  	always @(posedge clk) begin //tava @(*)
        if (reset) begin // tem que testar
            regs[0] <= 64'd0;
            regs[1] <= 64'd1;
            regs[2] <= 64'd2;
            regs[3] <= 64'd3;
            regs[4] <= 64'd4;
            regs[5] <= 64'd5;
            regs[6] <= 64'd6;
            regs[7] <= 64'd7;
            regs[8] <= 64'd8;
            regs[9] <= 64'd9;
            regs[10] <= 64'd10;
            regs[11] <= 64'd11;
            regs[12] <= 64'd12;
            regs[13] <= 64'd13;
            regs[14] <= 64'd14;
            regs[15] <= 64'd15;
            regs[16] <= 64'd16;
            regs[17] <= 64'd17;
            regs[18] <= 64'd18;
            regs[19] <= 64'd19;
            regs[20] <= 64'd20;
            regs[21] <= 64'd21;
            regs[22] <= 64'd22;
            regs[23] <= 64'd16;
            regs[24] <= 64'd24;
            regs[25] <= 64'd25;
            regs[26] <= 64'd26;
            regs[27] <= 64'd27;
            regs[28] <= 64'd28;
            regs[29] <= 64'd29;
            regs[30] <= 64'd30;
            regs[31] <= 64'd31;
        end
        else begin
            if(WriteReg) begin
                regs[RegWrite] <= WriteData;
            end
        end
  	end

      always @(*) begin
          ReadData1 <= regs[ReadReg1];
          ReadData2 <= regs[ReadReg2];
      end
 endmodule
