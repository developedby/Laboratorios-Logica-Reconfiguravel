#include <stdint.h>
#include <stdbool.h>
#include "driverlib/sysctl.h"
#include "driverlib/timer.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "inc/tm4c1294ncpdt.h"
#include "inc/hw_gpio.h"
#include "driverlib/pin_map.h"
#include "inc/hw_memmap.h"

static bool oe = true;
static const uint8_t poll_cmd[24][5] = 
{
	{0, 0, 0, 0, 2}, {0, 2, 2, 2, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 2, 2, 2, 2}, {0, 2, 2, 2, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}
};
static const uint8_t poll_rumble_cmd[25][4] = 
{
	{0, 0, 0, 2}, {0, 2, 2, 2}, {0, 0, 0, 2}, {0, 0, 0, 2},
	{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2},
	{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2},
	{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 2, 2, 2}, {0, 2, 2, 2},
	{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2},
	{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}, {0, 2, 2, 2},
	{0, 2, 2, 2}
};
static const uint8_t init_cmd[8][5] = 
{
	{0,0,0,0,2},{0,0,0,0,2},{0,0,0,0,2},{0,0,0,0,2},
	{0,0,0,0,2},{0,0,0,0,2},{0,0,0,0,2},{0,0,0,0,2}
};

static const uint8_t reset_cmd[8][5] = 
{
	{0, 2, 2, 2, 2},{0, 2, 2, 2, 2},{0, 2, 2, 2, 2},{0, 2, 2, 2, 2},
	{0, 2, 2, 2, 2},{0, 2, 2, 2, 2},{0, 2, 2, 2, 2},{0, 2, 2, 2, 2}
};

static const uint8_t stop_bit[4] = {0, 2, 2, 2};
static int i = 0;
static int j = 0;
static uint8_t reading[20000];
static uint8_t cmd = 0;
static bool stop = false;

int main (void)
{
	
	uint32_t SysClock;
	uint32_t ui32Period;
	int lixo = 0;
	
	SysClock = SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480), 120000000);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOG);
	
	GPIO_PORTG_AHB_DIR_R |= GPIO_PIN_1;
	GPIO_PORTG_AHB_DEN_R |= GPIO_PIN_1;
	GPIO_PORTG_AHB_AFSEL_R = 0;
	GPIO_PORTG_AHB_AMSEL_R = 0;
	GPIO_PORTG_AHB_PCTL_R = 0;
	GPIO_PORTG_AHB_ODR_R = 0;
	GPIO_PORTG_AHB_PUR_R |= GPIO_PIN_1;
	GPIO_PORTG_AHB_DR8R_R |= GPIO_PIN_1;
	//GPIO_PORTG_AHB_PDR_R |= GPIO_PIN_1;
	
	GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, GPIO_PIN_1);
	
	for (lixo = 0; lixo < 2000; lixo++)
		;
	lixo = 0;
	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
	TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
	ui32Period = (SysClock/1000000);
	TimerLoadSet(TIMER0_BASE, TIMER_A, ui32Period -1);
	IntEnable(INT_TIMER0A);
	TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	IntMasterEnable();
	TimerEnable(TIMER0_BASE, TIMER_A);
	while(1)
	{
		if(oe == false && reading[i] == 2)
		{
			lixo++;
			if(lixo > 30000)
				i = 0;
		}
	}
}

void TIMER0A_Handler(void)
{
	// Clear the timer interrupt
	TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

	if (oe)
	{
		switch (cmd)
		{
			case 0:
				if (!stop)
				{
					GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, reset_cmd[i][j]);
					j++;
					if (j == 5)
					{
						j = 0;
						i++;
					}
					if (i == 8)
					{
						j = 0;
						i = 0;
						stop = true;
					}
				}
				else
				{
					GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, stop_bit[j]);
					j++;
					if (j == 4)
					{
						oe = false;
						GPIO_PORTG_AHB_DIR_R = 0;
						i = 0;
						j = 0;
						stop = false;
						cmd = 1;
					}
				}
				break;
			case 1:
				if (!stop)
				{
					GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, init_cmd[i][j]);
					j++;
					if (j == 5)
					{
						j = 0;
						i++;
					}
					if (i == 8)
					{
						j = 0;
						i = 0;
						stop = true;
					}
				}
				else
				{
					GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, stop_bit[j]);
					j++;
					if (j == 4)
					{
						oe = false;
						GPIO_PORTG_AHB_DIR_R = 0;
						i = 0;
						j = 0;
						stop = false;
						cmd = 2;
					}
				}
				break;
			case 2:
				if (!stop)
				{
					GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, poll_cmd[i][j]);
					j++;
					if (j == 5)
					{
						j = 0;
						i++;
					}
					if (i == 24)
					{
						j = 0;
						i = 0;
						stop = true;
					}
				}
				else
				{
					GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, stop_bit[j]);
					j++;
					if (j == 4)
					{
						oe = false;
						GPIO_PORTG_AHB_DIR_R = 0;
						i = 0;
						j = 0;
						stop = false;
						cmd = 0;
					}
				}
				break;
		}
	}
	else
	{
		if (i < 5000)
		{
			reading[i] = GPIOPinRead(GPIO_PORTG_AHB_BASE, GPIO_PIN_1);
			i++;
		}
		else
		{
			oe = true;
			i = 0;
			j = 0;
			GPIO_PORTG_AHB_DIR_R |= GPIO_PIN_1;
		}
	}
	
}
