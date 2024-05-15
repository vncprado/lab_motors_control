/*
 * avr_FingerTimer.h
 *
 * Created: 02/11/2015 11:12:48
 * Author: Olly McBride
 *
 * This work is licensed under the Creative Commons Attribution 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.
 *
 */ 

#if defined(ARDUINO_ARCH_AVR)

#ifndef AVR_FINGERTIMER_H_
#define AVR_FINGERTIMER_H_

#include <Arduino.h>

// select timer frequency
//#define TIMER_10KHZ
//#define TIMER_5KHZ
#define TIMER_2KHZ
//#define TIMER_1KHZ

#if defined(TIMER_10KHZ)
#define TIMER_FREQ 10			// timer frequency in KHz
//#define CC_REG_VAL 319			// compare capture reg val
#define CC_REG_VAL 1500			// compare capture reg val
#elif defined(TIMER_5KHZ)
#define TIMER_FREQ 5			// timer frequency in KHz
//#define CC_REG_VAL 640			// compare capture reg val
#define CC_REG_VAL 3000			// compare capture reg val
#elif defined(TIMER_2KHZ)
#define TIMER_FREQ 2			// timer frequency in KHz
//#define CC_REG_VAL 1599			// compare capture reg val
#define CC_REG_VAL 7500			// compare capture reg val
#elif defined(TIMER_1KHZ)
#define TIMER_FREQ 1			// timer frequency in KHz
//#define CC_REG_VAL 3198			// compare capture reg val
#define CC_REG_VAL 15000		// compare capture reg val
#endif

#define ms(val)		((val)*(TIMER_FREQ))		// number of timer ticks per ms

// calculate number of timer ticks per ms for each timer function
#define MILLI_TIME        ms(1)					// 1ms		1kHz
#define MOTOR_CTRL_TIME   ms(5)					// 5ms		200Hz

#define NOT_A_PWM_PIN	(-1)
#define PWM_pin_to_timer(p) ( (((p) == 4) || ((p) == 13)) ? 0 : \
								( (((p) == 11) || ((p) == 12)) ? 1 : \
								( (((p) == 9) || ((p) == 10)) ? 2 : \
								( (((p) == 2) || ((p) == 3) || ((p) == 5)) ? 3 : \
								( (((p) == 6) || ((p) == 7) || ((p) == 8)) ? 4 : \
								( (((p) == 44) || ((p) == 45) || ((p) == 46)) ? 5 : \
								NOT_A_PWM_PIN  ) ) ) ) ) )

// function prototypes
void _posCtrlTimerSetup(void);
void _changePWMFreq(void);

void _passMotorPtr(void (*f)(void));
void _attachFuncToTimer(void (*f)(void));

#endif /* AVR_FINGERTIMER_H_ */
#endif /* defined(ARDUINO_ARCH_AVR) */