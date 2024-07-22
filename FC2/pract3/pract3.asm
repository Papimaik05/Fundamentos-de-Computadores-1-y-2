/*-----------------------------------------------------------------
**
**  Fichero:
**    pract3a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
**    Utiliza una subrutina que devuelve la posición del valor
**    máximo de un vector de enteros positivos
**
**    Miguel Mateos Matias  Grupo B
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4

.text
start:
		ldr R5,=A  //Introduzco la dirección de A en R1
		ldr R6,=B  //Introduzco la dirección de B en R2
		mov R7,#0 //Inicializamos j


for:	cmp R7,#N //comparamos j con n
        bge fin  //Si j es mayor que  N ,vamos al final
        mov R0,R5 // Primer parametro en R0(A)
        mov R1,#N //Segundo Parámetro en R1(#N)
        BL max  //Nos dirigimos a nuestra subrutina,guarda en r14(lr) la direccion siguiente de bl
        ldr R8,[R5,R0,lsl#2] //Creamos el array A[ind]
        str R8,[R6,R7,lsl#2] //Guardamos el valor que hay en A[ind] en la direccion de memoria de B[j]
        mov R8,#0 //A[ind]=0
        str R8,[R5,R0,lsl#2] //Guardamos en la posicion de A[ind] un 0
        add R7,R7,#1 //j++
        b for //volvemos a for

fin:
        mov R0,R6 // B
        mov R1,R5 //a
        mov R2,#N
        bl copia
        b . //fin

max:    push {R4,R5} //Guardas el valor de R4
        mov R3,#0 //inicializamos max
        mov R5,#0 //inicializamos i
        mov R2,#0 //inicializamos ind

mbuc:   cmp R5,R1 //comparamos i con N
        bge fdf //Si i es mayor que n,vamos a fdf
        ldr R4,[R0,R5,lsl#2] //Creamos el array A[i]
        cmp R3,R4 //comparamos max con el array mencionado anteriormente
        bge else //Si max es mayor que el array vamos a else
        mov R3,R4 // max=A[i]
        mov R2,R5 // ind=i

else:   add r5,r5,#1 // i++
        b mbuc //Volvemos a mbuc

fdf:    mov R0,R2 //Guardamos lo que hemos obtenido en la subrutina en r0
        pop {R4,R5}//Restauras el valor de R4
        mov pc,lr //Retorno a la funcion llamante

copia:  push {R4}
        mov R3,#0              //iniciliazamos i

bucsub: cmp R3,R2              //comparamos i con la longitud
        bge finsub2
		ldr R4,[R0,R3,LSL#2]	//guardamos en R4 B[i]
		str R4,[R1,R3,LSL#2]	//guardamos en A[i] el registro R4
		add R3,R3,#1			//aumentamos i --> i++
		b bucsub				//vuelve al inicio del bucle de la subrutina
finsub2:
		mov R0, R1
		pop {R4}				//Recuperamos los posibles valores que hubiese en R4 y R5 que habiamos protegido al principio de la subrutina
		mov pc, lr				//Vuelta a la funcion llamante (viene a ser un return de c)

		.end


