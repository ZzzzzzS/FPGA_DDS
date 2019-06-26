module SinWave(input clk,output[15:0]Sinout,input reset,input[22:0]phase,input[22:0]Step);
reg [22:0]address;
reg [22:0]SynthesisedPhase;
initial
    begin
        address=23'd0;
    end

SinROM ROM1(.address(SynthesisedPhase),
             .clock(clk),
             .q(Sinout));

always@(negedge clk)
    begin
        address<=address+Step;
        SynthesisedPhase<=address+phase;
    end

endmodule
