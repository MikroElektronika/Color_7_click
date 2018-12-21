_systemInit:
;Click_Color7_STM.c,35 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Color7_STM.c,37 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Color7_STM.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
MOVW	R0, #lo_addr(__COLOR7_I2C_CFG+0)
MOVT	R0, #hi_addr(__COLOR7_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_i2cInit+0
;Click_Color7_STM.c,39 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
MOVW	R1, #9600
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_Color7_STM.c,40 :: 		mikrobus_logWrite("--- System init --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,41 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_Color7_STM.c,42 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_Color7_STM.c,44 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Color7_STM.c,46 :: 		color7_i2cDriverInit( (T_COLOR7_P)&_MIKROBUS1_GPIO, (T_COLOR7_P)&_MIKROBUS1_I2C, 0x29 );
MOVS	R2, #41
MOVW	R1, #lo_addr(__MIKROBUS1_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS1_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_color7_i2cDriverInit+0
;Click_Color7_STM.c,47 :: 		mikrobus_logWrite("--- Color Init --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,49 :: 		_COLOR7_ENABLE_WAIT |
MOVS	R0, __COLOR7_ENABLE_RGBC_INTERRUPT
ORR	R0, R0, __COLOR7_ENABLE_WAIT
UXTB	R0, R0
;Click_Color7_STM.c,50 :: 		_COLOR7_ENABLE_RGBC |
ORR	R0, R0, __COLOR7_ENABLE_RGBC
UXTB	R0, R0
;Click_Color7_STM.c,51 :: 		_COLOR7_POWER_ON );
ORR	R0, R0, __COLOR7_POWER_ON
UXTB	R1, R0
;Click_Color7_STM.c,48 :: 		color7_writeByte(_COLOR7_REG_ENABLE, _COLOR7_ENABLE_RGBC_INTERRUPT |
MOVS	R0, __COLOR7_REG_ENABLE
;Click_Color7_STM.c,51 :: 		_COLOR7_POWER_ON );
BL	_color7_writeByte+0
;Click_Color7_STM.c,53 :: 		color7_writeByte(_COLOR7_REG_CONTROL, _COLOR7_CTRL_GAIN_x16);
MOVS	R1, __COLOR7_CTRL_GAIN_x16
MOVS	R0, __COLOR7_REG_CONTROL
BL	_color7_writeByte+0
;Click_Color7_STM.c,54 :: 		color7_writeByte(_COLOR7_REG_RGBC_TIME, _COLOR7_RGBC_TIME_700ms);
MOVS	R1, __COLOR7_RGBC_TIME_700ms
MOVS	R0, __COLOR7_REG_RGBC_TIME
BL	_color7_writeByte+0
;Click_Color7_STM.c,55 :: 		mikrobus_logWrite("--- Start measurement --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr3_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,56 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_Color7_STM.c,58 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Color7_STM.c,60 :: 		colorValue = color7_getColorValue();
BL	_color7_getColorValue+0
MOVW	R1, #lo_addr(_colorValue+0)
MOVT	R1, #hi_addr(_colorValue+0)
STR	R0, [R1, #0]
;Click_Color7_STM.c,61 :: 		isColor = color7_getColor(colorValue);
BL	_color7_getColor+0
MOVW	R1, #lo_addr(_isColor+0)
MOVT	R1, #hi_addr(_isColor+0)
STRB	R0, [R1, #0]
;Click_Color7_STM.c,63 :: 		switch(isColor)
IT	AL
BAL	L_applicationTask2
;Click_Color7_STM.c,65 :: 		case 1:
L_applicationTask4:
;Click_Color7_STM.c,67 :: 		mikrobus_logWrite("--- Light color: ORANGE ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr4_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,68 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,70 :: 		case 2:
L_applicationTask5:
;Click_Color7_STM.c,72 :: 		mikrobus_logWrite("--- Light color: RED ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr5_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr5_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,73 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,75 :: 		case 3:
L_applicationTask6:
;Click_Color7_STM.c,77 :: 		mikrobus_logWrite("--- Light color: PINK ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr6_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr6_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,78 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,80 :: 		case 4:
L_applicationTask7:
;Click_Color7_STM.c,82 :: 		mikrobus_logWrite("--- Light color: PURPLE ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr7_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr7_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,83 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,85 :: 		case 5:
L_applicationTask8:
;Click_Color7_STM.c,87 :: 		mikrobus_logWrite("--- Light color: BLUE ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr8_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr8_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,88 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,90 :: 		case 6:
L_applicationTask9:
;Click_Color7_STM.c,92 :: 		mikrobus_logWrite("--- Light color: CYAN ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr9_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr9_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,93 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,95 :: 		case 7:
L_applicationTask10:
;Click_Color7_STM.c,97 :: 		mikrobus_logWrite("--- Light color: GREEN ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr10_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr10_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,98 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,100 :: 		case 8:
L_applicationTask11:
;Click_Color7_STM.c,102 :: 		mikrobus_logWrite("--- Light color: YELLOW ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr11_Click_Color7_STM+0)
MOVT	R0, #hi_addr(?lstr11_Click_Color7_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Color7_STM.c,103 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,105 :: 		default:
L_applicationTask12:
;Click_Color7_STM.c,107 :: 		break;
IT	AL
BAL	L_applicationTask3
;Click_Color7_STM.c,109 :: 		}
L_applicationTask2:
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_applicationTask4
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_applicationTask5
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_applicationTask6
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_applicationTask7
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_applicationTask8
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_applicationTask9
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_applicationTask10
MOVW	R0, #lo_addr(_isColor+0)
MOVT	R0, #hi_addr(_isColor+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_applicationTask11
IT	AL
BAL	L_applicationTask12
L_applicationTask3:
;Click_Color7_STM.c,110 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_Color7_STM.c,111 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_Color7_STM.c,113 :: 		void main()
;Click_Color7_STM.c,115 :: 		systemInit();
BL	_systemInit+0
;Click_Color7_STM.c,116 :: 		applicationInit();
BL	_applicationInit+0
;Click_Color7_STM.c,118 :: 		while (1)
L_main13:
;Click_Color7_STM.c,120 :: 		applicationTask();
BL	_applicationTask+0
;Click_Color7_STM.c,121 :: 		}
IT	AL
BAL	L_main13
;Click_Color7_STM.c,122 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
