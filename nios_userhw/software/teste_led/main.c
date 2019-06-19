#include <stdint.h>
#include "system.h"
#include "sys/alt_stdio.h"

int main(void)
{
	volatile uint32_t *reg32 = (uint32_t*)0x3008;
	uint32_t i;

   while (1)
   {
	   i = 0x9f; // 1001 1111 write load en 111
	   *reg32 = i;
	   i = 0xe0; // 1110 0000 load 00000
	   *reg32 = i;
	   i = *reg32;
	   alt_printf("%d", i);
	   for (i=0; i<10000000; i++)
		   ;
   }

   return 0;
}
