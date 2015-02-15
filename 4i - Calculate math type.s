.arm
.text
.global main

main:

STMDB R13!, {R0-R12, R14}
LDR R0 ,= Values
LDR R1 ,= Const
LDR R6 ,= Results

BL SubR
ADD R0, R0, #0x03
ADD R6, R6, #0x01
BL SubR
ADD R0, R0, #0x03
ADD R6, R6, #0x01
BL SubR
ADD R0, R0, #0x03
ADD R6, R6, #0x01
BL SubR

LDMIA R13!, {R0-R12, R14}

@end of main

SubR:
STMDB R13!, {R0-R12}
LDRB R3, [R0]
LDRB R4, [R1]
MUL R2, R3, R4

LDRB R3, [R0, #1]
LDRB R4, [R1, #1]

MLA R2, R3, R4, R2 					@ a0*z0 + b0*z1

LDRB R3, [R0, #2]
LDRB R4, [R1, #2]

MUL R5, R3, R4 						@ c0*z2
SUB R2, R2, R5						@ a0*z0 + b0*z1 - c0*z2 == R2

MOV R3, #0x05
MUL R1, R2, R3
MOV R0, R1, LSR #6	@ R0 = 5*(  )/64

STRB R0, [R6]

LDMIA R13!, {R0-R12}
MOV PC, LSR

.data
Values:
.byte 0x02, 0x03, 0x04
.byte 0x10, 0x05, 0x06
.byte 0x0B, 0x02, 0x0D
.byte 0x01, 0x0C, 0x08

Const:
.byte 0x04, 0x07, 0x05, 0x00, 0x00

Results:
.byte 0x00, 0x00, 0x00, 0x00		@ 0x00, 0x05, 0xFF, 0x03