/*
    __color7_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __color7_driver.h
@brief    Color7 Driver
@mainpage Color7 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   COLOR7
@brief      Color7 Click Driver
@{

| Global Library Prefix | **COLOR7** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **apr 2018.**      |
| Developer             | **Katarina Perenidc**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _COLOR7_H_
#define _COLOR7_H_

/** 
 * @macro T_COLOR7_P
 * @brief Driver Abstract type 
 */
#define T_COLOR7_P    const uint8_t*

/** @defgroup COLOR7_COMPILE Compilation Config */              /** @{ */

//  #define   __COLOR7_DRV_SPI__                            /**<     @macro __COLOR7_DRV_SPI__  @brief SPI driver selector */
   #define   __COLOR7_DRV_I2C__                            /**<     @macro __COLOR7_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __COLOR7_DRV_UART__                           /**<     @macro __COLOR7_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup COLOR7_VAR Variables */                           /** @{ */


/* Register */
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

/* Command Register */
extern const uint8_t _COLOR7_CMD_SELECT;
extern const uint8_t _COLOR7_CMD_REPEATED_BYTE_PROTOCOL;
extern const uint8_t _COLOR7_CMD_AUTO_INCREMENT_PROTOCOL;

/* ENABLE Register */
extern const uint8_t _COLOR7_ENABLE_RGBC_INTERRUPT;
extern const uint8_t _COLOR7_ENABLE_WAIT;
extern const uint8_t _COLOR7_ENABLE_RGBC;
extern const uint8_t _COLOR7_POWER_ON;

/* RGBC Timing Register */
extern const uint8_t _COLOR7_RGBC_TIME_2_4ms;
extern const uint8_t _COLOR7_RGBC_TIME_24ms;
extern const uint8_t _COLOR7_RGBC_TIME_101ms;
extern const uint8_t _COLOR7_RGBC_TIME_154ms;
extern const uint8_t _COLOR7_RGBC_TIME_700ms;

/* Wait Time Register */
extern const uint8_t _COLOR7_WAIT_TIME_W0_2_4ms;
extern const uint8_t _COLOR7_WAIT_TIME_W0_204ms;
extern const uint8_t _COLOR7_WAIT_TIME_W0_614ms;
extern const uint8_t _COLOR7_WAIT_TIME_W1_0_029sec;
extern const uint8_t _COLOR7_WAIT_TIME_W1_2_45sec;
extern const uint8_t _COLOR7_WAIT_TIME_W1_7_4sec;

/* Persistence Register */
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

/* Configuration Register */
extern const uint8_t _COLOR7_CFG_WAIT_LONG;

/* Control Register*/
extern const uint8_t _COLOR7_CTRL_GAIN_x1;
extern const uint8_t _COLOR7_CTRL_GAIN_x4;
extern const uint8_t _COLOR7_CTRL_GAIN_x16;
extern const uint8_t _COLOR7_CTRL_GAIN_x60;

/* Color Register*/
extern const uint8_t _COLOR7_COLOR_DATA_CLEAR;
extern const uint8_t _COLOR7_COLOR_DATA_RED;                                                                          /** @} */
extern const uint8_t _COLOR7_COLOR_DATA_GREEN;
extern const uint8_t _COLOR7_COLOR_DATA_BLUE;

#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup COLOR7_INIT Driver Initialization */              /** @{ */

#ifdef   __COLOR7_DRV_SPI__
void color7_spiDriverInit(T_COLOR7_P gpioObj, T_COLOR7_P spiObj);
#endif
#ifdef   __COLOR7_DRV_I2C__
void color7_i2cDriverInit(T_COLOR7_P gpioObj, T_COLOR7_P i2cObj, uint8_t slave);
#endif
#ifdef   __COLOR7_DRV_UART__
void color7_uartDriverInit(T_COLOR7_P gpioObj, T_COLOR7_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void color7_gpioDriverInit(T_COLOR7_P gpioObj);
                                                                       /** @} */
/** @defgroup COLOR7_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Functions for write one byte in register
 *
 * @param[in] reg    Register in which the data will be written
 * @param[in] _data  Data which be written in the register
 */
void color7_writeByte(uint8_t reg, uint8_t _data);

/**
 * @brief Functions for read data from register
 *
 * @param[in] reg    Register in which the data will be written
 * @retval two byte data which is read from the register
 */
uint16_t color7_readData(uint8_t reg);

/**
 * @brief Functions for read color ratio
 *
 * @param[in] color   color register which be read
 * @retval color ratio data
 *
 * Use this function when reading one color ratio
 */
float color7_readColorRatio(uint8_t color);

/**
 * @brief Functions for read color value
 *
 * @retval Color value in HSL
 *
 * This functions reas 3 color filters and Clear Filters and converts the resulting color from RGBC to HSL
   The color range is between 0.0650 and 1.0000.
 */
float color7_getColorValue();

/**
 * @brief Functions for detect colors
 *
 * @param[in] color_value  color value in HSL
 * @retval Color flag
 *
 * Detect color
      ORANGE color - from 0.992  to 0.999
      RED color    - from 0.9750 to 0.9919
      PINK color   - from 0.920  to 0.9749
      PURPLE color - from 0.6201 to 0.919
      BLUE color   - from 0.521  to 0.6200
      CYAN color   - from 0.4700 to 0.520
      GREEN color  - from 0.210  to 0.469
      YELLOW color - from 0.0650 to 0.209
 */
uint8_t color7_getColor(float color_value);

/**
 * @brief Functions for reads interrupt pin
 *
 * @retval status reading from pins
 */
uint8_t color7_getInterrupt();

                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_Color7_STM.c
    @example Click_Color7_TIVA.c
    @example Click_Color7_CEC.c
    @example Click_Color7_KINETIS.c
    @example Click_Color7_MSP.c
    @example Click_Color7_PIC.c
    @example Click_Color7_PIC32.c
    @example Click_Color7_DSPIC.c
    @example Click_Color7_AVR.c
    @example Click_Color7_FT90x.c
    @example Click_Color7_STM.mbas
    @example Click_Color7_TIVA.mbas
    @example Click_Color7_CEC.mbas
    @example Click_Color7_KINETIS.mbas
    @example Click_Color7_MSP.mbas
    @example Click_Color7_PIC.mbas
    @example Click_Color7_PIC32.mbas
    @example Click_Color7_DSPIC.mbas
    @example Click_Color7_AVR.mbas
    @example Click_Color7_FT90x.mbas
    @example Click_Color7_STM.mpas
    @example Click_Color7_TIVA.mpas
    @example Click_Color7_CEC.mpas
    @example Click_Color7_KINETIS.mpas
    @example Click_Color7_MSP.mpas
    @example Click_Color7_PIC.mpas
    @example Click_Color7_PIC32.mpas
    @example Click_Color7_DSPIC.mpas
    @example Click_Color7_AVR.mpas
    @example Click_Color7_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __color7_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */