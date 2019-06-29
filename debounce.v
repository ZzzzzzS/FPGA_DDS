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
     

     always@(negedge clk or negedge nrst)
     begin
        if(nrst==0)
        begin
           cnt<=31'd20; 
           key_out<=1;
        end
         else if(key_in==0)
         begin
             cnt<=cnt+31'd1;
            if(cnt>=31'd5000000)
            begin
             cnt<=31'd5000000;
             key_out<=0;
            end
         end
         else if(key_in==1)
         begin
             cnt<=cnt-31'd1;
            if(cnt<=31'd20)
            begin
             cnt<=31'd20;
             key_out<=1;
            end 
         end
     end
	
endmodule
