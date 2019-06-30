module buttonedge(input clk , input buttonin,output buttonout);

reg  key_temp;

always@(posedge clk)
    key_temp<=buttonin;//储存按键上一个状态

assign buttonout=~((key_temp)&&(!buttonin));//将按键下降沿转换成窄脉冲

endmodule