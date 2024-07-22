/*-------------------------------------------------------------------
**
**  Fichero:
**    button.c  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Contiene las implementación de las funciones
**    para el acceso a los pulsadores de la placa de prototipado
**
**  Notas de diseño:
**
**-----------------------------------------------------------------*/

#include "44b.h"
#include "button.h"

// macros para seleccionar
// los bits 6 y 7 del puerto
#define BUTTONS (0x3 << 6)


void button_init( void )
{
	rPCONG &= ~( 0xF << 12 );
}

unsigned int read_button( int wait )
{
	unsigned int status;
	do {
		status = ~( rPDATG );
		status = status & BUTTONS;
	} while( status == 0 && wait );

	status = (status >> 6) & 0x03;

	return status;
}


