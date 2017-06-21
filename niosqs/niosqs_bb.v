
module niosqs (
	clk_clk,
	clk40mhz_clk,
	pio_export,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	sdram_bridge_ext_address,
	sdram_bridge_ext_byte_enable,
	sdram_bridge_ext_read,
	sdram_bridge_ext_write,
	sdram_bridge_ext_write_data,
	sdram_bridge_ext_acknowledge,
	sdram_bridge_ext_read_data,
	spi_0_external_MISO,
	spi_0_external_MOSI,
	spi_0_external_SCLK,
	spi_0_external_SS_n,
	uart_ext_RXD,
	uart_ext_TXD,
	uart_rx_ready,
	uart_rx_data,
	uart_rx_error,
	uart_rx_valid,
	uart_tx_data,
	uart_tx_error,
	uart_tx_valid,
	uart_tx_ready);	

	input		clk_clk;
	output		clk40mhz_clk;
	output	[7:0]	pio_export;
	output	[11:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[22:0]	sdram_bridge_ext_address;
	input	[1:0]	sdram_bridge_ext_byte_enable;
	input		sdram_bridge_ext_read;
	input		sdram_bridge_ext_write;
	input	[15:0]	sdram_bridge_ext_write_data;
	output		sdram_bridge_ext_acknowledge;
	output	[15:0]	sdram_bridge_ext_read_data;
	input		spi_0_external_MISO;
	output		spi_0_external_MOSI;
	output		spi_0_external_SCLK;
	output		spi_0_external_SS_n;
	input		uart_ext_RXD;
	output		uart_ext_TXD;
	input		uart_rx_ready;
	output	[7:0]	uart_rx_data;
	output		uart_rx_error;
	output		uart_rx_valid;
	input	[7:0]	uart_tx_data;
	input		uart_tx_error;
	input		uart_tx_valid;
	output		uart_tx_ready;
endmodule
