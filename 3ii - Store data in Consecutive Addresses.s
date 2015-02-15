.arm
.text
.global main

main:

STMDB R13! , { R0- R1 , R14 }

LDR R1 ,= Stor

MOV R0 , #0x00
STRB R0, [ R1 ]	, #1
ADD R0, R0, #0x01
STRB R0, [ R1 ]	, #1
ADD R0, R0, #0x01
STRB R0, [ R1 ]	, #1
ADD R0, R0, #0x01
STRB R0, [ R1 ]	, #1
ADD R0, R0, #0x01
STRB R0, [ R1 ]	, #1
ADD R0, R0, #0x01
STRB R0, [ R1 ]	

LDMIA R13! , { R0- R1 , R14 }

.data

Stor:
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00