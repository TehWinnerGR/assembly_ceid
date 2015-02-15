.arm
.text
.global main

main:

STMDB R13!, {R0-R5, R10, R14}

LDR R0 ,= Table_A
LDR R1 ,= Table_B
LDR R2 ,= Table_C

MOV R3, #0

B_Loop:
LDRH R4, [R0], #2
LDRH R5, [R1], #2

ADD R10, R4, R5
STRH R10, [R2]

ADD R3, R3, #1
ADD R2, R2, #2

CMP R3, #0x8
BNE B_Loop

LDMIA R13!, {R0-R5, R10, R14}

.data
Table_A:
.hword 0x7F20,0x39FE, 0x6F16, 0x0B30, 0x2D57, 0x2D72, 0x1742, 0xA886

Table_B:
.hword 0x0113, 0x5912, 0x705A, 0x2059, 0x6217, 0x5343, 0x8C92, 0x43C8

Table_C:
.hword 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
