
_systemInit:

;Click_Color7_DSPIC.c,35 :: 		void systemInit()
;Click_Color7_DSPIC.c,37 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#1, W12
	MOV.B	#7, W11
	CLR	W10
	CALL	_mikrobus_gpioInit
;Click_Color7_DSPIC.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_COLOR7_I2C_CFG[0] );
	MOV	#lo_addr(__COLOR7_I2C_CFG), W0
	MOV	W0, W11
	CLR	W10
	CALL	_mikrobus_i2cInit
;Click_Color7_DSPIC.c,39 :: 		mikrobus_logInit( _MIKROBUS2, 9600 );
	MOV	#9600, W11
	MOV	#0, W12
	MOV.B	#1, W10
	CALL	_mikrobus_logInit
;Click_Color7_DSPIC.c,40 :: 		mikrobus_logWrite("--- System init --- ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr1_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,41 :: 		Delay_ms( 100 );
	MOV	#2, W8
	MOV	#14464, W7
L_systemInit0:
	DEC	W7
	BRA NZ	L_systemInit0
	DEC	W8
	BRA NZ	L_systemInit0
	NOP
	NOP
;Click_Color7_DSPIC.c,42 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_Color7_DSPIC.c,44 :: 		void applicationInit()
;Click_Color7_DSPIC.c,46 :: 		color7_i2cDriverInit( (T_COLOR7_P)&_MIKROBUS1_GPIO, (T_COLOR7_P)&_MIKROBUS1_I2C, 0x29 );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#41, W12
	MOV	#lo_addr(__MIKROBUS1_I2C), W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_color7_i2cDriverInit
;Click_Color7_DSPIC.c,47 :: 		mikrobus_logWrite("--- Color Init --- ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr2_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,49 :: 		_COLOR7_ENABLE_WAIT |
	MOV	#__COLOR7_ENABLE_RGBC_INTERRUPT, W1
	MOV	#__COLOR7_ENABLE_WAIT, W0
	IOR	W1, W0, W1
;Click_Color7_DSPIC.c,50 :: 		_COLOR7_ENABLE_RGBC |
	MOV	#__COLOR7_ENABLE_RGBC, W0
	IOR	W1, W0, W1
;Click_Color7_DSPIC.c,51 :: 		_COLOR7_POWER_ON );
	MOV	#__COLOR7_POWER_ON, W0
	IOR	W1, W0, W0
	MOV.B	W0, W11
;Click_Color7_DSPIC.c,48 :: 		color7_writeByte(_COLOR7_REG_ENABLE, _COLOR7_ENABLE_RGBC_INTERRUPT |
	MOV.B	#__COLOR7_REG_ENABLE, W10
;Click_Color7_DSPIC.c,51 :: 		_COLOR7_POWER_ON );
	CALL	_color7_writeByte
;Click_Color7_DSPIC.c,53 :: 		color7_writeByte(_COLOR7_REG_CONTROL, _COLOR7_CTRL_GAIN_x16);
	MOV.B	#__COLOR7_CTRL_GAIN_x16, W11
	MOV.B	#__COLOR7_REG_CONTROL, W10
	CALL	_color7_writeByte
;Click_Color7_DSPIC.c,54 :: 		color7_writeByte(_COLOR7_REG_RGBC_TIME, _COLOR7_RGBC_TIME_700ms);
	MOV.B	#__COLOR7_RGBC_TIME_700ms, W11
	MOV.B	#__COLOR7_REG_RGBC_TIME, W10
	CALL	_color7_writeByte
;Click_Color7_DSPIC.c,55 :: 		mikrobus_logWrite("--- Start measurement --- ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr3_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,56 :: 		}
L_end_applicationInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:

;Click_Color7_DSPIC.c,58 :: 		void applicationTask()
;Click_Color7_DSPIC.c,60 :: 		colorValue = color7_getColorValue();
	PUSH	W10
	PUSH	W11
	CALL	_color7_getColorValue
	MOV	W0, _colorValue
	MOV	W1, _colorValue+2
;Click_Color7_DSPIC.c,61 :: 		isColor = color7_getColor(colorValue);
	MOV.D	W0, W10
	CALL	_color7_getColor
	MOV	#lo_addr(_isColor), W1
	MOV.B	W0, [W1]
;Click_Color7_DSPIC.c,63 :: 		switch(isColor)
	GOTO	L_applicationTask2
;Click_Color7_DSPIC.c,65 :: 		case 1:
L_applicationTask4:
;Click_Color7_DSPIC.c,67 :: 		mikrobus_logWrite("--- Color: ORANGE ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr4_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,68 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,70 :: 		case 2:
L_applicationTask5:
;Click_Color7_DSPIC.c,72 :: 		mikrobus_logWrite("--- Color: RED ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr5_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,73 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,75 :: 		case 3:
L_applicationTask6:
;Click_Color7_DSPIC.c,77 :: 		mikrobus_logWrite("--- Color: PINK ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr6_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,78 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,80 :: 		case 4:
L_applicationTask7:
;Click_Color7_DSPIC.c,82 :: 		mikrobus_logWrite("--- Color: PURPLE ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr7_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,83 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,85 :: 		case 5:
L_applicationTask8:
;Click_Color7_DSPIC.c,87 :: 		mikrobus_logWrite("--- Color: BLUE ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr8_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,88 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,90 :: 		case 6:
L_applicationTask9:
;Click_Color7_DSPIC.c,92 :: 		mikrobus_logWrite("--- Color: CYAN ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr9_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,93 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,95 :: 		case 7:
L_applicationTask10:
;Click_Color7_DSPIC.c,97 :: 		mikrobus_logWrite("--- Color: GREEN ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr10_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,98 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,100 :: 		case 8:
L_applicationTask11:
;Click_Color7_DSPIC.c,102 :: 		mikrobus_logWrite("--- Color: YELLOW ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr11_Click_Color7_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Color7_DSPIC.c,103 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,105 :: 		default:
L_applicationTask12:
;Click_Color7_DSPIC.c,107 :: 		break;
	GOTO	L_applicationTask3
;Click_Color7_DSPIC.c,109 :: 		}
L_applicationTask2:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__applicationTask18
	GOTO	L_applicationTask4
L__applicationTask18:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__applicationTask19
	GOTO	L_applicationTask5
L__applicationTask19:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__applicationTask20
	GOTO	L_applicationTask6
L__applicationTask20:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__applicationTask21
	GOTO	L_applicationTask7
L__applicationTask21:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__applicationTask22
	GOTO	L_applicationTask8
L__applicationTask22:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__applicationTask23
	GOTO	L_applicationTask9
L__applicationTask23:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__applicationTask24
	GOTO	L_applicationTask10
L__applicationTask24:
	MOV	#lo_addr(_isColor), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA NZ	L__applicationTask25
	GOTO	L_applicationTask11
L__applicationTask25:
	GOTO	L_applicationTask12
L_applicationTask3:
;Click_Color7_DSPIC.c,110 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_Color7_DSPIC.c,111 :: 		}
L_end_applicationTask:
	POP	W11
	POP	W10
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;Click_Color7_DSPIC.c,113 :: 		void main()
;Click_Color7_DSPIC.c,115 :: 		systemInit();
	CALL	_systemInit
;Click_Color7_DSPIC.c,116 :: 		applicationInit();
	CALL	_applicationInit
;Click_Color7_DSPIC.c,118 :: 		while (1)
L_main13:
;Click_Color7_DSPIC.c,120 :: 		applicationTask();
	CALL	_applicationTask
;Click_Color7_DSPIC.c,121 :: 		}
	GOTO	L_main13
;Click_Color7_DSPIC.c,122 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
