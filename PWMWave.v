module PWMWave(input clk,input [6:0]PWMDuty,output reg [15:0]PWMout,input reset,input[6:0]phase);

reg [6:0]address;
reg [6:0]SynthesisedPhase;

initial
    begin
        address=7'd0;
    end

always@(negedge clk)
begin
    address<=address+1'b1;
    SynthesisedPhase<=address+phase;
    if (SynthesisedPhase<=PWMDuty) 
        begin
            PWMout=16'hFFFF;
        end 
    else 
        begin
            PWMout=16'h0000;
        end
end
endmodule
