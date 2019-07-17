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

#include "joy.h"
#include "buttons.h"

#define STOP_BIT_SAMPLES 7

static bool reading_command = false;
static bool outputting_states = false;

static uint8_t command_sample[STOP_BIT_SAMPLES];
static int sample_it;

#define STATES_SIZE 65

static uint8_t states[STATES_SIZE][5] =
{
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 2, 2, 2, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2}, {0, 0, 0, 0, 2},
	{0, 2, 2, 2, 2},
};
static int bit_it;
static int bit_frac_it;

void commandStarted(void);

int main (void)
{
	uint32_t SysClock;
	uint32_t ui32Period;
	uint32_t delay;
	
	SysClock = SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480), 120000000);
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOG);
	
	joy_init();
	button_init();
	
	GPIO_PORTG_AHB_DIR_R = 0;
	GPIO_PORTG_AHB_DEN_R |= GPIO_PIN_1;
	GPIO_PORTG_AHB_AFSEL_R = 0;
	GPIO_PORTG_AHB_AMSEL_R = 0;
	GPIO_PORTG_AHB_PCTL_R = 0;
	GPIO_PORTG_AHB_PUR_R |= GPIO_PIN_1;
	GPIO_PORTG_AHB_DR8R_R |= GPIO_PIN_1;
	
	for (delay = 0; delay < 100000000; delay++)
		;
	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
	TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
	ui32Period = (SysClock/1000000);
	TimerLoadSet(TIMER0_BASE, TIMER_A, ui32Period -1);
	IntEnable(INT_TIMER0A);
	TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	IntMasterEnable();
	TimerEnable(TIMER0_BASE, TIMER_A);

	GPIOIntRegister(GPIO_PORTG_BASE, commandStarted);
	GPIOIntTypeSet(GPIO_PORTG_BASE, GPIO_PIN_2, GPIO_FALLING_EDGE);
	GPIOIntClear(GPIO_PORTG_BASE, GPIO_PIN_2);

	while(true)
	{
		int i;
		uint16_t joystick_x, joystick_y;
		bool a, b;
		a = button_read_s1();
		b = button_read_s2();
		joystick_x = joy_read_x();
		joystick_y = joy_read_y();
		
		if(!outputting_states)
		{
			if(a)
			{
				states[7][0] = 0;
				states[7][1] = 2;
				states[7][2] = 2;
				states[7][3] = 2;
				states[7][4] = 2;
			}
			else
			{
				states[7][0] = 0;
				states[7][1] = 0;
				states[7][2] = 0;
				states[7][3] = 0;
				states[7][4] = 2;
			}
			
			if(b)
			{
				states[6][0] = 0;
				states[6][1] = 2;
				states[6][2] = 2;
				states[6][3] = 2;
				states[6][4] = 2;
			}
			else
			{
				states[6][0] = 0;
				states[6][1] = 0;
				states[6][2] = 0;
				states[6][3] = 0;
				states[6][4] = 2;
			}
			
			for(i = 0; i < 16; i++)
			{
				if((joystick_x >> i) & 1)
				{
					states[16+i][0] = 0;
					states[16+i][1] = 2;
					states[16+i][2] = 2;
					states[16+i][3] = 2;
					states[16+i][4] = 2;
				}
				else
				{
					states[16+i][0] = 0;
					states[16+i][1] = 0;
					states[16+i][2] = 0;
					states[16+i][3] = 0;
					states[16+i][4] = 2;
				}
				
				if((joystick_y >> i) & 1)
				{
					states[24+i][0] = 0;
					states[24+i][1] = 2;
					states[24+i][2] = 2;
					states[24+i][3] = 2;
					states[24+i][4] = 2;
				}
				else
				{
					states[24+i][0] = 0;
					states[24+i][1] = 0;
					states[24+i][2] = 0;
					states[24+i][3] = 0;
					states[24+i][4] = 2;
				}
			}
		}
	}
}

void commandStarted(void)
{
	int i;
	sample_it = 0;
	for(i = 0; i < STOP_BIT_SAMPLES; i++)
		command_sample[i] = 0xF;
	reading_command = true;
}

void TIMER0A_Handler(void)
{
	int i;
	bool stop_bit;
	// Clear the timer interrupt
	TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	
	if(reading_command)
	{
		command_sample[sample_it] = GPIOPinRead(GPIO_PORTG_AHB_BASE, GPIO_PIN_1);
		
		sample_it++;
		if(sample_it == STOP_BIT_SAMPLES)
			sample_it = 0;
		
		stop_bit = true;
		for(i = 0; i < STOP_BIT_SAMPLES; i++)
			if(command_sample[i] != 1)
				stop_bit = false;
		if(stop_bit)
		{
			reading_command = false;
			outputting_states = true;
			bit_it = 0;
			bit_frac_it = 0;
			GPIO_PORTG_AHB_DIR_R |= GPIO_PIN_1;
		}
	}

	if(outputting_states)
	{
		GPIOPinWrite(GPIO_PORTG_AHB_BASE, GPIO_PIN_1, states[bit_it][bit_frac_it]);
		
		bit_frac_it++;
		if(bit_frac_it == 5)
			bit_frac_it = 0;
		
		bit_it++;
		if(bit_it == STATES_SIZE)
		{
			outputting_states = false;
			GPIO_PORTG_AHB_DIR_R = 0;
		}
	}
}
