/* Mode.pde
Contributers:
    Jasque Saydyk
	
Purpose: Control the manuel mode of the stepper motor
*/
#include <Mode.h>
#include <Switch.h>
#include <StepperMotor.h>
#include <Oled.h>
#include <IOShieldOled.h>

Mode::Mode(StepperMotor mX, StepperMotor mY, Switch S1, Switch S2)
    :motorX(mX), motorY(mY), SW1(S1), SW2(S2), waitState(false), positionState(3), waitTime(3000)
    {
    }

void Mode::init_var(){
    motorX.init_var();
    motorY.init_var();
    SW1.init_var();
    SW2.init_var();
    oled.init_var();
    Serial.begin(9600);
}

void Mode::off(){
    motorX.off();
    motorY.off();
    positionState = 3;
    waitState = false;
    oled.wipe();
    oled.print_string("", 0);
    oled.print_string("", 1);
    oled.print_string("", 2);
    oled.print_string("", 3);
}

void Mode::move_laser(int targetX, int targetY){
    if (motorX.get_motorStep() < targetX){
        motorX.run_motor(true);
    }
    if (motorX.get_motorStep() > targetX){
        motorX.run_motor(false);
    }
    if (motorY.get_motorStep() < targetY){
        motorY.run_motor(true);
    }
    if (motorY.get_motorStep() > targetY){
        motorY.run_motor(false);
    }
}

void Mode::show_status(){
    /*char currentStatus1[50] = "X = 1 3 8 9 8";
    currentStatus1[3] = motorX.get_motorStep();
    oled.print_string(currentStatus1, 2);
    oled.update();
    
    char currentStatus2[6] = "Y=";
    currentStatus2[3] = (char) 13;
    oled.print_string(currentStatus2, 3);
    oled.update();*/
    IOShieldOled.setCursor(0,2);
    char currentStatusX[50] = "X=";
    currentStatusX[3] = (char)motorX.get_motorStep();
    Serial.println(motorX.get_motorStep()); 
    IOShieldOled.putString(currentStatusX);
}

void Mode::manual(){
    oled.wipe();
    oled.print_string("Manuel Mode", 0);
    oled.print_string("================", 1);
    show_status();
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
   oled.wipe();
   oled.print_string("Automatic Mode", 0);
   oled.print_string("================", 1);
   show_status();
    if (waitState == true){
        delay(waitTime);
        waitState = false;
    }
    
    if (positionState == 3){ //C
        move_laser(0, 32);
        if (motorX.get_motorStep() == 0 && motorY.get_motorStep() == 32) {
            positionState == 2;
        }
    }
    if (positionState == 2){ //B
        move_laser(-32, -32);
        if (motorX.get_motorStep() == -32 && motorY.get_motorStep() == -32) {
            positionState == 1;
        }
    }
    if (positionState == 1){ //A
        move_laser(32, -32);
        if (motorX.get_motorStep() == 32 && motorY.get_motorStep() == -32) {
            positionState == 0;
        }
    }
    if (positionState == 0){ //Home
        move_laser(0, 0);
        if (motorX.get_motorStep() == 0 && motorY.get_motorStep() == 0) {
            positionState == 3;
        }
    }
}
