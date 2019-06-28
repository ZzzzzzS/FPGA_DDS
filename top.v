module top(	input clk,
			output [15:0]SignalOut,
			input  [1:0]OutMode,
			input  reset,			
			input  FreqPhaseSelect,
			input  UpDownSelect,
			input  [2:0]PushButton,
			output wire [31:0]Step);
wire [15:0]SinWire,TriangularWire,PWMWire,RectangleWire;
//wire [31:0]Step; 
wire [31:0]PWMDuty;
wire [31:0]PhaseWire;
wire SwitchMicroadd,SwitchMicrosub,SwitchNanoadd,SwitchNanosub,Switchadd,Switchsub;
wire phaseadd,phasesub;
/**********鍚勪釜瀵勫瓨鍣ㄩ摼鎺***********/
Button B1(	.FreqPhaseSelect(FreqPhaseSelect),  //=1閫夋嫨棰戠巼锛0閫夋嫨鐩镐綅
        	.UpDownSelect(UpDownSelect),     //=1涓婂崌锛0涓嬮檷
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
						.PWMDuty(32'd2147483648), //鍗犵┖姣0%鐨凱WM=鏂规尝
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