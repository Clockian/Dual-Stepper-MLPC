/* Mode.pde
Contributers:
    Jasque Saydyk
	
Purpose: Control the manuel mode of the stepper motor
*/
#include <Mode.h>
#include <Switch.h>
#include <StepperMotor.h>

Mode::Mode(StepperMotor m1, StepperMotor m2, Switch S1, Switch S2)
    :motor1(m1), motor2(m2), SW1(S1), SW2(S2)
    {
    }

void Mode::init_var(){
    motor1.init_var();
    motor2.init_var();
    SW1.init_var();
    SW2.init_var();
}

void Mode::off(){
    motor1.off();
    motor2.off();
}

void Mode::move_laser(int targetX, int targetY){
    if(motor1.get_motorStep() < targetX){
        motor1.run_motor(true);
    }
    if (motor1.get_motorStep() > targetX){
        motor1.run_motor(false);
    }
    if(motor2.get_motorStep() < targetY){
        motor2.run_motor(true);
    }
    if (motor2.get_motorStep() > targetY){
        motor2.run_motor(false);
    }
}

void Mode::manual(){
    if (SW1.on_off() == 0 && SW2.on_off() == 0){ //Home
        move_laser(0, 0); 
    } 
    if (SW1.on_off() == 1 && SW2.on_off() == 0){ //C
        move_laser(0, 32); 
    }
    if (SW1.on_off() == 0 && SW2.on_off() == 1){ //B
        move_laser(-32, -32); 
    }
    if (SW1.on_off() == 1 && SW2.on_off() == 1){ //A
        move_laser(32, -32); 
    }
}

void Mode::automatic(){
    move_laser(0, 32); //C
    delay(3000);
    move_laser(-32, -32); //B
    delay(3000);
    move_laser(32, -32); //A
    delay(3000);
    move_laser(0, 0); //Home
    delay(3000);
}
