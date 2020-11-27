module DataMemory(ALUResult, ReadData2, MemWrite, MemRead, ReadData, clk, reset);

    input wire [63:0]ALUResult, ReadData2;
    input wire MemWrite, MemRead, clk, reset;
    output reg [63:0]ReadData;
    reg [63:0]MemReg[31:0];
    
    integer i;

    initial begin
       
        $readmemb("data.txt", MemReg);
    end

    always @(posedge clk) begin
        if (reset) begin 
            MemReg[0] <= 64'd0;
            MemReg[1] <= 64'd1;
            MemReg[2] <= 64'd2;
            MemReg[3] <= 64'd3;
            MemReg[4] <= 64'd4;
            MemReg[5] <= 64'd5;
            MemReg[6] <= 64'd6;
            MemReg[7] <= 64'd7;
            MemReg[8] <= 64'd8;
            MemReg[9] <= 64'd9;
            MemReg[10] <= 64'd10;
            MemReg[11] <= 64'd11;
            MemReg[12] <= 64'd12;
            MemReg[13] <= 64'd13;
            MemReg[14] <= 64'd14;
            MemReg[15] <= 64'd15;
            MemReg[16] <= 64'd16;
            MemReg[17] <= 64'd17;
            MemReg[18] <= 64'd18;
            MemReg[19] <= 64'd19;
            MemReg[20] <= 64'd20;
            MemReg[21] <= 64'd21;
            MemReg[22] <= 64'd22;
            MemReg[23] <= 64'd16;
            MemReg[24] <= 64'd24;
            MemReg[25] <= 64'd25;
            MemReg[26] <= 64'd26;
            MemReg[27] <= 64'd27;
            MemReg[28] <= 64'd28;
            MemReg[29] <= 64'd29;
            MemReg[30] <= 64'd30;
            MemReg[31] <= 64'd31;
        end

        else begin
            if(MemWrite) begin //load
                MemReg[ALUResult>>3] <= ReadData2; 
            end
        end
    end

    always @(*) begin
        if(MemRead) begin //store
                ReadData <= MemReg[ALUResult>>3]; 
            end
        for (i = 0; i < 32; i++ ) begin
            $display("Mem[%0d] = %0b", i, MemReg[i]);
        end
            $display("\n");
    end

endmodule


module muxDataMem(ReadData, ALUResult, MemtoReg, muxDataResult);

    input wire [63:0]ReadData, ALUResult;
    input wire MemtoReg;
    output reg [63:0]muxDataResult;

    always @(*)begin
        if(MemtoReg)begin
            muxDataResult <= ReadData;
        end
        else begin
            muxDataResult <= ALUResult;
        end
    end
endmodule
