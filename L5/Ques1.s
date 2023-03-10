	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA MYCODE,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=DST
L2	MOV R1,R0
	MOV R3,R0
	ADD R3,#4
	ADD R10,R9,#1 ;R10 NO. OF COMPARISONS,R9 COUNTER FOR i
L1	LDR R4,[R3]
	LDR R7,[R1]
	CMP R4,R7
	BCS UP
	MOV R1,R3;R1 IS MIN,R1 POINTS TO R3
UP	ADD R3,#4
	ADD R10,#1
	CMP R10,#5
	BNE L1
	LDR R2,[R0] ;LOAD DATA FOR SWAPPING
	LDR R6,[R1] ;LOAD DATA FOR SWAPPING
	STR R2,[R1]	;SWAP AND STORE
	STR R6,[R0] ;SWAP AND STORE
	ADD R0,#4
	ADD R9,#1
	CMP R9,#4
	BNE L2
STOP B STOP
	AREA MYDATA,DATA,READWRITE
DST DCD 0,0,0,0,0
	END
	
	
	
	