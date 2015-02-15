.arm
.text
.global main

main:
STMDB R13!, {R0-R12, R14} 

MOV R0, #0x20
MOV R1, R0, LSL #2
MVN R2, R1, LSL #1

LDR R3, =Values
LDR R4, [R3], #4
LDRB R5, [R3], #2
LDRSH R6, [R3], #2
LDR R3, =Stack
STMIA R3!, {R0-R2, R4-R6}
LDMDB R3!, {R0-R2}
LDMDB R3!, {R4-R6}

LDMIA R13!, {R0-R12, PC}

.data
Values:
.word 0xCAFEBABA
.word 0x82345678
Stack:
.word 0,0,0,0
.word 0,0,0,0