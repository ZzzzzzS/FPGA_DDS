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
					negedge Switchadd or negedge Switchsub or negedge reset)
begin
 if (reset==0) 
        begin
            Step<=32'd171798691;//复位
        end   

/**********粗调节************/
    if (Switchadd==0) 
    begin
        Step<=Step+32'd858993;
    end
	 
		
    if (Switchsub==0) 
	begin
        Step<=Step-32'd858993;
    end
	 


/**********微调节************/
    if (SwitchMicroadd==0) 
    begin
        Step<=Step+32'd85899;
    end
	 
		
    if (SwitchMicrosub==0)
    begin
        Step<=Step-32'd85899;
    end
	


/**********精调节************/
    if (SwitchNanoadd==0) 
    begin
        Step<=Step+32'd85;
    end
	 


    if (SwitchNanosub==0)
	 begin
        Step<=Step-32'd85;
    end
	 
end
endmodule