	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=INPUT
	LDR R1,=POSITION
	MOV R3,#10
	MOV R4,#76
	MOV R6,#1
	MOV R7,#0
L1	LDR R5,[R0],#4
	ADD R7,#1
	CMP R4,R5
	BEQ LABEL1
	SUBS R3,#1
	BNE L1
	b HERE
LABEL1 STR R6,[R1],#4;
	STR R7,[R1]
HERE B HERE

INPUT DCD 16,84,4,56,76,0,23,4,19
	
	AREA MYDATA,DATA,READWRITE
POSITION DCD 0
		END
	