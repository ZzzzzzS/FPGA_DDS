module phase (input add,input sub,output reg[31:0]phase,input reset);


initial
	phase=32'd858993459;

always@(negedge add or negedge sub)
    begin
		if(add==0)
			phase<=phase+32'd11930464;//对应相位偏移程度，应该是1°？
			
		if(sub==0)
			phase<=phase-32'd11930464;
    end

endmodule
