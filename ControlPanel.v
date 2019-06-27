module ControlPanel(SinIn,PWMIn,TriangularIn,rectangleIn,SignalOut,OutMode,reset);
input reset;
input [15:0] SinIn,PWMIn,TriangularIn,rectangleIn;
output reg [15:0] SignalOut;
input [1:0] OutMode;
/**********选择输出波形************/
always@(*)
begin
    case(OutMode)
        2'b01:SignalOut<=SinIn;
        2'b10:SignalOut<=PWMIn;
        2'b11:SignalOut<=TriangularIn;
        2'b00:SignalOut<=rectangleIn;
    endcase
end

endmodule
