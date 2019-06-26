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
    Step=32'd10000;
end

always@(*)
begin
    if (Switchadd==0) 
    begin
        Step<=Step+32'd10000;
    end
    else if (Switchsub==0) begin
        Step<=Step-32'd10000;
    end



    if (SwitchMicroadd==0) 
    begin
        Step<=Step+32'd1000;
    end
    else if (SwitchMicrosub==0) begin
        Step<=Step-32'd1000;
    end



    if (SwitchNanoadd==0) 
    begin
        Step<=Step+32'd1;
    end
    else if (SwitchNanosub==0) begin
        Step<=Step-32'd1;
    end

    if(Step>32'd2000000)
    begin
        Step<=32'd2000000;
    end

    if(Step<32'd10000)
    begin
        Step<=32'd10000;
    end

end

endmodule