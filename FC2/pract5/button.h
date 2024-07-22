/*-------------------------------------------------------------------
**
**  Fichero:
**    button.h  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Contiene las declaraciones de los prototipos de funciones
**    para el acceso a los pulsadores de la placa de prototipado
**
**  Notas de diseño:
**
**-----------------------------------------------------------------*/

#ifndef BUTTON_H_
#define BUTTON_H_

#define PULSADOR1 0x01
#define PULSADOR2 0x02

void button_init( void );
unsigned int read_button( int wait );

#endif
