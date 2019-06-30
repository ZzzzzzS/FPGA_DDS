module buttonedge(input clk , input buttonin,output buttonout);

reg  key_temp;

always@(posedge clk)
    key_temp<=buttonin;

assign buttonout=~((key_temp)&&(!buttonin));

endmodule