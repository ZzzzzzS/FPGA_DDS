module led_decoder(clk,rst_n,value,led_numseg);
	input clk,rst_n;
	input [3:0] value;
	output [7:0] led_numseg;  

	wire [3:0] value;
	reg [7:0] led_numseg;  
	always@(value)
		case(value)
			4'd0 : led_numseg = 8'b00000011;
			4'd1 : led_numseg = 8'b10011111;
			4'd2 : led_numseg = 8'b00100101;
			4'd3 : led_numseg = 8'b00001101;
			4'd4 : led_numseg = 8'b10011001;
			4'd5 : led_numseg = 8'b01001001;
			4'd6 : led_numseg = 8'b01000001;
			4'd7 : led_numseg = 8'b00011111;
			4'd8 : led_numseg = 8'b00000001;
			4'd9 : led_numseg = 8'b00001001;
			default : led_numseg = 8'b11111111;
		endcase
	
endmodule
