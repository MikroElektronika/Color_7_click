
_systemInit:

;Click_Color7_PIC.c,35 :: 		void systemInit()
;Click_Color7_PIC.c,37 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	MOVLW       7
	MOVWF       FARG_mikrobus_gpioInit_pin+0 
	MOVLW       1
	MOVWF       FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Click_Color7_PIC.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
	CLRF        FARG_mikrobus_i2cInit_bus+0 
	MOVLW       __COLOR7_I2C_CFG+0
	MOVWF       FARG_mikrobus_i2cInit_cfg+0 
	MOVLW       hi_addr(__COLOR7_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+1 
	MOVLW       higher_addr(__COLOR7_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+2 
	CALL        _mikrobus_i2cInit+0, 0
;Click_Color7_PIC.c,39 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	MOVLW       16
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_Color7_PIC.c,40 :: 		mikrobus_logWrite("--- System init --- ", _LOG_LINE);
	MOVLW       ?lstr1_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,41 :: 		Delay_ms( 100 );
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_systemInit0:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit0
	DECFSZ      R12, 1, 1
	BRA         L_systemInit0
	DECFSZ      R11, 1, 1
	BRA         L_systemInit0
	NOP
;Click_Color7_PIC.c,42 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_Color7_PIC.c,44 :: 		void applicationInit()
;Click_Color7_PIC.c,46 :: 		color7_i2cDriverInit( (T_COLOR7_P)&_MIKROBUS1_GPIO, (T_COLOR7_P)&_MIKROBUS1_I2C, 0x29 );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_color7_i2cDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_color7_i2cDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_color7_i2cDriverInit_gpioObj+2 
	MOVLW       __MIKROBUS1_I2C+0
	MOVWF       FARG_color7_i2cDriverInit_i2cObj+0 
	MOVLW       hi_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_color7_i2cDriverInit_i2cObj+1 
	MOVLW       higher_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_color7_i2cDriverInit_i2cObj+2 
	MOVLW       41
	MOVWF       FARG_color7_i2cDriverInit_slave+0 
	CALL        _color7_i2cDriverInit+0, 0
;Click_Color7_PIC.c,47 :: 		mikrobus_logWrite("--- Color Init --- ", _LOG_LINE);
	MOVLW       ?lstr2_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,48 :: 		color7_writeByte(_COLOR7_REG_ENABLE, _COLOR7_ENABLE_RGBC_INTERRUPT |
	MOVLW       __COLOR7_REG_ENABLE
	MOVWF       FARG_color7_writeByte_reg+0 
;Click_Color7_PIC.c,49 :: 		_COLOR7_ENABLE_WAIT |
	MOVLW       __COLOR7_ENABLE_RGBC_INTERRUPT
	MOVWF       R0 
	MOVLW       __COLOR7_ENABLE_WAIT
	IORWF       R0, 0 
	MOVWF       FARG_color7_writeByte__data+0 
;Click_Color7_PIC.c,50 :: 		_COLOR7_ENABLE_RGBC |
	MOVLW       __COLOR7_ENABLE_RGBC
	IORWF       FARG_color7_writeByte__data+0, 1 
;Click_Color7_PIC.c,51 :: 		_COLOR7_POWER_ON );
	MOVLW       __COLOR7_POWER_ON
	IORWF       FARG_color7_writeByte__data+0, 1 
	CALL        _color7_writeByte+0, 0
;Click_Color7_PIC.c,53 :: 		color7_writeByte(_COLOR7_REG_CONTROL, _COLOR7_CTRL_GAIN_x16);
	MOVLW       __COLOR7_REG_CONTROL
	MOVWF       FARG_color7_writeByte_reg+0 
	MOVLW       __COLOR7_CTRL_GAIN_x16
	MOVWF       FARG_color7_writeByte__data+0 
	CALL        _color7_writeByte+0, 0
;Click_Color7_PIC.c,54 :: 		color7_writeByte(_COLOR7_REG_RGBC_TIME, _COLOR7_RGBC_TIME_700ms);
	MOVLW       __COLOR7_REG_RGBC_TIME
	MOVWF       FARG_color7_writeByte_reg+0 
	MOVLW       __COLOR7_RGBC_TIME_700ms
	MOVWF       FARG_color7_writeByte__data+0 
	CALL        _color7_writeByte+0, 0
;Click_Color7_PIC.c,55 :: 		mikrobus_logWrite("--- Start measurement --- ", _LOG_LINE);
	MOVLW       ?lstr3_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr3_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,56 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_Color7_PIC.c,58 :: 		void applicationTask()
;Click_Color7_PIC.c,60 :: 		colorValue = color7_getColorValue();
	CALL        _color7_getColorValue+0, 0
	MOVF        R0, 0 
	MOVWF       _colorValue+0 
	MOVF        R1, 0 
	MOVWF       _colorValue+1 
	MOVF        R2, 0 
	MOVWF       _colorValue+2 
	MOVF        R3, 0 
	MOVWF       _colorValue+3 
;Click_Color7_PIC.c,61 :: 		isColor = color7_getColor(colorValue);
	MOVF        R0, 0 
	MOVWF       FARG_color7_getColor_color_value+0 
	MOVF        R1, 0 
	MOVWF       FARG_color7_getColor_color_value+1 
	MOVF        R2, 0 
	MOVWF       FARG_color7_getColor_color_value+2 
	MOVF        R3, 0 
	MOVWF       FARG_color7_getColor_color_value+3 
	CALL        _color7_getColor+0, 0
	MOVF        R0, 0 
	MOVWF       _isColor+0 
;Click_Color7_PIC.c,63 :: 		switch(isColor)
	GOTO        L_applicationTask1
;Click_Color7_PIC.c,65 :: 		case 1:
L_applicationTask3:
;Click_Color7_PIC.c,67 :: 		mikrobus_logWrite("--- Light color: ORANGE ", _LOG_LINE);
	MOVLW       ?lstr4_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr4_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,68 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,70 :: 		case 2:
L_applicationTask4:
;Click_Color7_PIC.c,72 :: 		mikrobus_logWrite("--- Light color: RED ", _LOG_LINE);
	MOVLW       ?lstr5_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr5_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,73 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,75 :: 		case 3:
L_applicationTask5:
;Click_Color7_PIC.c,77 :: 		mikrobus_logWrite("--- Light color: PINK ", _LOG_LINE);
	MOVLW       ?lstr6_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr6_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,78 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,80 :: 		case 4:
L_applicationTask6:
;Click_Color7_PIC.c,82 :: 		mikrobus_logWrite("--- Light color: PURPLE ", _LOG_LINE);
	MOVLW       ?lstr7_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr7_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,83 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,85 :: 		case 5:
L_applicationTask7:
;Click_Color7_PIC.c,87 :: 		mikrobus_logWrite("--- Light color: BLUE ", _LOG_LINE);
	MOVLW       ?lstr8_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr8_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,88 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,90 :: 		case 6:
L_applicationTask8:
;Click_Color7_PIC.c,92 :: 		mikrobus_logWrite("--- Light color: CYAN ", _LOG_LINE);
	MOVLW       ?lstr9_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr9_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,93 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,95 :: 		case 7:
L_applicationTask9:
;Click_Color7_PIC.c,97 :: 		mikrobus_logWrite("--- Light color: GREEN ", _LOG_LINE);
	MOVLW       ?lstr10_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr10_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,98 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,100 :: 		case 8:
L_applicationTask10:
;Click_Color7_PIC.c,102 :: 		mikrobus_logWrite("--- Light color: YELLOW ", _LOG_LINE);
	MOVLW       ?lstr11_Click_Color7_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr11_Click_Color7_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Color7_PIC.c,103 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,105 :: 		default:
L_applicationTask11:
;Click_Color7_PIC.c,107 :: 		break;
	GOTO        L_applicationTask2
;Click_Color7_PIC.c,109 :: 		}
L_applicationTask1:
	MOVF        _isColor+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask3
	MOVF        _isColor+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask4
	MOVF        _isColor+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask5
	MOVF        _isColor+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask6
	MOVF        _isColor+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask7
	MOVF        _isColor+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask8
	MOVF        _isColor+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask9
	MOVF        _isColor+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask10
	GOTO        L_applicationTask11
L_applicationTask2:
;Click_Color7_PIC.c,110 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_Color7_PIC.c,111 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_Color7_PIC.c,113 :: 		void main()
;Click_Color7_PIC.c,115 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_Color7_PIC.c,116 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_Color7_PIC.c,118 :: 		while (1)
L_main12:
;Click_Color7_PIC.c,120 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_Color7_PIC.c,121 :: 		}
	GOTO        L_main12
;Click_Color7_PIC.c,122 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
