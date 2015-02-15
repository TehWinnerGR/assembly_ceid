.arm
.text
.global main

@ 6x^6 + 18x^5 + 26x^4 + 32x^3 + 5x^2 + 7x + 4

main:

STMDB R13!, {R0-R12, R14}
LDR R5 ,= Values
LDR R6 ,= Results

MOV R8, #0

MainLoop:

LDR R4, [R5], #4
BL Subrout

ADD R8, R8, #0x01
CMP R8, #0x04
BNE MainLoop

LDMIA R13!, {R0-R12, R14}

@end of main

Subrout:
STMDB R13!, {R0, R2-R12}

LDR R0 ,= Const						@ all "a"

MOV R2, #0x05						@ count "a"
MOV R7, #0x00

LDRB R1, [R0, #6]

Loopa:
LDRB R3, [R0, R2]

MLA R1, R4, R1, R3
SUB R2, R2, #1
ADD R7, R7, #1

CMP R7, #0x06
BNE Loopa

STR R1, [R6], #4

LDMIA R13!, {R0, R2-R12}
MOV PC, LR

.data
Values:
.word 0x10
.word 0x50A
.word 0xCDCA
.word 0x80AB

Const:
.byte 0x04, 0x07, 0x05
.byte 0x20, 0x1A, 0x12, 0x06

Results:
.byte 0x00000000, 0x00000000, 0x00000000, 0x00000000	@ 0x73C0574, , , 