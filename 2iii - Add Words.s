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
LDR R4, [R0], #4
LDR R5, [R1], #4

ADD R10, R4, R5
STR R10, [R2]

ADD R3, R3, #1
ADD R2, R2, #4

CMP R3, #0x4
BNE B_Loop

LDMIA R13!, {R0-R5, R10, R14}

.data
Table_A:
.word 0x39FE7F20, 0x0B306F16, 0x2D722D57, 0xA8861742

Table_B:
.word 0x59120113, 0x2059705A, 0x53436217, 0x43C88C92

Table_C:
.word 0x00000000, 0x00000000, 0x00000000, 0x00000000
