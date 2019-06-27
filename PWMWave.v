module PWMWave(input clk,input [31:0]PWMDuty,output reg [15:0]PWMout,input reset,input[31:0]phase,input[31:0]Step);

reg [31:0]address;
reg [31:0]SynthesisedPhase;

initial
    begin
        address=32'd0;
    end

always@(negedge clk)
begin
    address<=address+Step;
    SynthesisedPhase<=address+phase;
    if (SynthesisedPhase<=PWMDuty) 
        begin
            PWMout=16'hFFFF;
        end 
    else 
        begin
            PWMout=16'h0000;
        end
    if (reset==0) 
        begin
            address<=32'd0;
            SynthesisedPhase<=32'd0;
        end
end
endmodule
