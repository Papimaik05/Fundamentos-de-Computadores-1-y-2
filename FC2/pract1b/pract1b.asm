/*-----------------------------------------------------------------
**
**  Fichero:
**    pract1b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Divide 2 números mediante el algoritmo de restas parciales
**
**  Notas de diseño:
**  NOMBRE:Miguel Mateos Matias
    Grupo:B
**---------------------------------------------------------------*/

.global start

.data
A: .word 0x0A
B: .word 0x02


.bss
C: .space 4

.text
start:
		LDR R4, =A   //Introduzco la dirección de A en R4
		LDR R5, =B   //Introduzco la dirección de B en R5
		LDR R6, =C   //Introduzco la dirección de C en R6
		LDR R1,[R4]  //Introduzco el valor que hay en la direccion de R4 en R1
		LDR R2,[R5]  //Introduzco el valor que hay en la direccion de R5 en R2
		MOV R3,#0    //Inicializo C (C=0)
loop:	CMP R1,R2    //Comparamos R1 y R2(A y B)
		BLT fin      //Si es menor que ,nos dirige a fin
		SUB R1,R1,R2 //A=A-B
		ADD R3,R3,#1 //C=C+1
		B loop       //Vuelves al origen del bucle
fin:	STR R3,[R6]  //Guardas el valor que hay en R3 en la direccion de memoria de R6
		B .
		.end         //Fin
