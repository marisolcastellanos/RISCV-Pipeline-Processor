//IF stage 
module ifetch (
   input logic          clk,reset,
   input  logic         PCSrcE,
   input  logic  [31:0] PCTargetE,
   output logic  [31:0] InstrD,
   output logic  [31:0] PCD,PCPlus4D   
   );

//signals
   logic [31:0] PCNext;
   logic [31:0] InstrF, PCPlus4F;

   //instantiations
   mux2 #(32)  pcmux(PCPlus4F, PCTargetE, PCSrcE, PCNext); //PCNext is equivalent to PCF

   // next PC logic
  flopr #(32) pcreg(clk, reset, PCNext, PCF); 
  adder       pcadd4(PCF, 32'd4, PCPlus4F);
   // Fetch next Instruction 
  imem imem1(PCF, InstrF);
  
   // Ifetch pipeline register
   if_id  if_id1  (clk,reset,InstrF, PCF,PCPlus4F,InstrD,PCD,PCPlus4D);

  
   initial begin
   
      $display("Time\t PCF\t PCD\t InstrF\t InstrD");
      $monitor("%0d\t %0d\t %0d\t %h\t %h", $time, PCF, PCD, InstrF,InstrD);
      #20 $finish;
   end

endmodule // ifetch
