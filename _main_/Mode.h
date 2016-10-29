/* Mode.h
Contributers:
    Jasque Saydyk
	
Purpose: Control the manuel mode of the stepper motor
*/
#ifndef MODE_H
#define MODE_H

#include <Switch.h>
#include <StepperMotor.h>
#include <Oled.h>

class Mode{
    private:
        StepperMotor motorX;
        StepperMotor motorY;
        Switch SW1;
        Switch SW2;
        bool waitState;
        int positionState; //Home=0, A=1, B=2, C=3
        int waitTime;
        Oled oled;
    public:
        Mode(StepperMotor mX, StepperMotor mY, Switch S1, Switch S2);
        void init_var();
        void off();
        void move_laser(int targetX, int targetY);
        void show_status();
        void manual();
        void automatic();
};
#endif
