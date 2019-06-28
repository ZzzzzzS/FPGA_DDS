module led_show(clk,rst_n,data,output [7:0] led_numseg);

input clk;			
input rst_n;
input [27:0]data;

reg [3:0] value;
  
reg [23:0] counter;
reg [7:0] led_select;  
//module led_decoder(clk,rst_n,value,led_numseg);

led_decoder D1(.clk(clk),.rst_n(rst_n),.value(value),.led_numseg(led_numseg));

always@(posedge clk)
	if(!rst_n)
		counter <= 24'b0;
	else
		counter <= counter + 24'b1;
	

always@(counter[17:15])
	case(counter[17:15])
		3'b000 : 
			led_select = 8'b00001000;           
		3'b001 : 
			led_select = 8'b00000100;           
		3'b010 : 
			led_select = 8'b00000010;
		3'b011 : 
			led_select = 8'b00000001;
		3'b100 : 
			led_select = 8'b10000000;
		3'b101 :
		    led_select = 8'b01000000;    
		3'b110 : 
			led_select = 8'b00100000;
		3'b111 :
		    led_select = 8'b00010000;                 
		default:;             
	endcase
  
reg [3:0] value;
always@(counter[17:15] or second)
	case(counter[17:15])
		3'b000 : 
			value = data%10;
		3'b001 : 
			value = (data/10)%10;          
		3'b010 : 
			value = (data/100)%10;         
		3'b011 : 
			value = (data/1000)%10;
	    3'b100 :
	        value = (data/10000%10;
	    3'b101 :
	        value = (data/100000)%10;
	    3'b110 :
	        value = (data/1000000)%10;
	    3'b111 :
	        value = (data/10000000)%10;
		default:;
	endcase


endmodule
