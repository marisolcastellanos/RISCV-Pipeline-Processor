
module pipeline ();


  logic        clk;
  logic        reset;

  logic [31:0] WriteData, DataAdr;
  logic        MemWrite;
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end



//~~~~~~~~~~~~~~~~~iFetch Module~~~~~~~~~~~~~~~~~~~~~~

  logic [31:0] tb_Instr, tb_PC;
  logic tb_PCSrcE;
  logic [31:0] tb_PCF, tb_PCPlus4F;


  ifetch ifetch1( PCSrcE,PCPlus4F,PCTargetE,InstrD,PCD,PCPlus4D); 

   initial begin      
    PCSrcE <= 0;    
    PCTargetE <= 0;      
   end                    


endmodule // pipeline
