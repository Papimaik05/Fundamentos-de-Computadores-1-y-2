/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
** MIGUEL MATEOS MATIAS GRUPO B
**---------------------------------------------------------------*/

.EQU 	N, 8

.global start

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4
max: 	.space 4
ind: 	.space 4

.text
start:
		ldr R1,=A  //Introduzco la dirección de A en R1
		ldr R2,=B  //Introduzco la dirección de B en R2
		ldr R3,=max //Introduzco la dirección de max en R3
		ldr R4,=ind //Introduzco la dirección de ind en R4
		mov R6,#0 //Inicializamos j


for:	cmp R6,#N //comparamos j con n
        bge fin  //Si j es mayor que  N ,vamos al final
        mov R5,#0 //inicializamos max
        mov R7,#0 //inicializamos i
        mov R9,#0 //inicializamos ind


for2:   cmp R7,#N //comparamos i con N
        bge fbucle //Si i es mayor que n,camos a fbucle
        ldr R8,[R1,R7,lsl#2] //Creamos el array A[i]
        cmp R5,R8 //comparamos max con el array mencionado anteriormente
        bge else //Si max es mayor que el array
        mov R5,R8 // max=A[i]
        mov R9,R7 // ind=i
        str R5,[R3] //Guardas el valor que hay en R10 en la direccion de memoria de R3
        str R9,[R4]  //Guardas el valor que hay en R9 en la direccion de memoria de R4


else:   add R7,R7,#1 //aumentamos la i (i++)
        b for2 //volvemos al for2

fbucle:
        str R5,[R2,R6,lsl#2]  //Guardas el valor que hay en R10 en la direccion de memoria de B[j]
        mov R5,#0 //Reinicias el valor de max
        str R5,[R1,R9,lsl#2] //Guardas el valor que hay en R10 en la direccion de memoria de A[ind]
        add R6,R6,#1 //aumentamos la j (j++)
        b for //volvemos al origen del for
fin:
        b . //fin
        .end


