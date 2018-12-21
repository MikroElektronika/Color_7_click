#line 1 "D:/Clicks_git/Color_7_Click/SW/example/c/ARM/STM/Click_Color7_STM.c"
#line 1 "d:/clicks_git/color_7_click/sw/example/c/arm/stm/click_color7_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/clicks_git/color_7_click/sw/example/c/arm/stm/click_color7_config.h"
#line 1 "d:/clicks_git/color_7_click/sw/example/c/arm/stm/click_color7_types.h"
#line 3 "d:/clicks_git/color_7_click/sw/example/c/arm/stm/click_color7_config.h"
const uint32_t _COLOR7_I2C_CFG[ 1 ] =
{
 100000
};
#line 1 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 59 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
extern const uint8_t _COLOR7_REG_ENABLE;
extern const uint8_t _COLOR7_REG_RGBC_TIME;
extern const uint8_t _COLOR7_REG_WAIT_TIME;
extern const uint8_t _COLOR7_REG_AILTL;
extern const uint8_t _COLOR7_REG_AILTH;
extern const uint8_t _COLOR7_REG_AIHTL;
extern const uint8_t _COLOR7_REG_AIHTH;
extern const uint8_t _COLOR7_REG_PERS;
extern const uint8_t _COLOR7_REG_CONFIGURATION;
extern const uint8_t _COLOR7_REG_CONTROL;
extern const uint8_t _COLOR7_REG_DEVICE_ID;
extern const uint8_t _COLOR7_REG_DEVICE_STATUS;
extern const uint8_t _COLOR7_REG_CLEAR_DATA_LOW;
extern const uint8_t _COLOR7_REG_CLEAR_DATA_HIGH;
extern const uint8_t _COLOR7_REG_RED_DATA_LOW;
extern const uint8_t _COLOR7_REG_RED_DATA_HIGH;
extern const uint8_t _COLOR7_REG_GREEN_DATA_LOW;
extern const uint8_t _COLOR7_REG_GREEN_DATA_HIGH;
extern const uint8_t _COLOR7_REG_BLUE_DATA_LOW;
extern const uint8_t _COLOR7_REG_BLUE_DATA_HIGH;


extern const uint8_t _COLOR7_CMD_SELECT;
extern const uint8_t _COLOR7_CMD_REPEATED_BYTE_PROTOCOL;
extern const uint8_t _COLOR7_CMD_AUTO_INCREMENT_PROTOCOL;


extern const uint8_t _COLOR7_ENABLE_RGBC_INTERRUPT;
extern const uint8_t _COLOR7_ENABLE_WAIT;
extern const uint8_t _COLOR7_ENABLE_RGBC;
extern const uint8_t _COLOR7_POWER_ON;


extern const uint8_t _COLOR7_RGBC_TIME_2_4ms;
extern const uint8_t _COLOR7_RGBC_TIME_24ms;
extern const uint8_t _COLOR7_RGBC_TIME_101ms;
extern const uint8_t _COLOR7_RGBC_TIME_154ms;
extern const uint8_t _COLOR7_RGBC_TIME_700ms;


extern const uint8_t _COLOR7_WAIT_TIME_W0_2_4ms;
extern const uint8_t _COLOR7_WAIT_TIME_W0_204ms;
extern const uint8_t _COLOR7_WAIT_TIME_W0_614ms;
extern const uint8_t _COLOR7_WAIT_TIME_W1_0_029sec;
extern const uint8_t _COLOR7_WAIT_TIME_W1_2_45sec;
extern const uint8_t _COLOR7_WAIT_TIME_W1_7_4sec;


extern const uint8_t _COLOR7_PERS_EVERY_RGBC;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_1;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_2;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_3;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_5;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_10;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_15;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_20;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_25;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_30;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_35;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_40;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_45;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_50;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_55;
extern const uint8_t _COLOR7_PERS_CLEAR_CH_60;


extern const uint8_t _COLOR7_CFG_WAIT_LONG;


extern const uint8_t _COLOR7_CTRL_GAIN_x1;
extern const uint8_t _COLOR7_CTRL_GAIN_x4;
extern const uint8_t _COLOR7_CTRL_GAIN_x16;
extern const uint8_t _COLOR7_CTRL_GAIN_x60;


extern const uint8_t _COLOR7_COLOR_DATA_CLEAR;
extern const uint8_t _COLOR7_COLOR_DATA_RED;
extern const uint8_t _COLOR7_COLOR_DATA_GREEN;
extern const uint8_t _COLOR7_COLOR_DATA_BLUE;
#line 149 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
void color7_i2cDriverInit( const uint8_t*  gpioObj,  const uint8_t*  i2cObj, uint8_t slave);
#line 156 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
void color7_gpioDriverInit( const uint8_t*  gpioObj);
#line 166 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
void color7_writeByte(uint8_t reg, uint8_t _data);
#line 174 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
uint16_t color7_readData(uint8_t reg);
#line 184 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
float color7_readColorRatio(uint8_t color);
#line 194 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
float color7_getColorValue();
#line 212 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
uint8_t color7_getColor(float color_value);
#line 219 "d:/clicks_git/color_7_click/sw/library/__color7_driver.h"
uint8_t color7_getInterrupt();
#line 31 "D:/Clicks_git/Color_7_Click/SW/example/c/ARM/STM/Click_Color7_STM.c"
uint8_t isColor = 0;
float colorValue;
char dataText[ 20 ];

void systemInit()
{
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
 mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
 mikrobus_logInit( _LOG_USBUART_A, 9600 );
 mikrobus_logWrite("--- System init --- ", _LOG_LINE);
 Delay_ms( 100 );
}

void applicationInit()
{
 color7_i2cDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_I2C, 0x29 );
 mikrobus_logWrite("--- Color Init --- ", _LOG_LINE);
 color7_writeByte(_COLOR7_REG_ENABLE, _COLOR7_ENABLE_RGBC_INTERRUPT |
 _COLOR7_ENABLE_WAIT |
 _COLOR7_ENABLE_RGBC |
 _COLOR7_POWER_ON );

 color7_writeByte(_COLOR7_REG_CONTROL, _COLOR7_CTRL_GAIN_x16);
 color7_writeByte(_COLOR7_REG_RGBC_TIME, _COLOR7_RGBC_TIME_700ms);
 mikrobus_logWrite("--- Start measurement --- ", _LOG_LINE);
}

void applicationTask()
{
 colorValue = color7_getColorValue();
 isColor = color7_getColor(colorValue);

 switch(isColor)
 {
 case 1:
 {
 mikrobus_logWrite("--- Light color: ORANGE ", _LOG_LINE);
 break;
 }
 case 2:
 {
 mikrobus_logWrite("--- Light color: RED ", _LOG_LINE);
 break;
 }
 case 3:
 {
 mikrobus_logWrite("--- Light color: PINK ", _LOG_LINE);
 break;
 }
 case 4:
 {
 mikrobus_logWrite("--- Light color: PURPLE ", _LOG_LINE);
 break;
 }
 case 5:
 {
 mikrobus_logWrite("--- Light color: BLUE ", _LOG_LINE);
 break;
 }
 case 6:
 {
 mikrobus_logWrite("--- Light color: CYAN ", _LOG_LINE);
 break;
 }
 case 7:
 {
 mikrobus_logWrite("--- Light color: GREEN ", _LOG_LINE);
 break;
 }
 case 8:
 {
 mikrobus_logWrite("--- Light color: YELLOW ", _LOG_LINE);
 break;
 }
 default:
 {
 break;
 }
 }
 Delay_100ms();
}

void main()
{
 systemInit();
 applicationInit();

 while (1)
 {
 applicationTask();
 }
}
