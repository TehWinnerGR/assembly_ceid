.arm
.text
.global main

main:

STMDB R13! , { R1- R4 , R14 }

LDR R1 ,= Stor

MOV R2, #0x01  
MOV R3, #0x02
 
STRB R2, [ R1 ], #1
STRB R3, [ R1 ], #1 


Loopa:

ADD R4, R2, R3

STRB R4, [ R1 ], #1

MOV R2, R3 
MOV R3, R4

CMP R4, #0x0D

BNE Loopa 


LDMIA R13! , { R1- R4 , R14 }


.data

Stor:
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00