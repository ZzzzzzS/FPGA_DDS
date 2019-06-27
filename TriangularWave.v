module TriangularWave(input clk,output [15:0]Triangularout,input reset,input[31:0]phase,input[31:0]Step);
reg [31:0]address;
reg [31:0]SynthesisedPhase;
initial
    begin
        address=32'd0;
    end
/**********调用TriangularROM************/
TriangularROM ROM1(.address(SynthesisedPhase[31:21]),
             .clock(clk),
             .q(Triangularout));

always@(negedge clk)
    begin
        address<=address+Step;//频率
        SynthesisedPhase<=address+phase;//相位
        if (reset==0) 
        begin
            address<=32'd0;
            SynthesisedPhase<=32'd0;
        end
    end
endmodule
