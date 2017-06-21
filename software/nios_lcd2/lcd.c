/*
 * lcd.c
 *
 *  Created on: May 22, 2017
 *      Author: Anand
 */
#include "lcd.h"
#include "altera_avalon_spi_regs.h"

///Init [PORTS]
void init_ports()
{

    //Start LCD init here
    //RSET = 1;
	IOWR_ALTERA_AVALON_PIO_SET_BITS(PORT_0_BASE, RST);
	usleep(1000);
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(PORT_0_BASE, RST);
	usleep(1000);
	IOWR_ALTERA_AVALON_PIO_SET_BITS(PORT_0_BASE, RST);
	usleep(1000);

    writecommand(ST7735_SWRESET);
    usleep(120000);
    writecommand(ST7735_SLPOUT);
    usleep(120000);
    writecommand(ST7735_DISPON);
    usleep(120000);

    writecommand(ST7735_CASET);
	writedata(0x00);
	writedata(0x00);   // XSTART = 2
	writedata(0x00);
	writedata(127);   // XEND = 128

    usleep(100000);

    writecommand(ST7735_RASET);
	writedata(0x00);
	writedata(0x00);   // XSTART = 2]]
	writedata(0x00);
	writedata(159);   // XEND = 160

    usleep(100000);
}

//set pixel
void setpixel(BYTE x, BYTE y, BYTE R, BYTE G, BYTE B)
{
    writecommand(ST7735_CASET);
	writedata(0x00);
	writedata(0x02);   // XSTART = 2
	writedata(0x00);
	writedata(0x81);   // XEND = 129
   // DelayMs(10);
    writecommand(ST7735_RASET);
	writedata(0x00);
	writedata(0x02);   // XSTART = 2
	writedata(0x00);
	writedata(0x81);   // XEND = 129
    //DelayMs(10);
    writecommand(ST7735_RAMWR);
    writedata(R);
    writedata(G);
    writedata(B);
}

//Send Byte
void  xmitbyte(unsigned char dat_a)
{
 	IOWR_ALTERA_AVALON_SPI_TXDATA(0x9000,dat_a);
 //   int tempc;
   //hARDWARE SPI disabled
   ///Software SPI
//   for(tempc=0; tempc<8; tempc++)
   // {
        //SCK = 0;
	//   IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(PORT_0_BASE, SCK);
  //      if(dat_a & 0x80)
  //      	IOWR_ALTERA_AVALON_PIO_SET_BITS(PORT_0_BASE, SDA);
  //      else
     //   	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(PORT_0_BASE, SDA);
       // usleep(10);

   //    dat_a = dat_a<<1;
  // 	IOWR_ALTERA_AVALON_PIO_SET_BITS(PORT_0_BASE, SCK);
 //  }
   	  // usleep(1000);
}

//send command
void writecommand(unsigned char c)
{
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(PORT_0_BASE, A0);
    xmitbyte(c);
}

//send data
void writedata(unsigned char c)
{
	IOWR_ALTERA_AVALON_PIO_SET_BITS(PORT_0_BASE, A0);
    xmitbyte(c);
}
/*******************************************************************************
 End of File
 */
