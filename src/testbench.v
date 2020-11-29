`timescale 1ns / 100ps
`include "datapath.v"

module testbench ();
  reg clk, reset;
  wire [63:0]PC, ALUResult;
  wire [31:0]instruction;
  wire [4:0]ReadReg1, ReadReg2, RegWrite;

  datapath Call (.clk(clk), .reset(reset), .nextPC(PC), .ALUResult(ALUResult), .instruction(instruction));

  initial begin
    $dumpfile("datapath.vcd");
    $dumpvars(0, testbench);
    $display("Exibindo os resultados:");
    clk = 0;
    #300 $finish;
  end

  always begin
    #10 clk = ~clk;
  end

endmodule
