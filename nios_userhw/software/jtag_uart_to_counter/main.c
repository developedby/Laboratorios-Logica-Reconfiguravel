/*
 * main.c
 *
 *  Created on: 05/06/2019
 *      Author: Nicolas e Lucca
 */


#include "sys/alt_stdio.h"

int main (void)
{
	char ch;
	while(1)
	{
		ch = alt_getchar();
		alt_putchar(ch);
	}
	return 1;
}
