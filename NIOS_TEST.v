module NIOS_TEST(
	input CLK,
	//output [3:0]led,	
	//output [4:0]V_R,
	//output [5:0]V_G,
	//output [4:0]V_B,
	//output V_SYNC,
	 
	//output H_SYNC,	
	//output DS_EN1,
	input KEY1, KEY2, KEY3, KEY4,
	
	///SDRam
	output	[ 11: 0]	sdram_addr,
	output	[  1: 0]	sdram_ba,
	output				sdram_cas_n,
	output				sdram_cke,
	output				sdram_cs_n,
	inout		[ 15: 0]	sdram_dq,
	output	[  1: 0]	sdram_dqm,
	output				sdram_ras_n,
	output				sdram_we_n,   
	
	//SEGMENT
	output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F,DS_G, DS_DP, 
	//output reg DS_EN1, DS_EN2,
	 
	output	DS_EN1,DS_EN2,DS_EN3,DS_EN4,
	
	//LCD PINS
	output SCK,
	output SDA,
	output A0,
	output RST,
		//uart
	output 	txd,
	input 	rxd
	  
	);


reg [7:0] pio_connect;
wire clk25m;
wire clk40m;
wire clk100m;

//flag 
reg fpga_nios_flag;
reg A0_FPGA;
reg RST_FPGA;
reg SCK_FPGA, SDA_FPGA;

wire SCK_NIOS, SDA_NIOS;

//assign led[2] = pio_connect[0];

//assign SCK = pio_connect[0];
//assign SDA = pio_connect[1];
assign A0 = (pio_connect[2]);
assign RST = pio_connect[3];

assign SCK = (!fpga_nios_flag)?SCK_NIOS:SCK_FPGA;
assign SDA = (!fpga_nios_flag)?SDA_NIOS:SDA_FPGA;

//assign led[0] = pio_connect[4];
//assign led[1] = pio_connect[5];
//assign led[2] = pio_connect[6];
//assign led[3] = pio_connect[7]; 

//assign SCK = pio_connect[0];
//assign SDA = pio_connect[1];
//assign A0 = pio_connect[2];
//assign RST = pio_connect[3];
//assign DS_E= pio_connect[4];
//assign DS_F = pio_connect[5];
//assign DS_G = pio_connect[6];
//assign DS_DP = pio_connect[7];

 
reg [31:0]counter; 

	//segment  
	wire [6:0]ds_reg;
	wire [3:0]ds_en;
	assign {DS_G,DS_F,DS_E,DS_D,DS_C,DS_B,DS_A} = ds_reg ;
	assign {DS_EN1,DS_EN2,DS_EN3,DS_EN4} = ds_en;
	reg  [3:0]num_dt[3:0];
 
 reg[10:0] randb;
 
always @(posedge CLK)
begin 
//	led[1] = 0;
//	led[0] = 0;
if(randb[2])
begin
	SCK_FPGA = ~SCK_FPGA;
	if(KEY1 == 0)
	SDA_FPGA = 1;
	
		if(KEY2 == 0)
	SDA_FPGA = 0;
	
end	
	randb = randb + 1;
	//DS_EN1 = 0;
	//DS_EN2 =1;
	//if(counter == 0)
	begin
	//	SDA = KEY1;
	//	SCK = KEY2;
	//	RST = KEY3;
	//	A0 = KEY4;
	end
end


//State Machine for SRAM
parameter IDLE = 4'b0000, READ_RAM = 4'b0001, WRITE_RAM = 4'b0010, 
			UART_RX = 4'b0011, UART_TX = 4'b0100, UART_RX2 = 4'b0101, 
			UART_TX3 = 4'b0111,
			UART_TX2 = 4'b0110;
reg [3:0]SDRAM_FSM;		

//sdram regs
reg [22:0] sdram_address1;
reg [1:0]  sdram_byteenable_n;
reg sdram_cs;
wire [15:0] sdram_read_data;
reg [15:0] sdram_write_data;
reg sdram_read_n, sdram_write_n;
wire sdram_is_read_valid, sdram_ack;

  
//temp register
reg [15:0]sdram_read_temp;
reg [15:0]sdram_write_temp;
reg [21:0]sdram_address_idle;

//UARt_ext
	//uart data
	reg [7:0]tx_data;
	reg [7:0]rx_data;
	reg uart_rx_ready, uart_tx_ready, uart_rx_valid, uart_tx_valid;
	reg flag;
	
always @(posedge CLK)
begin
 case(SDRAM_FSM)
 //idle
IDLE:
begin 
	sdram_byteenable_n = 2'b11;  
	uart_tx_valid = 0;
	flag = 0;
	fpga_nios_flag = 0;
	if(KEY1 == 0)
	begin
		//sdram_write_temp = 16'haffa;
		sdram_address_idle = 25;
		SDRAM_FSM = UART_RX;

		//DS_G = ~DS_G;
	end

	if(KEY2 == 0)
	begin
		sdram_address_idle = 25;
		SDRAM_FSM = READ_RAM;
		//DS_A = ~DS_A;	
	end
	
	
	if(KEY3 == 0)
	begin
		//sdram_write_temp = 16'haffb;
		sdram_address_idle = 25;
		SDRAM_FSM = WRITE_RAM;
		//DS_G = ~DS_G;
	end
end
	///
READ_RAM:
begin
	 sdram_write_n = 0;
	 sdram_read_n = 1; 
	 if(sdram_ack) 
	 begin
		flag = 1; 
		sdram_read_temp = sdram_read_data;
		uart_tx_valid = 1; 
	end
    if(flag)
	 begin 
	 	 if(uart_tx_ready) 
			begin 
				flag = 0; 				
				tx_data = sdram_read_temp[7:0];
				SDRAM_FSM = UART_TX;
				///
				
				
	 	num_dt[3] = ((sdram_read_temp[7:0]%100)/10);  
		num_dt[2] = sdram_read_temp[7:0]%10;  	
		
	 	num_dt[1] = ((sdram_read_temp[15:8]%100)/10); 
	 	num_dt[0] = sdram_read_temp[15:8]%10; 
			end    
	 end
end
	//write cycle
WRITE_RAM:
begin 
	 sdram_write_n = 1;
	 sdram_read_n = 0;
	 sdram_write_data = sdram_write_temp;
	 if(sdram_ack)
	 begin 
		SDRAM_FSM = IDLE;
	 end  
 end
 //Receive
 UART_RX:
 begin
		uart_tx_valid = 0; 
		if(uart_rx_valid)
			begin 
				uart_rx_ready = 1; 
				SDRAM_FSM = UART_RX2;
				sdram_write_temp[7:0] = rx_data;
			end 
 end
 /////Trans
 UART_RX2:
 begin
 		uart_rx_ready = 0; 
 		if(uart_rx_valid)
			begin 
				uart_rx_ready = 1; 
				SDRAM_FSM = WRITE_RAM;
				sdram_write_temp[15:8] = rx_data;
				
	 	num_dt[3] = ((sdram_write_temp[7:0]%100)/10);  
		num_dt[2] = sdram_write_temp[7:0]%10;  	
		
	 	num_dt[1] = ((sdram_write_temp[15:8]%100)/10); 
	 	num_dt[0] = sdram_write_temp[15:8]%10; 				
				
				
			end  
 end
 
 UART_TX: SDRAM_FSM = UART_TX2;  
 
 UART_TX2:
 begin  
		if(uart_tx_ready) 
			begin 
				uart_tx_valid = 1;
				tx_data = sdram_read_temp[15:8];
				SDRAM_FSM = UART_TX3;
			end    
 end
 UART_TX3: SDRAM_FSM = UART_RX;  
//////// 
 default:
	SDRAM_FSM = IDLE;
 endcase
 
end 

niosqs u0(
.clk_clk(CLK),
//.clk25mhz_clk(clk25m),
.clk40mhz_clk(clk40m), 
.pio_export(pio_connect),

.spi_0_external_SCLK(SCK_NIOS),
.spi_0_external_MOSI(SDA_NIOS),
			////////////////////////////////////////////////////////////////////////////
 		   .sdram_addr                (sdram_addr),                //        sdram.addr
         .sdram_ba                  (sdram_ba),                  //             .ba
        .sdram_cas_n               (sdram_cas_n),               //             .cas_n
        .sdram_cke                 (sdram_cke),                 //             .cke
         .sdram_cs_n                (sdram_cs_n),                //             .cs_n
        .sdram_dq                  (sdram_dq),                  //             .dq
         .sdram_dqm                 (sdram_dqm ),                 //             .dqm
        .sdram_ras_n               (sdram_ras_n),               //             .ras_n
         .sdram_we_n                (sdram_we_n),                //             .we_n
		/////////////////////////////////////////////////////////////////////////////////////
		//	.sdram_stream_address(sdram_address1),       //  sdram_slave.address
      //   .sdram_stream_byteenable_n(sdram_byteenable_n),  //             .byteenable_n
      //   .sdram_stream_chipselect(sdram_cs),    //             .chipselect
      //   .sdram_stream_writedata(sdram_write_data),     //             .writedata
      //   .sdram_stream_read_n(sdram_read_n),        //             .read_n
      //   .sdram_stream_write_n(sdram_write_n),       //             .write_n
      //   .sdram_stream_readdata(sdram_read_data),      //             .readdata
      //   .sdram_stream_readdatavalid(sdram_is_read_valid), //             .readdatavalid
      //  .sdram_stream_waitrequest(sdram_wait_req),   //             .waitrequest

		
		.sdram_bridge_ext_address(sdram_address1),
		.sdram_bridge_ext_byte_enable(sdram_byteenable_n),
		.sdram_bridge_ext_read(sdram_read_n),
		.sdram_bridge_ext_write(sdram_write_n),
		.sdram_bridge_ext_write_data(sdram_write_data),
		.sdram_bridge_ext_acknowledge(sdram_ack),
		.sdram_bridge_ext_read_data(sdram_read_data),
		
		
		  
		 .uart_ext_RXD(rxd),  // uart_ext.RXD
		
		.uart_ext_TXD(txd),  //         .TXD
		.uart_rx_ready(uart_rx_ready), //  uart_rx.ready
		.uart_rx_data(rx_data),  //         .data
		//output wire       uart_rx_error, //         .error
		.uart_rx_valid(uart_rx_valid), //         .valid
		
		.uart_tx_data(tx_data),  //  uart_tx.data
		//input  wire       uart_tx_error, //         .error
		.uart_tx_valid(uart_tx_valid), //         .valid
		.uart_tx_ready(uart_tx_ready)  //         .ready

);


///seven segment
led_segment U4(
	.clk(CLK),
	.num1(num_dt[0]),
	.num2(num_dt[1]),
	.num3(num_dt[2]),
	.num4(num_dt[3]),
	.ds_en(ds_en),
	.ds_reg(ds_reg)
);

////////
/*
vga_module u1(
	.clk40m(clk40m),
	.hsync(H_SYNC),
	.vsync(V_SYNC),
	.pixel({V_B,V_G,V_R})
);
*/
//vga Controller

//vga_controller VGA_C_U1(
//.RED(V_R),
//.BLUE(V_B),
//.GREEN(V_G),
//.CLK(clk25m),
//.led_stat(led[2]),
//.HSY(H_SYNC),
//.VSY(V_SYNC));

endmodule
