/* StepperMotor.pde
Contributers:
    Jasque Saydyk
    
Purpose: Control a single Stepper Motor
*/
#include <IOShieldOled.h>
#include <StepperMotor.h>

StepperMotor::StepperMotor(int L1, int L2, int L3, int L4)
    :LD1(L1), LD2(L2), LD3(L3), LD4(L4), indexM(0), motorTime(250)
    {  
    }

void StepperMotor::set_motorTime(int motor_time){
    motorTime = motor_time;
}

void StepperMotor::init_led(){
    pinMode(LD1, OUTPUT);
    pinMode(LD2, OUTPUT);
    pinMode(LD3, OUTPUT);
    pinMode(LD4, OUTPUT);
    
    digitalWrite(LD1, LOW);
    digitalWrite(LD2, LOW);
    digitalWrite(LD3, LOW);
    digitalWrite(LD4, LOW);
}

void StepperMotor::run_motor(bool direction){
    if (direction == true){ 
        indexM++; 
    }
    else { 
        indexM--; 
    }
    
    indexM = indexM & 3; //Wraps-around logic
    switch (indexM) {
        case 0:
            digitalWrite(LD1, HIGH);
            digitalWrite(LD2, LOW);
            digitalWrite(LD3, LOW);
            digitalWrite(LD4, LOW);
            break;
            
        case 1:
            digitalWrite(LD1, LOW);
            digitalWrite(LD2, LOW);
            digitalWrite(LD3, HIGH);
            digitalWrite(LD4, LOW);
            break;
            
        case 2:
            digitalWrite(LD1, LOW);
            digitalWrite(LD2, HIGH);
            digitalWrite(LD3, LOW);
            digitalWrite(LD4, LOW);
            break;
            
        case 3:
            digitalWrite(LD1, LOW);
            digitalWrite(LD2, LOW);
            digitalWrite(LD3, LOW);
            digitalWrite(LD4, HIGH);
            break;
    }
    delay(motorTime);
}
