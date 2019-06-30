module ClockGenerator(  input Switchadd,
                        input Switchsub,
                        input SwitchMicroadd,
                        input SwitchMicrosub,
                        input SwitchNanoadd,
                        input SwitchNanosub,
                        output reg [31:0]Step,
                        input reset);

initial
begin
    Step=32'd171798691; //频率控制字初始化2M
end

always@(	negedge SwitchMicroadd or negedge SwitchMicrosub or
					negedge SwitchNanoadd or negedge SwitchNanosub or
					negedge Switchadd or negedge Switchsub or negedge reset or negedge Step)
begin
if (reset==0) 
    begin
        Step<=32'd171798691;//复位频率控制字初始化2M
    end   
else
begin
    case({SwitchMicroadd,SwitchNanoadd,Switchadd,SwitchMicrosub,SwitchNanosub,Switchsub})
        6'b011111:begin if(Step>32'd171798691) Step=32'd171798691; else Step<=Step+32'd85899;  end//频率微加
        6'b101111:begin if(Step>32'd171798691) Step=32'd171798691; else Step<=Step+32'd85;     end//频率精加
        6'b110111:begin if(Step>32'd171798691) Step=32'd171798691; else Step<=Step+32'd858993; end//频率粗加

        6'b111011:begin if(Step<32'd85899) Step=32'd85899; else Step<=Step-32'd85899;  end//频率减
        6'b111101:begin if(Step<32'd85899) Step=32'd85899; else Step<=Step-32'd85;     end
        6'b111110:begin if(Step<32'd85899) Step=32'd85899; else Step<=Step-32'd858993; end

        default:begin Step<=Step; end
    endcase
end	 
end
endmodule