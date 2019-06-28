module phase (input add,input sub,output reg[31:0]phase,input reset);


initial
	phase=32'd0;//相位偏移初始化

always@(negedge add or negedge sub or negedge reset)
    begin
		if(add==0)
			phase<=phase+32'd1073741824;//对应相位偏移程度，应该是1°=2^32/360
			
		if(sub==0)
			phase<=phase-32'd1073741824;
		if (reset==0) 
        begin
            phase<=32'd0;//复位
        end
    end

endmodule
