module top(	input clk,
			output [15:0]SignalOut,
			input  [1:0]OutMode,
			input  reset,			
			input  FreqPhaseSelect,
			input  UpDownSelect,
			input  [3:0]PushButton
			);

wire [15:0]SinWire,TriangularWire,PWMWire,RectangleWire;
wire [31:0]Step;
wire [31:0]PhaseWire;
wire [31:0]PWMDuty;
wire SwitchMicroadd,SwitchMicrosub,SwitchNanoadd,SwitchNanosub,Switchadd,Switchsub;
wire phaseadd,phasesub;

Button B1(	.FreqPhaseSelect(FreqPhaseSelect),  //=1选择频率，=0选择相位
        	.UpDownSelect(UpDownSelect),     //=1上升，=0下降
        	.PushButton(PushButton),
        	.reset(reset),
            
        	.Switchadd(Switchadd),
        	.Switchsub(Switchsub),
        	.SwitchMicroadd(SwitchMicroadd),
        	.SwitchMicrosub(SwitchMicrosub),
        	.SwitchNanoadd(SwitchNanoadd),
        	.SwitchNanosub(SwitchNanosub),
        	.Phaseadd(phaseadd),
        	.Phasesub(phasesub),
        	.PWMDuty(PWMDuty));

ClockGenerator C1(	.Switchadd(Switchadd),
					.Switchsub(Switchsub),
					.SwitchMicroadd(SwitchMicroadd),
					.SwitchMicrosub(SwitchMicrosub),
					.SwitchNanoadd(SwitchNanoadd),
					.SwitchNanosub(SwitchNanosub),
					.Step(Step),
					.reset(reset));

phase phaseControler( 	.add(phaseadd),
						.sub(phasesub),
						.phase(PhaseWire),
						.reset(reset));
										
										
SinWave S1(				.clk(clk),
						.Sinout(SinWire),
						.reset(reset),
						.phase(PhaseWire),
						.Step(Step));


TriangularWave T1(		.clk(clk),
						.Triangularout(TriangularWire),
						.reset(reset),
						.phase(PhaseWire),
						.Step(Step));
						
PWMWave P1(				.clk(clk),
						.PWMDuty(PWMDuty),
						.PWMout(PWMWire),
						.reset(reset),
						.phase(PhaseWire),
						.Step(Step));

PWMWave P2(				.clk(clk),
						.PWMDuty(32'd2147483648), //这个还需要根据具体步进带宽进行调节
						.PWMout(RectangleWire),
						.reset(reset),
						.phase(PhaseWire),
						.Step(Step));

ControlPanel Control(	.SinIn(SinWire),
						.rectangleIn(RectangleWire),
						.PWMIn(PWMWire),
						.TriangularIn(TriangularWire),
						.SignalOut(SignalOut),
						.OutMode(OutMode),
						.reset(reset));
						
									
endmodule
