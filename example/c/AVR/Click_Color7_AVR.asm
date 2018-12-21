
_systemInit:

;Click_Color7_AVR.c,35 :: 		void systemInit()
;Click_Color7_AVR.c,37 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	CLR        R4
	LDI        R27, 7
	MOV        R3, R27
	CLR        R2
	CALL       _mikrobus_gpioInit+0
;Click_Color7_AVR.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
	LDI        R16, #lo_addr(__COLOR7_I2C_CFG+0)
	LDI        R17, hi_addr(__COLOR7_I2C_CFG+0)
	MOV        R3, R16
	MOV        R4, R17
	CLR        R2
	CALL       _mikrobus_i2cInit+0
;Click_Color7_AVR.c,39 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	LDI        R27, 128
	MOV        R3, R27
	LDI        R27, 37
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOV        R6, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_Color7_AVR.c,40 :: 		mikrobus_logWrite("--- System init --- ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,41 :: 		Delay_ms( 100 );
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_systemInit0:
	DEC        R16
	BRNE       L_systemInit0
	DEC        R17
	BRNE       L_systemInit0
	DEC        R18
	BRNE       L_systemInit0
;Click_Color7_AVR.c,42 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_Color7_AVR.c,44 :: 		void applicationInit()
;Click_Color7_AVR.c,46 :: 		color7_i2cDriverInit( (T_COLOR7_P)&_MIKROBUS1_GPIO, (T_COLOR7_P)&_MIKROBUS1_I2C, 0x29 );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 41
	MOV        R6, R27
	LDI        R27, #lo_addr(__MIKROBUS1_I2C+0)
	MOV        R4, R27
	LDI        R27, hi_addr(__MIKROBUS1_I2C+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _color7_i2cDriverInit+0
;Click_Color7_AVR.c,47 :: 		mikrobus_logWrite("--- Color Init --- ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,49 :: 		_COLOR7_ENABLE_WAIT |
	LDI        R16, __COLOR7_ENABLE_WAIT
	ORI        R16, __COLOR7_ENABLE_RGBC_INTERRUPT
;Click_Color7_AVR.c,50 :: 		_COLOR7_ENABLE_RGBC |
	ORI        R16, __COLOR7_ENABLE_RGBC
;Click_Color7_AVR.c,51 :: 		_COLOR7_POWER_ON );
	ORI        R16, __COLOR7_POWER_ON
	MOV        R3, R16
;Click_Color7_AVR.c,48 :: 		color7_writeByte(_COLOR7_REG_ENABLE, _COLOR7_ENABLE_RGBC_INTERRUPT |
	LDI        R27, __COLOR7_REG_ENABLE
	MOV        R2, R27
;Click_Color7_AVR.c,51 :: 		_COLOR7_POWER_ON );
	CALL       _color7_writeByte+0
;Click_Color7_AVR.c,53 :: 		color7_writeByte(_COLOR7_REG_CONTROL, _COLOR7_CTRL_GAIN_x16);
	LDI        R27, __COLOR7_CTRL_GAIN_x16
	MOV        R3, R27
	LDI        R27, __COLOR7_REG_CONTROL
	MOV        R2, R27
	CALL       _color7_writeByte+0
;Click_Color7_AVR.c,54 :: 		color7_writeByte(_COLOR7_REG_RGBC_TIME, _COLOR7_RGBC_TIME_700ms);
	LDI        R27, __COLOR7_RGBC_TIME_700ms
	MOV        R3, R27
	LDI        R27, __COLOR7_REG_RGBC_TIME
	MOV        R2, R27
	CALL       _color7_writeByte+0
;Click_Color7_AVR.c,55 :: 		mikrobus_logWrite("--- Start measurement --- ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr3_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,56 :: 		}
L_end_applicationInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:

;Click_Color7_AVR.c,58 :: 		void applicationTask()
;Click_Color7_AVR.c,60 :: 		colorValue = color7_getColorValue();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _color7_getColorValue+0
	STS        _colorValue+0, R16
	STS        _colorValue+1, R17
	STS        _colorValue+2, R18
	STS        _colorValue+3, R19
;Click_Color7_AVR.c,61 :: 		isColor = color7_getColor(colorValue);
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _color7_getColor+0
	STS        _isColor+0, R16
;Click_Color7_AVR.c,63 :: 		switch(isColor)
	JMP        L_applicationTask2
;Click_Color7_AVR.c,65 :: 		case 1:
L_applicationTask4:
;Click_Color7_AVR.c,67 :: 		mikrobus_logWrite("--- Light color: ORANGE ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr4_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,68 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,70 :: 		case 2:
L_applicationTask5:
;Click_Color7_AVR.c,72 :: 		mikrobus_logWrite("--- Light color: RED ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr5_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,73 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,75 :: 		case 3:
L_applicationTask6:
;Click_Color7_AVR.c,77 :: 		mikrobus_logWrite("--- Light color: PINK ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr6_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,78 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,80 :: 		case 4:
L_applicationTask7:
;Click_Color7_AVR.c,82 :: 		mikrobus_logWrite("--- Light color: PURPLE ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr7_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr7_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,83 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,85 :: 		case 5:
L_applicationTask8:
;Click_Color7_AVR.c,87 :: 		mikrobus_logWrite("--- Light color: BLUE ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr8_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr8_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,88 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,90 :: 		case 6:
L_applicationTask9:
;Click_Color7_AVR.c,92 :: 		mikrobus_logWrite("--- Light color: CYAN ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr9_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr9_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,93 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,95 :: 		case 7:
L_applicationTask10:
;Click_Color7_AVR.c,97 :: 		mikrobus_logWrite("--- Light color: GREEN ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr10_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr10_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,98 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,100 :: 		case 8:
L_applicationTask11:
;Click_Color7_AVR.c,102 :: 		mikrobus_logWrite("--- Light color: YELLOW ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr11_Click_Color7_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr11_Click_Color7_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Color7_AVR.c,103 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,105 :: 		default:
L_applicationTask12:
;Click_Color7_AVR.c,107 :: 		break;
	JMP        L_applicationTask3
;Click_Color7_AVR.c,109 :: 		}
L_applicationTask2:
	LDS        R16, _isColor+0
	CPI        R16, 1
	BRNE       L__applicationTask18
	JMP        L_applicationTask4
L__applicationTask18:
	LDS        R16, _isColor+0
	CPI        R16, 2
	BRNE       L__applicationTask19
	JMP        L_applicationTask5
L__applicationTask19:
	LDS        R16, _isColor+0
	CPI        R16, 3
	BRNE       L__applicationTask20
	JMP        L_applicationTask6
L__applicationTask20:
	LDS        R16, _isColor+0
	CPI        R16, 4
	BRNE       L__applicationTask21
	JMP        L_applicationTask7
L__applicationTask21:
	LDS        R16, _isColor+0
	CPI        R16, 5
	BRNE       L__applicationTask22
	JMP        L_applicationTask8
L__applicationTask22:
	LDS        R16, _isColor+0
	CPI        R16, 6
	BRNE       L__applicationTask23
	JMP        L_applicationTask9
L__applicationTask23:
	LDS        R16, _isColor+0
	CPI        R16, 7
	BRNE       L__applicationTask24
	JMP        L_applicationTask10
L__applicationTask24:
	LDS        R16, _isColor+0
	CPI        R16, 8
	BRNE       L__applicationTask25
	JMP        L_applicationTask11
L__applicationTask25:
	JMP        L_applicationTask12
L_applicationTask3:
;Click_Color7_AVR.c,110 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_Color7_AVR.c,111 :: 		}
L_end_applicationTask:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_Color7_AVR.c,113 :: 		void main()
;Click_Color7_AVR.c,115 :: 		systemInit();
	CALL       _systemInit+0
;Click_Color7_AVR.c,116 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_Color7_AVR.c,118 :: 		while (1)
L_main13:
;Click_Color7_AVR.c,120 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_Color7_AVR.c,121 :: 		}
	JMP        L_main13
;Click_Color7_AVR.c,122 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
