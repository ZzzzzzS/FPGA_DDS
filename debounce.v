module debounce(
    input wire clk, nrst,
    input wire key_in,
    output reg  key_out
    );

    reg [31:0] cnt;
	initial
    begin
        cnt<=20;
        key_out<=1;
    end
     

     always@(negedge clk or negedge nrst)//按键消抖模块
     begin
        if(nrst==0)//复位
        begin
           cnt<=31'd20; 
           key_out<=1;
        end
         else if(key_in==0)//按键被按下
         begin
             cnt<=cnt+31'd1;
            if(cnt>=31'd5000000)
            begin
             cnt<=31'd5000000;//保护累加器不溢出
             key_out<=0;//按下累加器累加到一定时刻就认为按键被按下
            end
         end
         else if(key_in==1)//按键松开
         begin
             cnt<=cnt-31'd1;
            if(cnt<=31'd20)
            begin
             cnt<=31'd20;//保护累加器不溢出
             key_out<=1;//按下累加器累加到一定时刻就认为按键被抬起
            end 
         end
     end
	
endmodule
