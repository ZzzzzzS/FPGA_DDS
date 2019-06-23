module phase (input add,input sub,output [6:0]phase,input reset);
reg [6:0]phaseInter;
assign phase=phaseInter;

initial
	phaseInter=7'd0;

always@(negedge add or negedge sub)
    begin
		if(add==0)
			phaseInter<=phaseInter+7'd1;
		else if(sub==0)
			phaseInter<=phaseInter-7'd1;
    end

endmodule
