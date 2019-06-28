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
        output reg [31:0]PWMDuty
);

wire [2:0]PushButton;
debounce PushButton0(.clk(clk),.nrst(reset),.key_in(PushButtonbefore[0]),.key_out(PushButton[0]));
debounce PushButton1(.clk(clk),.nrst(reset),.key_in(PushButtonbefore[1]),.key_out(PushButton[1]));
debounce PushButton2(.clk(clk),.nrst(reset),.key_in(PushButtonbefore[2]),.key_out(PushButton[2]));



initial
begin
    PWMDuty=32'd2147483648;//暂定50%
end

always@(*)
begin
	
	if(reset==0)
	begin
		PWMDuty=32'd2147483648;//复位50%
	end

    if(FreqPhaseSelect==1)//频率调节
    begin
        if(UpDownSelect==1) //上升
        begin
            case(PushButton)
                3'b110:begin SwitchNanoadd=0; end
                3'b101:begin SwitchMicroadd=0; end
                3'b011:begin Switchadd=0; end
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
            case(PushButton)
                3'b110:begin SwitchNanosub=0; end
                3'b101:begin SwitchMicrosub=0; end
                3'b011:begin Switchsub=0; end
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
        if (UpDownSelect==1) 
        begin
            casez(PushButton)
                3'b?10:begin PWMDuty=PWMDuty+32'd1073741824; end
                3'b?01:begin Phaseadd=0; end
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
        else 
        begin
            casez(PushButton)
                3'b?10:begin PWMDuty=PWMDuty-32'd1073741824; end
                3'b?01:begin Phasesub=0; end
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
end

endmodule // 