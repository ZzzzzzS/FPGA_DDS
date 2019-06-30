module Button(
        input FreqPhaseSelect,  //=1频率0相位
        input UpDownSelect,     //=1上升0下降
        input [2:0]PushButtonbefore,
        input reset,
        input clk,

        output reg Switchadd,
        output reg Switchsub,
        output reg SwitchMicroadd,
        output reg SwitchMicrosub,
        output reg SwitchNanoadd,
        output reg SwitchNanosub,
        output reg Phaseadd,
        output reg Phasesub,
        output reg [31:0]PWMDuty,
        output [2:0]LEDGroup
);

wire [2:0]PushButton/* synthesis keep="1" */;
wire [2:0]PushButtonafter/* synthesis keep="1" */;
debounce PushButton0(.clk(clk),.nrst(reset),.key_in(PushButtonbefore[0]),.key_out(PushButtonafter[0]));
debounce PushButton1(.clk(clk),.nrst(reset),.key_in(PushButtonbefore[1]),.key_out(PushButtonafter[1]));
debounce PushButton2(.clk(clk),.nrst(reset),.key_in(PushButtonbefore[2]),.key_out(PushButtonafter[2]));



//module buttonedge(input clk , input buttonin,output buttonout);
buttonedge PushButtonedge0(.clk(clk),.buttonin(PushButtonafter[0]),.buttonout(PushButton[0]));
buttonedge PushButtonedge1(.clk(clk),.buttonin(PushButtonafter[1]),.buttonout(PushButton[1]));
buttonedge PushButtonedge2(.clk(clk),.buttonin(PushButtonafter[2]),.buttonout(PushButton[2]));


assign LEDGroup=PushButton;

initial
begin
    PWMDuty=32'd816043786;//暂定19%
end

always@(*)
begin
	
if(reset==0)
begin
	PWMDuty=32'd816043786;//复位19%
end
else
begin
    case({UpDownSelect,FreqPhaseSelect,PushButton})
        5'b11110:begin SwitchNanoadd=0;  end //调频增加
        5'b11101:begin SwitchMicroadd=0; end
        5'b11011:begin Switchadd=0;      end

        5'b01110:begin SwitchNanosub=0;  end //调频减少
        5'b01101:begin SwitchMicrosub=0; end
        5'b01011:begin Switchsub=0;      end

        5'b10110:begin PWMDuty=PWMDuty+32'd816043786; end //PWM增减
        5'b00110:begin PWMDuty=PWMDuty-32'd816043786; end

        5'b10101:begin Phaseadd=0; end //相位增减
        5'b00101:begin Phasesub=0; end

        default:
        begin
            SwitchNanoadd=1;
            SwitchNanosub=1;
            SwitchMicroadd=1;
            SwitchMicrosub=1;
            Switchadd=1;
            Switchsub=1;

            Phaseadd=1;
            Phasesub=1;
        end
    endcase
end

end

endmodule // 