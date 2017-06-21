/*
 * lcd.h
 *
 *  Created on: May 22, 2017
 *      Author: Anand
 */
#include "altera_avalon_pio_regs.h"
#include "count_binary.h"

#define BYTE unsigned char

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 160


#define ST7735_NOP 0x0
#define ST7735_SWRESET 0x01
#define ST7735_RDDID 0x04
#define ST7735_RDDST 0x09

#define ST7735_SLPIN  0x10
#define ST7735_SLPOUT  0x11
#define ST7735_PTLON  0x12
#define ST7735_NORON  0x13

#define ST7735_INVOFF 0x20
#define ST7735_INVON 0x21
#define ST7735_DISPOFF 0x28
#define ST7735_DISPON 0x29
#define ST7735_CASET 0x2A
#define ST7735_RASET 0x2B
#define ST7735_RAMWR 0x2C
#define ST7735_RAMRD 0x2E

#define ST7735_COLMOD 0x3A
#define ST7735_MADCTL 0x36


#define ST7735_FRMCTR1 0xB1
#define ST7735_FRMCTR2 0xB2
#define ST7735_FRMCTR3 0xB3
#define ST7735_INVCTR 0xB4
#define ST7735_DISSET5 0xB6

#define ST7735_PWCTR1 0xC0
#define ST7735_PWCTR2 0xC1
#define ST7735_PWCTR3 0xC2
#define ST7735_PWCTR4 0xC3
#define ST7735_PWCTR5 0xC4
#define ST7735_VMCTR1 0xC5

#define ST7735_RDID1 0xDA
#define ST7735_RDID2 0xDB
#define ST7735_RDID3 0xDC
#define ST7735_RDID4 0xDD

#define ST7735_PWCTR6 0xFC

#define ST7735_GMCTRP1 0xE0
#define ST7735_GMCTRN1 0xE1

/////////////////////////////
#define BIT7 0x00080
#define BIT6 0x00040
#define BIT5 0x00020
#define BIT4 0x00010
#define BIT3 0x00008
#define BIT2 0x00004
#define BIT1 0x00002
#define BIT0 0x00001

//LCD Pins
#define SCK BIT0
#define SDA BIT1
#define A0 BIT2
#define RST BIT3

#define PORT_0_BASE 0x9020


//function proto
void init_ports(void);
void send_char(char);
void send_msg(char*);
void init_SPI();

void  xmitbyte(unsigned char dat_a);
void writecommand(unsigned char c);
void writedata(unsigned char c);
void setpixel(BYTE x, BYTE y, BYTE R, BYTE G, BYTE B);
void DelayMs(unsigned int delay);
