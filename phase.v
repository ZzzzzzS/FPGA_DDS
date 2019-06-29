module phase (input add,input sub,output reg[31:0]phase,input reset);


initial
	phase=32'd0;//相位偏移初始化

always@(negedge add or negedge sub or negedge reset)
begin
	if (reset==0) 
    begin
        phase<=32'd0;//复位
    end
	else
	begin
		case({add,sub})
			2'b01:begin phase<=phase+32'd1073741824; end//对应相位偏移程度，应该是1°=2^32/360
			2'b10:begin phase<=phase-32'd1073741824; end
			default: begin phase<=phase; end
		endcase

	end
end

endmodule
