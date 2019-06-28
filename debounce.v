module debounce(
    input wire clk, nrst,
    input wire key_in,
    output reg  key_out
    );

    reg [23:0] cnt;
	initial
    begin
        cnt<=20;
        key_out<=1;
    end
     

     always@(negedge clk or negedge nrst)
     begin
        if(nrst==0)
        begin
           cnt<=24'd20; 
           key_out<=1;
        end
         else if(key_in==0)
         begin
             cnt<=cnt+24'd1;
            if(cnt>=24'd2500000)
            begin
             cnt<=24'd2500000;
             key_out<=0;
            end
         end
         else if(key_in==1)
         begin
             cnt<=cnt-24'd1;
            if(cnt<=24'd20)
            begin
             cnt<=24'd20;
             key_out<=1;
            end 
         end
     end
	
endmodule
