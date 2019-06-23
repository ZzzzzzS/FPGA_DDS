module top(clk,PWMDuty,SignalOut,Switch,SwitchMicro,SwitchNano,OutMode,reset,phaseadd,phasesub);
input reset;
input clk;
input [1:0]OutMode;
input [7:0]PWMDuty;
input [1:0]Switch,SwitchMicro,SwitchNano;
input phaseadd,phasesub;
output [15:0]SignalOut;

wire [15:0]SinWire,TriangularWire,PWMWire,RectangleWire;
wire clk_N;
wire [7:0]PhaseWire;

ClockGenerator C1(	.clk(clk),
										.Switch(Switch),
										.SwitchMicro(SwitchMicro),
										.SwitchNano(SwitchNano),
										.clk_N(clk_N),
										.reset(reset));
phase phaseControler( .add(phaseadd),
							.sub(phasesub),
							.phase(PhaseWire)
							.reset(reset));
										
										
SinWave S1(	.clk(clk_N),
							.Sinout(SinWire),
							.reset(reset),
							.phase(PhaseWire));


TriangularWave T1(		.clk(clk_N),
											.Triangularout(TriangularWire),
											.reset(reset),
											.phase(PhaseWire));
						
PWMWave P1(	.clk(clk_N),
								.PWMDuty(PWMDuty),
								.PWMout(PWMWire),
								.reset(reset),
								.phase(PhaseWire));

PWMWave P2(	.clk(clk_N),
								.PWMDuty(8'd128),
								.PWMout(RectangleWire),
								.reset(reset),
								.phase(PhaseWire));

ControlPanel Control(.SinIn(SinWire),
										.rectangleIn(RectangleWire),
										.PWMIn(PWMWire),
										.TriangularIn(TriangularWire),
										.SignalOut(SignalOut),
										.OutMode(OutMode),
										.reset(reset));
						
									
endmodule
