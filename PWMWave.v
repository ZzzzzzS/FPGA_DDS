module PWMWave(input clk,input [31:0]PWMDuty,output reg [15:0]PWMout,input reset,input[31:0]phase,input[31:0]Step);

reg [31:0]address;
reg [31:0]SynthesisedPhase;

initial
    begin
        address=32'd0; //初始化
    end

always@(negedge clk)
begin
    address<=address+Step; //step:频率控制字，改变频率
    SynthesisedPhase<=address+phase;//调相
    if (SynthesisedPhase<=PWMDuty) //根据占空比，确定上升下降时间
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
