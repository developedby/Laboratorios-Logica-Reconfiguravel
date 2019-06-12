#include <stdint.h>
#include "system.h"
#include "sys/alt_stdio.h"

int main(void)
{
	char echo;

   while (1)
   {
	   echo = alt_getchar();
	   alt_putchar(echo);
   }

   return 0;
}
