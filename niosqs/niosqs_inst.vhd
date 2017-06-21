	component niosqs is
		port (
			clk_clk                      : in    std_logic                     := 'X';             -- clk
			clk40mhz_clk                 : out   std_logic;                                        -- clk
			pio_export                   : out   std_logic_vector(7 downto 0);                     -- export
			sdram_addr                   : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_ba                     : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                  : out   std_logic;                                        -- cas_n
			sdram_cke                    : out   std_logic;                                        -- cke
			sdram_cs_n                   : out   std_logic;                                        -- cs_n
			sdram_dq                     : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm                    : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n                  : out   std_logic;                                        -- ras_n
			sdram_we_n                   : out   std_logic;                                        -- we_n
			sdram_bridge_ext_address     : in    std_logic_vector(22 downto 0) := (others => 'X'); -- address
			sdram_bridge_ext_byte_enable : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- byte_enable
			sdram_bridge_ext_read        : in    std_logic                     := 'X';             -- read
			sdram_bridge_ext_write       : in    std_logic                     := 'X';             -- write
			sdram_bridge_ext_write_data  : in    std_logic_vector(15 downto 0) := (others => 'X'); -- write_data
			sdram_bridge_ext_acknowledge : out   std_logic;                                        -- acknowledge
			sdram_bridge_ext_read_data   : out   std_logic_vector(15 downto 0);                    -- read_data
			spi_0_external_MISO          : in    std_logic                     := 'X';             -- MISO
			spi_0_external_MOSI          : out   std_logic;                                        -- MOSI
			spi_0_external_SCLK          : out   std_logic;                                        -- SCLK
			spi_0_external_SS_n          : out   std_logic;                                        -- SS_n
			uart_ext_RXD                 : in    std_logic                     := 'X';             -- RXD
			uart_ext_TXD                 : out   std_logic;                                        -- TXD
			uart_rx_ready                : in    std_logic                     := 'X';             -- ready
			uart_rx_data                 : out   std_logic_vector(7 downto 0);                     -- data
			uart_rx_error                : out   std_logic;                                        -- error
			uart_rx_valid                : out   std_logic;                                        -- valid
			uart_tx_data                 : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			uart_tx_error                : in    std_logic                     := 'X';             -- error
			uart_tx_valid                : in    std_logic                     := 'X';             -- valid
			uart_tx_ready                : out   std_logic                                         -- ready
		);
	end component niosqs;

	u0 : component niosqs
		port map (
			clk_clk                      => CONNECTED_TO_clk_clk,                      --              clk.clk
			clk40mhz_clk                 => CONNECTED_TO_clk40mhz_clk,                 --         clk40mhz.clk
			pio_export                   => CONNECTED_TO_pio_export,                   --              pio.export
			sdram_addr                   => CONNECTED_TO_sdram_addr,                   --            sdram.addr
			sdram_ba                     => CONNECTED_TO_sdram_ba,                     --                 .ba
			sdram_cas_n                  => CONNECTED_TO_sdram_cas_n,                  --                 .cas_n
			sdram_cke                    => CONNECTED_TO_sdram_cke,                    --                 .cke
			sdram_cs_n                   => CONNECTED_TO_sdram_cs_n,                   --                 .cs_n
			sdram_dq                     => CONNECTED_TO_sdram_dq,                     --                 .dq
			sdram_dqm                    => CONNECTED_TO_sdram_dqm,                    --                 .dqm
			sdram_ras_n                  => CONNECTED_TO_sdram_ras_n,                  --                 .ras_n
			sdram_we_n                   => CONNECTED_TO_sdram_we_n,                   --                 .we_n
			sdram_bridge_ext_address     => CONNECTED_TO_sdram_bridge_ext_address,     -- sdram_bridge_ext.address
			sdram_bridge_ext_byte_enable => CONNECTED_TO_sdram_bridge_ext_byte_enable, --                 .byte_enable
			sdram_bridge_ext_read        => CONNECTED_TO_sdram_bridge_ext_read,        --                 .read
			sdram_bridge_ext_write       => CONNECTED_TO_sdram_bridge_ext_write,       --                 .write
			sdram_bridge_ext_write_data  => CONNECTED_TO_sdram_bridge_ext_write_data,  --                 .write_data
			sdram_bridge_ext_acknowledge => CONNECTED_TO_sdram_bridge_ext_acknowledge, --                 .acknowledge
			sdram_bridge_ext_read_data   => CONNECTED_TO_sdram_bridge_ext_read_data,   --                 .read_data
			spi_0_external_MISO          => CONNECTED_TO_spi_0_external_MISO,          --   spi_0_external.MISO
			spi_0_external_MOSI          => CONNECTED_TO_spi_0_external_MOSI,          --                 .MOSI
			spi_0_external_SCLK          => CONNECTED_TO_spi_0_external_SCLK,          --                 .SCLK
			spi_0_external_SS_n          => CONNECTED_TO_spi_0_external_SS_n,          --                 .SS_n
			uart_ext_RXD                 => CONNECTED_TO_uart_ext_RXD,                 --         uart_ext.RXD
			uart_ext_TXD                 => CONNECTED_TO_uart_ext_TXD,                 --                 .TXD
			uart_rx_ready                => CONNECTED_TO_uart_rx_ready,                --          uart_rx.ready
			uart_rx_data                 => CONNECTED_TO_uart_rx_data,                 --                 .data
			uart_rx_error                => CONNECTED_TO_uart_rx_error,                --                 .error
			uart_rx_valid                => CONNECTED_TO_uart_rx_valid,                --                 .valid
			uart_tx_data                 => CONNECTED_TO_uart_tx_data,                 --          uart_tx.data
			uart_tx_error                => CONNECTED_TO_uart_tx_error,                --                 .error
			uart_tx_valid                => CONNECTED_TO_uart_tx_valid,                --                 .valid
			uart_tx_ready                => CONNECTED_TO_uart_tx_ready                 --                 .ready
		);

