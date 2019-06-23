module phase (input add,input sub,output reg [6:0]phase,input reset);

initial
    begin
        phase=7'd0;
    end

always@(negedge add or negedge sub)
    begin
		if(add==0)
			phase<=phase+7'd1;
		else if(sub==0)
			phase<=phase-7'd1;
    end

endmodule
