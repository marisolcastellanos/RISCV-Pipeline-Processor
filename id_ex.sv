module id_ex(
        input logic         clk,   reset, 
        input logic  [4:0]  RdD, RD1D, RD2D,
        input logic  [31:0] PCD,  
                            ImmExtD, 
                            PCPlus4D,
        output logic [4:0]  RdE, RD1E, RD2E,
        output logic [31:0] PCE, 
                            ImmExtE,
                            PCPlus4E 
                                                        
    );

    always_ff @(posedge clk, posedge reset) 
    if (reset) begin 
    
    
    end 
    else begin
    PCE <= PCD; 
    RdE <= RdD;
    RD1E <= RD1D;
    RD2E <= RD2D; 
    ImmExtE <= ImmExtD; 
    PCPlus4E <= PCPlus4D; 
    end

endmodule
