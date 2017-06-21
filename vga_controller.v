module vga_controller(
	output reg [4:0] RED,
	output reg [5:0] GREEN,
	output reg [4:0] BLUE,
	output HSY,
	output reg VSY,
	input led_stat,
	input CLK);
	

reg [11:0] hc;
reg [11:0] vc;

reg [15:0]pcolor;

reg hsy;

assign HSY = hsy;

parameter H_PERIOD = 800, H_SYNC_START = 656, H_SYNC_END = 752, V_PERIOD = 525, V_SYNC = 2,
			V_SYNC_START = 490, V_SYNC_END = 492;



//horizontal line scan	
always @(posedge CLK) 
	if(hc<H_PERIOD)
		hc <= hc+1;
	else	
		hc <= 0;

//H_SYNC
always @(posedge CLK) 
	if(hc>=H_SYNC_START && hc<=H_SYNC_END)
		hsy <= 0;
	else	
		hsy <= 1;
		
//vertical scan	
always @(posedge hsy) 
	if(vc<V_PERIOD)
		vc <= vc+1;
	else	
		vc <= 0;
		
//V_SYNC
always @(posedge hsy) 
	if(vc>=V_SYNC_START && vc<=V_SYNC_END)
		VSY <= 0;
	else	
		VSY <= 1;
		
always @(posedge CLK)
begin
	pcolor = pcolor +1;
	if(hc<640 && vc<480)
		begin
		if(led_stat == 0)
		begin
			RED = 5'b11111;
			GREEN =6'b000000;
			BLUE = 5'b00000;
		end
		else
		begin
			RED = 5'b00000;
			GREEN =6'b111111;
			BLUE = 5'b00000;
		end
		end
	 else
		begin
			RED= 0;
			GREEN = 0;
			BLUE = 0;
		end
end 
endmodule
