module Button(
        input FreqPhaseSelect,  //=1频率0相位
        input UpDownSelect,     //=1上升0下降
        input [3:0]PushButton,
        input reset,

        output reg Switchadd,
        output reg Switchsub,
        output reg SwitchMicroadd,
        output reg SwitchMicrosub,
        output reg SwitchNanoadd,
        output reg SwitchNanosub,
        output reg Phaseadd,
        output reg Phasesub,
        output reg [31:0]PWMDuty
);


initial
begin
    PWMDuty=32'd2147483648;//暂定50%
end

always@(*)
begin
    if(FreqPhaseSelect==1)//频率调节
    begin
        if(UpDownSelect==1) //上升
        begin
            casez(PushButton)
                4'b?110:begin SwitchNanoadd=0; end
                4'b?101:begin SwitchMicroadd=0; end
                4'b?011:begin Switchadd=0; end
                default:
                begin
                    Switchadd=1;
                    SwitchMicroadd=1;
                    SwitchNanoadd=1;
                end
			endcase
        end
        else//下降
        begin
            casez(PushButton)
                4'b?110:begin SwitchNanosub=0; end
                4'b?101:begin SwitchMicrosub=0; end
                4'b?011:begin Switchsub=0; end
                default:
                begin
                    Switchsub=1;
                    SwitchMicrosub=1;
                    SwitchNanosub=1;
                end
			endcase
        end  
    end
    else//相位PWM调节
    begin
        case(PushButton)
            4'b1110:begin Phaseadd=0; end
            4'b1101:begin Phasesub=0; end
            4'b1011:begin PWMDuty=PWMDuty+32'd429496729; end //暂定10%
            4'b0111:begin PWMDuty=PWMDuty-32'd429496729; end
            default:
            begin
                Phaseadd=1;
                Phasesub=1;
                SwitchMicroadd=1;
                SwitchMicrosub=1;
                SwitchNanoadd=1;
                SwitchNanosub=1;
                Switchadd=1;
                Switchsub=1;
            end
		endcase	
    end
end

endmodule // 