/*-------------------------------------------------------------------
**
**  Fichero:
**    utils.c  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Contiene las implementaciones de funciones auxiliares
**
**  Notas de diseño:
**
**-----------------------------------------------------------------*/

#include "utils.h"

#define LOOP_COUNT (487)

/* Función que realiza una espera activa de time milisegundos */
void Delay( int time )
{
	int i;

	// Bucle de espera activa
	for( ; time>0; time--)
		for( i=LOOP_COUNT; i; i-- );
}
