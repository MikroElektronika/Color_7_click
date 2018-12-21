_systemInit:
;Click_Color7_PIC32.c,35 :: 		void systemInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Click_Color7_PIC32.c,37 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 1
ORI	R26, R0, 7
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;Click_Color7_PIC32.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
LUI	R2, hi_addr(__COLOR7_I2C_CFG+0)
ORI	R2, R2, lo_addr(__COLOR7_I2C_CFG+0)
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_i2cInit+0
NOP	
;Click_Color7_PIC32.c,39 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
ORI	R26, R0, 9600
ORI	R25, R0, 32
JAL	_mikrobus_logInit+0
NOP	
;Click_Color7_PIC32.c,40 :: 		mikrobus_logWrite("--- System init --- ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr1_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,41 :: 		Delay_ms( 100 );
LUI	R24, 40
ORI	R24, R24, 45226
L_systemInit0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_systemInit0
NOP	
;Click_Color7_PIC32.c,42 :: 		}
L_end_systemInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_Color7_PIC32.c,44 :: 		void applicationInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Click_Color7_PIC32.c,46 :: 		color7_i2cDriverInit( (T_COLOR7_P)&_MIKROBUS1_GPIO, (T_COLOR7_P)&_MIKROBUS1_I2C, 0x29 );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 41
LUI	R26, hi_addr(__MIKROBUS1_I2C+0)
ORI	R26, R26, lo_addr(__MIKROBUS1_I2C+0)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_color7_i2cDriverInit+0
NOP	
;Click_Color7_PIC32.c,47 :: 		mikrobus_logWrite("--- Color Init --- ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr2_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,49 :: 		_COLOR7_ENABLE_WAIT |
ORI	R2, R0, __COLOR7_ENABLE_RGBC_INTERRUPT
ORI	R2, R2, __COLOR7_ENABLE_WAIT
;Click_Color7_PIC32.c,50 :: 		_COLOR7_ENABLE_RGBC |
ORI	R2, R2, __COLOR7_ENABLE_RGBC
;Click_Color7_PIC32.c,51 :: 		_COLOR7_POWER_ON );
ORI	R2, R2, __COLOR7_POWER_ON
ANDI	R26, R2, 255
;Click_Color7_PIC32.c,48 :: 		color7_writeByte(_COLOR7_REG_ENABLE, _COLOR7_ENABLE_RGBC_INTERRUPT |
ORI	R25, R0, __COLOR7_REG_ENABLE
;Click_Color7_PIC32.c,51 :: 		_COLOR7_POWER_ON );
JAL	_color7_writeByte+0
NOP	
;Click_Color7_PIC32.c,53 :: 		color7_writeByte(_COLOR7_REG_CONTROL, _COLOR7_CTRL_GAIN_x16);
ORI	R26, R0, __COLOR7_CTRL_GAIN_x16
ORI	R25, R0, __COLOR7_REG_CONTROL
JAL	_color7_writeByte+0
NOP	
;Click_Color7_PIC32.c,54 :: 		color7_writeByte(_COLOR7_REG_RGBC_TIME, _COLOR7_RGBC_TIME_700ms);
ORI	R26, R0, __COLOR7_RGBC_TIME_700ms
ORI	R25, R0, __COLOR7_REG_RGBC_TIME
JAL	_color7_writeByte+0
NOP	
;Click_Color7_PIC32.c,55 :: 		mikrobus_logWrite("--- Start measurement --- ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr3_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr3_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,56 :: 		}
L_end_applicationInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_Color7_PIC32.c,58 :: 		void applicationTask()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_Color7_PIC32.c,60 :: 		colorValue = color7_getColorValue();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_color7_getColorValue+0
NOP	
SW	R2, Offset(_colorValue+0)(GP)
;Click_Color7_PIC32.c,61 :: 		isColor = color7_getColor(colorValue);
MOVZ	R25, R2, R0
JAL	_color7_getColor+0
NOP	
SB	R2, Offset(_isColor+0)(GP)
;Click_Color7_PIC32.c,63 :: 		switch(isColor)
J	L_applicationTask2
NOP	
;Click_Color7_PIC32.c,65 :: 		case 1:
L_applicationTask4:
;Click_Color7_PIC32.c,67 :: 		mikrobus_logWrite("--- Light color: ORANGE ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr4_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr4_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,68 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,70 :: 		case 2:
L_applicationTask5:
;Click_Color7_PIC32.c,72 :: 		mikrobus_logWrite("--- Light color: RED ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr5_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr5_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,73 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,75 :: 		case 3:
L_applicationTask6:
;Click_Color7_PIC32.c,77 :: 		mikrobus_logWrite("--- Light color: PINK ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr6_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr6_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,78 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,80 :: 		case 4:
L_applicationTask7:
;Click_Color7_PIC32.c,82 :: 		mikrobus_logWrite("--- Light color: PURPLE ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr7_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr7_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,83 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,85 :: 		case 5:
L_applicationTask8:
;Click_Color7_PIC32.c,87 :: 		mikrobus_logWrite("--- Light color: BLUE ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr8_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr8_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,88 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,90 :: 		case 6:
L_applicationTask9:
;Click_Color7_PIC32.c,92 :: 		mikrobus_logWrite("--- Light color: CYAN ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr9_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr9_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,93 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,95 :: 		case 7:
L_applicationTask10:
;Click_Color7_PIC32.c,97 :: 		mikrobus_logWrite("--- Light color: GREEN ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr10_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr10_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,98 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,100 :: 		case 8:
L_applicationTask11:
;Click_Color7_PIC32.c,102 :: 		mikrobus_logWrite("--- Light color: YELLOW ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr11_Click_Color7_PIC32+0)
ORI	R25, R25, lo_addr(?lstr11_Click_Color7_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Color7_PIC32.c,103 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,105 :: 		default:
L_applicationTask12:
;Click_Color7_PIC32.c,107 :: 		break;
J	L_applicationTask3
NOP	
;Click_Color7_PIC32.c,109 :: 		}
L_applicationTask2:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__applicationTask19
NOP	
J	L_applicationTask4
NOP	
L__applicationTask19:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__applicationTask21
NOP	
J	L_applicationTask5
NOP	
L__applicationTask21:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__applicationTask23
NOP	
J	L_applicationTask6
NOP	
L__applicationTask23:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__applicationTask25
NOP	
J	L_applicationTask7
NOP	
L__applicationTask25:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__applicationTask27
NOP	
J	L_applicationTask8
NOP	
L__applicationTask27:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__applicationTask29
NOP	
J	L_applicationTask9
NOP	
L__applicationTask29:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__applicationTask31
NOP	
J	L_applicationTask10
NOP	
L__applicationTask31:
LBU	R3, Offset(_isColor+0)(GP)
ORI	R2, R0, 8
BNE	R3, R2, L__applicationTask33
NOP	
J	L_applicationTask11
NOP	
L__applicationTask33:
J	L_applicationTask12
NOP	
L_applicationTask3:
;Click_Color7_PIC32.c,110 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_Color7_PIC32.c,111 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_Color7_PIC32.c,113 :: 		void main()
;Click_Color7_PIC32.c,115 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_Color7_PIC32.c,116 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_Color7_PIC32.c,118 :: 		while (1)
L_main13:
;Click_Color7_PIC32.c,120 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_Color7_PIC32.c,121 :: 		}
J	L_main13
NOP	
;Click_Color7_PIC32.c,122 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
