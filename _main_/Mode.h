/* Mode.h
Contributers:
    Jasque Saydyk
	
Purpose: Control the manuel mode of the stepper motor
*/
#ifndef MODE_H
#define MODE_H

#include <Switch.h>
#include <StepperMotor.h>

class Mode{
	private:
	    StepperMotor motor1;
            StepperMotor motor2;
            Switch SW1;
            Switch SW2;
	public:
	    Mode(StepperMotor m1, StepperMotor m2, Switch S1, Switch S2);
            void init_var();
            void off();
            void move_laser(int targetX, int targetY);
            void manual();
            void automatic();
};
#endif
