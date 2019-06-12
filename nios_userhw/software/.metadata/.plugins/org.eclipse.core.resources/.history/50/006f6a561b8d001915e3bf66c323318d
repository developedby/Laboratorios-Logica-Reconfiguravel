#include <stdint.h>
#include "system.h"

int main(void)
{
   volatile uint32_t *uart = (volatile uint32_t*) UART_BASE;
   char *str = "Hello from NIOS II\n";

   while (1)
   {
      char *ptr = str;
      while (*ptr != '\0')
      {
         while ((uart[2] & (1<<6)) == 0);
         uart[1] = *ptr;
         ptr++;
      }
   }

   return 0;
}
