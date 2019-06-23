#include <stdint.h>
#include "system.h"
#include "sys/alt_stdio.h"

int main(void)
{
	volatile uint32_t *reg32 = (uint32_t*)0x3008;
	uint32_t i;
	char input_char;
	char nums[10] = {'0','1','2','3','4','5','6','7','8','9'};
	uint32_t out_num;

   while (1)
   {
	   // Recebe um caracter
	   input_char = alt_getchar();

	   // Manda comando de escrever e 0s 3 bits menos significativos
	   i = 0x83; // 100x xx11 write load enable
	   i |= ((input_char & 0x07) << 2);
	   *reg32 = i;

	   // Manda o resto do comando de load e os outros 5 bits
	   i = 0xe0; // 111x xxxx load
	   i |= ((input_char & 0xf8) >> 3);
	   *reg32 = i;

	   // Manda comando para desativar o load e ativar a contagem
	   //i = 0x81; // 1000 0001 write no load enable
	   //*reg32 = i;

	   // Le o numero de 0s e 1s
	   i = 0x60; // 0110 0000 read reg1
	   *reg32 = i;

	   out_num = *reg32;

	   // Printa o caracter inserido
	   alt_putchar(input_char);
	   alt_putchar(' ');
	   for (i=0; i<8; i++)
	   {
		   if (input_char & (1<<(7-i)))
			   alt_putchar('1');
		   else
			   alt_putchar('0');
	   }
	   alt_putchar('\n');

	   // Printa o numero de 0s e 1s
	   alt_putchar('0');
	   alt_putchar(':');
	   alt_putchar(nums[out_num & 0xff]);
	   alt_putchar('\n');
	   alt_putchar('1');
	   alt_putchar(':');
	   alt_putchar(nums[(out_num>>8) & 0xff]);
	   alt_putchar('\n');
	   alt_putchar('\n');
   }

   return 0;
}
