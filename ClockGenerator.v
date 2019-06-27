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
    Step=32'd2147483;
end

always@(	negedge SwitchMicroadd or negedge SwitchMicrosub or
					negedge SwitchNanoadd or negedge SwitchNanosub or
					negedge Switchadd or negedge Switchsub)
begin
/**********粗调节************/
    if (Switchadd==0) 
    begin
        Step<=Step+32'd2147483;
    end
	 
		
    if (Switchsub==0) 
	 begin
        Step<=Step-32'd2147483;
    end
	 


/**********微调节************/
    if (SwitchMicroadd==0) 
    begin
        Step<=Step+32'd214748;
    end
	 
		
    if (SwitchMicrosub==0) begin
        Step<=Step-32'd214748;
    end
	


/**********精调节************/
    if (SwitchNanoadd==0) 
    begin
        Step<=Step+32'd214;
    end
	 


    if (SwitchNanosub==0)
	 begin
        Step<=Step-32'd214;
    end
	 
end
endmodule