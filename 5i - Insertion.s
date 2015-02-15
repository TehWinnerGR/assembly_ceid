.arm		
.text
.global main

main:
STMDB R13!, { R0 - R12, R14 }

LDR R0, =Table
MOV R1, #6       			@number of elements

BL Insertion


LDMIA R13!, { R0- R12, R14 }
@END OF MAIN

@SUBROUTINE

Insertion:
STMDB R13!, { R0- R12 }

LDR R2, [ R0, #0 ]			@ init small 
MOV R3, #0					@ position of the first element 
MOV R4, #0					@ position of the small element
MOV R5, #1					@ position of the next item


@ kai o R5

	Loop1:
	
	ADD R5, R3, #1
	LDR R2, [ R0, R3 ]
	MOV R4, R3
		
		Loop2:		

		LDR R6, [ R0, R5]
		
		CMP R2, R6
		MOVHI R4, R5		@ swap positions
		
		CMP R2, R6	
		MOVHI R2, R6		@ swap number

		ADD R5, R5, #1
		CMP R5, R1		
		BLO Loop2

	LDR R7, [ R0, R3 ]	
	STR R2, [ R0, R3 ]
	STR R7, [ R0, R4 ]	
	ADD R3, R3, #1		   
	
	SUB R1, R1, #1
	
	CMP R3, R1 
	BLO Loop1


LDMIA R13!, { R0 - R12 }
MOV PC, BR
@END OF SUBROUTINE


.data

Table:
.byte 0x10, 0x03, 0x08, 0x04, 0x01, 0x09, 0x02, 0x07, 0x06, 0x05, 0x14, 0x0c, 0x11, 0x0e, 0x0f, 0x13, 0x0d, 0x12, 0x0b, 0x0a