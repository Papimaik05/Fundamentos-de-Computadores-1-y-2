/*-----------------------------------------------------------------
**
**  Fichero:
**    rutinas_asm.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**
**
**  Notas de diseño:
**  Miguel Mateos Matias ---> Grupo B
**---------------------------------------------------------------*/

.global contarUnos


.text

contarUnos:
  		push {r4-r8} // Guardamos el valor de R4 a R8
        mov r4,#0 //Declaramos i (i=0)

for:    cmp r4,r2 //Comparamos i con el numero de filas
        bge fin //Si i es mayor que el numero de filas,vamos a fin
        mov r6,#0 //Vector[i]=0;
        mov r5,#0 //Declaramos j (j=0)

for2:   cmp r5,r3 //Comparamos j con el numero de columnas
        bge fin2 //Si j es mayor que el numero de columnas vamos a fin2
        mov r7,#0
        mul r7,r4,r3 //R7= (i * numero de columnas )
        add r7,r7,r5 //R7=(i * numero de columnas ) + j
        ldr r8,[r0,r7,lsl#2]// Creamos el array necesario
        cmp r8,#1 //Comparamos el array creado con 1
        bne else  //Si es distinto vamos a else
        add r6,r6,#1 // vector[i]++;

else:  add r5,r5,#1 //j++
       b for2 //vuelta al for 2


fin2:  str r6,[r1,r4,lsl#2] //Guardamos el valor de V(i)
       add r4,r4,#1 //i++
       b for


fin:   pop {r4-r8} //Recuperamos los valores de r4-r8
       //mov pc,lr
       bx lr



/*void contarUnos(int mat[N][M], int vector[], int nfilas, int ncols) {
    int i,j;

    for (i=0;i<nfilas;i++) {
        vector[i]=0;
        for (j=0; j<ncols; j++) {
            if ( mat[i][j] == 1) vector[i]++;
        }
    }
}*/
