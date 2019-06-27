module SinWave(input clk,output[15:0]Sinout,input reset,input[31:0]phase,input[31:0]Step);
reg [31:0]address;
reg [31:0]SynthesisedPhase;
initial
    begin
        address=32'd0;
    end

SinROM ROM1(.address(SynthesisedPhase[31:20]),
             .clock(clk),
             .q(Sinout));

always@(negedge clk)
    begin
        address<=address+Step;
        SynthesisedPhase<=address+phase;
        if (reset==0) 
        begin
            address<=32'd0;
            SynthesisedPhase<=32'd0;
        end
    end

endmodule
