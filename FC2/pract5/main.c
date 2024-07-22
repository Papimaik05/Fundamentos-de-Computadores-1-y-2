/*-----------------------------------------------------------------
**
**  Fichero:
**    main.c  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Hace paradear los leds a una frecuencia de 1 Hz
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

#include "leds.h"
#include "button.h"
#include "D8Led.h"
#include "utils.h"

int main(void)
{

	/* Opción 1 */
	int segmento=0;
	int direccion=1;
	int movimiento=1;
	
	/* Opción 2 */
	int cadena = 0;
	int p = 1;
	int car = 0;

	/* Ambas */
	int muestras = 0;
	unsigned int pulsador;
		
    leds_init();
    button_init();
    D8Led_init();

	/* Guiones */
    while( 1 ){
        leds_switch();
        // espera 1s
        Delay( 1000 );
    }
	
	/* Opción 1 */
	while( 1 ){
		muestras++;
		// no esperamos
		pulsador = read_button( 0 );
		if( pulsador & PULSADOR1 ){
			direccion = -direccion;
		}
		if( pulsador & PULSADOR2 ){
			if( movimiento )
				movimiento = 0;
			else
				movimiento = 1;
		}
		if( muestras == 5 ){
			muestras = 0;
			leds_switch();
			D8Led_segment( segmento );

			segmento = (segmento + 1*direccion*movimiento);
			if( segmento == -1 )
				segmento = 5;
			else if ( segmento == 6 )
				segmento = 0;
		}
		// espera 200ms
		Delay( 200 );
	}

	/* Opción 2 */
	while( 1 ){
		muestras++;
		// no esperamos
		pulsador = read_button( 0 );
		if( pulsador & PULSADOR1 ){
			p = (p + 1) & 0x01;
		}
		if( pulsador & PULSADOR2 ){
			cadena = (cadena + 1) & 0x01;
			car = 0;
		}

		if( ( muestras / periodos[p] )*periodos[p] == muestras ){
		//if( ( muestras % periodos[p] ) == 0 ){
			leds_switch();
			D8Led_letter( cadenas[cadena][car] );
			car++;
			if( cadenas[cadena][car] == '\0' )
				car = 0;
		}

		if( muestras == 10 )
			muestras = 0;

		// espera 100ms
		Delay( 100 );
	}

	
    return 0;
}


