module phase (input add,input sub,output [31:0]phase,input reset);
reg [31:0]phaseInter;
assign phase=phaseInter;

initial
	phaseInter=32'd3221225472;

always@(negedge add or negedge sub)
    begin
		if(add==0)
			phaseInter<=phaseInter+32'd1;//暂定步进1，后期需要修改
		else if(sub==0)
			phaseInter<=phaseInter-32'd1;
    end

endmodule
