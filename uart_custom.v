module uart_custom(
	input uart_rx,
	output uart_tx,
	output [7:0]uart_rx_data,
	output reg ack,
	input [7:0]uart_tx_data,
	input clk);
	
endmodule