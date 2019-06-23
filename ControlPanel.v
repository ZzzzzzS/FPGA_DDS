module ControlPanel(SinIn,PWMIn,TriangularIn,rectangleIn,SignalOut,OutMode,reset);
input reset;
input [15:0] SinIn,PWMIn,TriangularIn,rectangleIn;
output reg [15:0] SignalOut;
input [1:0] OutMode;
endmodule
