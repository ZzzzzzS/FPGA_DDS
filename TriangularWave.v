module TriangularWave(input clk,output [15:0]Triangularout,input reset,input[6:0]phase,input[22:0]Step);
reg [22:0]address;
reg [22:0]SynthesisedPhase;
initial
    begin
        address=7'd0;
    end

TriangularROM ROM1(.address(SynthesisedPhase),
             .clock(clk),
             .q(Triangularout));

always@(negedge clk)
    begin
        address<=address+1'b1;
        SynthesisedPhase<=address+phase;
    end
endmodule
