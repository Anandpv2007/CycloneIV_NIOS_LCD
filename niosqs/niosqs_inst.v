	niosqs u0 (
		.clk_clk                      (<connected-to-clk_clk>),                      //              clk.clk
		.clk40mhz_clk                 (<connected-to-clk40mhz_clk>),                 //         clk40mhz.clk
		.pio_export                   (<connected-to-pio_export>),                   //              pio.export
		.sdram_addr                   (<connected-to-sdram_addr>),                   //            sdram.addr
		.sdram_ba                     (<connected-to-sdram_ba>),                     //                 .ba
		.sdram_cas_n                  (<connected-to-sdram_cas_n>),                  //                 .cas_n
		.sdram_cke                    (<connected-to-sdram_cke>),                    //                 .cke
		.sdram_cs_n                   (<connected-to-sdram_cs_n>),                   //                 .cs_n
		.sdram_dq                     (<connected-to-sdram_dq>),                     //                 .dq
		.sdram_dqm                    (<connected-to-sdram_dqm>),                    //                 .dqm
		.sdram_ras_n                  (<connected-to-sdram_ras_n>),                  //                 .ras_n
		.sdram_we_n                   (<connected-to-sdram_we_n>),                   //                 .we_n
		.sdram_bridge_ext_address     (<connected-to-sdram_bridge_ext_address>),     // sdram_bridge_ext.address
		.sdram_bridge_ext_byte_enable (<connected-to-sdram_bridge_ext_byte_enable>), //                 .byte_enable
		.sdram_bridge_ext_read        (<connected-to-sdram_bridge_ext_read>),        //                 .read
		.sdram_bridge_ext_write       (<connected-to-sdram_bridge_ext_write>),       //                 .write
		.sdram_bridge_ext_write_data  (<connected-to-sdram_bridge_ext_write_data>),  //                 .write_data
		.sdram_bridge_ext_acknowledge (<connected-to-sdram_bridge_ext_acknowledge>), //                 .acknowledge
		.sdram_bridge_ext_read_data   (<connected-to-sdram_bridge_ext_read_data>),   //                 .read_data
		.spi_0_external_MISO          (<connected-to-spi_0_external_MISO>),          //   spi_0_external.MISO
		.spi_0_external_MOSI          (<connected-to-spi_0_external_MOSI>),          //                 .MOSI
		.spi_0_external_SCLK          (<connected-to-spi_0_external_SCLK>),          //                 .SCLK
		.spi_0_external_SS_n          (<connected-to-spi_0_external_SS_n>),          //                 .SS_n
		.uart_ext_RXD                 (<connected-to-uart_ext_RXD>),                 //         uart_ext.RXD
		.uart_ext_TXD                 (<connected-to-uart_ext_TXD>),                 //                 .TXD
		.uart_rx_ready                (<connected-to-uart_rx_ready>),                //          uart_rx.ready
		.uart_rx_data                 (<connected-to-uart_rx_data>),                 //                 .data
		.uart_rx_error                (<connected-to-uart_rx_error>),                //                 .error
		.uart_rx_valid                (<connected-to-uart_rx_valid>),                //                 .valid
		.uart_tx_data                 (<connected-to-uart_tx_data>),                 //          uart_tx.data
		.uart_tx_error                (<connected-to-uart_tx_error>),                //                 .error
		.uart_tx_valid                (<connected-to-uart_tx_valid>),                //                 .valid
		.uart_tx_ready                (<connected-to-uart_tx_ready>)                 //                 .ready
	);

