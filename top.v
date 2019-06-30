module top(	input clk,
			output [15:0]SignalOut,
			input  [1:0]OutMode,
			input  reset,
			input  FreqPhaseSelect,
			input  UpDownSelect,
			input  [2:0]PushButton,
			output reg [7:0] led_select,
			output [7:0] led_numseg,
			output [2:0]LEDGroup);
 
wire [15:0]SinWire,TriangularWire,PWMWire,RectangleWire;
wire [31:0]Step; 
wire [31:0]PWMDuty;
wire [31:0]PhaseWire;
wire SwitchMicroadd,SwitchMicrosub,SwitchNanoadd,SwitchNanosub,Switchadd,Switchsub;
wire phaseadd,phasesub;

wire [20:0]DisplayFreq;

assign DisplayFreq=Step/85;//将频率控制字转化成正确的频率信息

/***数码管显示模块***/
led_show L1(	.clk(clk),//时钟
				.rst_n(reset),//复位
				.data(DisplayFreq),//需要显示的数据
				.led_numseg(led_numseg),//动态扫描段码
				.led_select(led_select));//动态扫描位码
/***按键控制模块***/
Button B1(	.FreqPhaseSelect(FreqPhaseSelect), //频率相位控制 =1频率 =0相位
        	.UpDownSelect(UpDownSelect),//增加减少控制 =1增加 =0减少    
        	.PushButtonbefore(PushButton),//按键
        	.reset(reset),//复位
			.clk(clk),//时钟
            
        	.Switchadd(Switchadd),//频率粗增加信号
        	.Switchsub(Switchsub),//频率粗减少信号
        	.SwitchMicroadd(SwitchMicroadd),//频率微增加信号
        	.SwitchMicrosub(SwitchMicrosub),//频率微减少信号
        	.SwitchNanoadd(SwitchNanoadd),//频率精增加信号
        	.SwitchNanosub(SwitchNanosub),//频率精减少信号
        	.Phaseadd(phaseadd),//相位增加信号
        	.Phasesub(phasesub),//相位减少信号
        	.PWMDuty(PWMDuty),//PWM频率
			.LEDGroup(LEDGroup));//LED灯
/***时钟控制模块***/
ClockGenerator C1(	.Switchadd(Switchadd),//频率粗增加信号
					.Switchsub(Switchsub),//频率粗减少信号
					.SwitchMicroadd(SwitchMicroadd),//频率微增加信号
					.SwitchMicrosub(SwitchMicrosub),//频率微减少信号
					.SwitchNanoadd(SwitchNanoadd),//频率精增加信号
					.SwitchNanosub(SwitchNanosub),//频率精减少信号
					.Step(Step),//产生的实际频率控制字
					.reset(reset));//复位
/***相位控制模块***/
phase phaseControler( 	.add(phaseadd),//相位增加信号
						.sub(phasesub),//相位减少信号
						.phase(PhaseWire),//相位控制字
						.reset(reset));//复位


SinWave S1(				.clk(clk),//时钟信号
						.Sinout(SinWire),//正弦信号输出
						.reset(reset),//复位信号
						.phase(PhaseWire),//相位控制字
						.Step(Step));//频率控制字


TriangularWave T1(		.clk(clk),//时钟
						.Triangularout(TriangularWire),//三角信号输出
						.reset(reset),//复位
						.phase(PhaseWire),//相位控制字
						.Step(Step));//频率控制字
						
PWMWave P1(				.clk(clk),
						.PWMDuty(PWMDuty),
						.PWMout(PWMWire),
						.reset(reset),
						.phase(PhaseWire),
						.Step(Step));

PWMWave P2(				.clk(clk),
						.PWMDuty(32'd2147483648),//方波就是50%占空比的PWM
						.PWMout(RectangleWire),
						.reset(reset),
						.phase(PhaseWire),
						.Step(Step));
/***输出波形控制模块***/
ControlPanel Control(	.SinIn(SinWire),
						.rectangleIn(RectangleWire),
						.PWMIn(PWMWire),
						.TriangularIn(TriangularWire),
						.SignalOut(SignalOut),
						.OutMode(OutMode),
						.reset(reset));
						
									
endmodule