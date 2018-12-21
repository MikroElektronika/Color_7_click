/*
Example for Color7 Click

    Date          : apr 2018.
    Author        : Katarina Perenidc

Test configuration FT90x :
    
    MCU                : FT900
    Dev. Board         : EasyFT90x v7 
    FT90x Compiler ver : v2.2.1.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes I2C module
- Application Initialization - Initializes driver init and configuration chip for measurement
- Application Task - (code snippet) - Read light color and check which color of light is detected by the sensor
                                      If the light color is detected, the detected color message is logged on the USBUART.

*/

#include "Click_Color7_types.h"
#include "Click_Color7_config.h"

uint8_t isColor = 0;
float colorValue;
char dataText[ 20 ];

void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
    mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
    mikrobus_logInit( _LOG_USBUART, 9600 );
    mikrobus_logWrite("--- System init --- ", _LOG_LINE);
    Delay_ms( 100 );
}

void applicationInit()
{
    color7_i2cDriverInit( (T_COLOR7_P)&_MIKROBUS1_GPIO, (T_COLOR7_P)&_MIKROBUS1_I2C, 0x29 );
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
            mikrobus_logWrite("--- Color: ORANGE ", _LOG_LINE);
            break;
        }
        case 2:
        {
            mikrobus_logWrite("--- Color: RED ", _LOG_LINE);
            break;
        }
        case 3:
        {
            mikrobus_logWrite("--- Color: PINK ", _LOG_LINE);
            break;
        }
        case 4:
        {
            mikrobus_logWrite("--- Color: PURPLE ", _LOG_LINE);
            break;
        }
        case 5:
        {
            mikrobus_logWrite("--- Color: BLUE ", _LOG_LINE);
            break;
        }
        case 6:
        {
            mikrobus_logWrite("--- Color: CYAN ", _LOG_LINE);
            break;
        }
        case 7:
        {
            mikrobus_logWrite("--- Color: GREEN ", _LOG_LINE);
            break;
        }
        case 8:
        {
            mikrobus_logWrite("--- Color: YELLOW ", _LOG_LINE);
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