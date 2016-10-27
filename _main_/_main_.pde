/* main.pde
Contributers:
    Jasque Saydyk
    
Purpose: Run the Dual Stepper Motors Laser Pointer Control Program
*/
#include <IOShieldOled.h>
#include <StepperMotor.h>
#include <RunStopSwitch.h>

StepperMotor motor1(70, 71, 72, 73);
StepperMotor motor2(74, 75, 76, 77);
RunStopSwitch switch1(2);

void setup(){
  switch1.init_switch();
  motor1.init_led();
  motor2.init_led();
}

void loop(){
  if(switch1.on_off() == 1){
      motor1.run_motor(true);
      motor2.run_motor(false);
  }
}
