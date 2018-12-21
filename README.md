![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# Color7 Click

- **CIC Prefix**  : COLOR7
- **Author**      : Katarina Perenidc
- **Verison**     : 1.0.0
- **Date**        : apr 2018.

---

### Software Support

We provide a library for the Color7 Click on our [LibStock](https://libstock.mikroe.com/projects/view/2407/color-7-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library initializes and defines the I2C bus driver and drivers that offer a choice for writing data in register.
The library includes function for configuration chip for measurement, 
function for reads one color ratio and functions for light color value is received by calculating RGBC value and conversions in HSL value.
The user also has the function ```color7_getColor()``` which checks the color of the light.

Key functions :

- ``` void color7_writeByte(uint8_t reg, uint8_t _data) ``` - Functions for write one byte in register
- ``` float color7_getColorValue() ``` -  Functions for read color value in HSL
- ``` uint8_t color7_getColor(float color_value) ``` - Functions for detect colors
- ``` float color7_readColorRatio(uint8_t color) ``` - Functions for read color ratio

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes I2C module
- Application Initialization - Initializes driver init and configuration chip for measurement
- Application Task - (code snippet) - Read light color and check which color of light is detected by the sensor
                                      If the light color is detected, the detected color message is logged on the USBUART.


```.c
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
```

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2407/color-7-click) page.

Other mikroE Libraries used in the example:

- I2C
- UART

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
### Architectures Supported

#### mikroC

| STM | KIN | CEC | MSP | TIVA | PIC | PIC32 | DSPIC | AVR | FT90x |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| x | x | x | x | x | x | x | x | x | x |

#### mikroBasic

| STM | KIN | CEC | MSP | TIVA | PIC | PIC32 | DSPIC | AVR | FT90x |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| x | x | x | x | x | x | x | x | x | x |

#### mikroPascal

| STM | KIN | CEC | MSP | TIVA | PIC | PIC32 | DSPIC | AVR | FT90x |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| x | x | x | x | x | x | x | x | x | x |

---
---
