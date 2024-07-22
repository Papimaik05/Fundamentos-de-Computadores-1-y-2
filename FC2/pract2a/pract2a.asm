/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Autom�tica
**    Facultad de Inform�tica. Universidad Complutense de Madrid
**
**  Prop�sito:
**    Busca el valor m�ximo de un vector de enteros positivos
**
**  Notas de dise�o:
**  MIGUEL MATEOS MATIAS GRUPO B
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
max: 	.space 4

.text
start:
		mov r0, #0  //Inicializamos max en 0 (max=0)
		ldr r1,=max //Introduzco la direcci�n de max en R1
		ldr R2,=A   //Introduzco la direcci�n de A en R2
		ldr R4,=N   //Introduzco la direcci�n de N en R4
		mov R3,#0   //Inicializamos i

for:	cmp R3,R4  //Comparamos N e i,para iniciar un bucle for
		bge fin    //Si i es mayor que N , salimos del bucle for y nos dirigimos a fin
		ldr R5,[R2,R3,lsl#2] //Creamos el array A[i]
		cmp R0,R5 //Comparamos max y el array mencionado anteriormente (en un bucle if)
		bge else  //Si max es mayor que el array,nos dirigimos a else
		mov R0,R5 // Igualamos max al array (max=A[i])
		str r0,[r1] //Guardas el valor que hay en R0 en la direccion de memoria de R1

else:	add R3,R3,#1 //Hacemos que aumente el contador i (i++)
		b for  //Vuelves al origen del bucle for

fin:	b .
		.end  //FIN
